//
//  MetalView.m
//  Metal
//
//  Created by Sam Symons on 2014-11-28.
//  Copyright (c) 2014 Sam Symons. All rights reserved.
//

#import "MetalView.h"

#import <Metal/Metal.h>
#import <QuartzCore/CAMetalLayer.h>

@interface MetalView ()

@property (nonatomic, weak) CAMetalLayer *metalLayer;
@property (nonatomic, strong) id<MTLDevice> device;
@property (nonatomic, strong) id<MTLBuffer> positionBuffer;
@property (nonatomic, strong) id<MTLBuffer> colorBuffer;
@property (nonatomic, strong) id<MTLRenderPipelineState> pipeline;

@property (nonatomic, strong) CADisplayLink *displayLink;

@end

@implementation MetalView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self buildDevice];
        [self buildVertexBuffers];
        [self buildPipeline];
    }
    
    return self;
}

+ (Class)layerClass
{
    return [CAMetalLayer class];
}

- (void)didMoveToWindow
{
    if (self.superview)
    {
        self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(displayLinkDidFire:)];
        [self.displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    }
    else
    {
        [self.displayLink invalidate];
        self.displayLink = nil;
    }
}

#pragma mark - Private

- (void)displayLinkDidFire:(CADisplayLink *)displayLink
{
    [self redraw];
}

- (void)buildDevice
{
    _metalLayer = (CAMetalLayer *)[self layer];
    _device = MTLCreateSystemDefaultDevice();
    
    _metalLayer.device = self.device;
    _metalLayer.pixelFormat = MTLPixelFormatBGRA8Unorm;
}

- (void)buildVertexBuffers
{
    static const float positions[] =
    {
        0.0,  0.3, 0, 1,
        -0.5, -0.2, 0, 1,
        0.5, -0.2, 0, 1,
    };
    
    static const float colors[] =
    {
        1, 0, 0, 1,
        0, 1, 0, 1,
        0, 0, 1, 1,
    };
    
    self.positionBuffer = [self.device newBufferWithBytes:positions length:sizeof(positions) options:MTLResourceOptionCPUCacheModeDefault];
    self.colorBuffer = [self.device newBufferWithBytes:colors length:sizeof(colors) options:MTLResourceOptionCPUCacheModeDefault];
}

- (void)buildPipeline
{
    id<MTLLibrary> library = [self.device newDefaultLibrary];
    
    id<MTLFunction> vertexFunc = [library newFunctionWithName:@"vertex_main"];
    id<MTLFunction> fragmentFunc = [library newFunctionWithName:@"fragment_main"];
    
    // Set up the pipeline descriptor:
    
    MTLRenderPipelineDescriptor *pipelineDescriptor = [MTLRenderPipelineDescriptor new];
    pipelineDescriptor.vertexFunction = vertexFunc;
    pipelineDescriptor.fragmentFunction = fragmentFunc;
    pipelineDescriptor.colorAttachments[0].pixelFormat = self.metalLayer.pixelFormat;
    
    self.pipeline = [self.device newRenderPipelineStateWithDescriptor:pipelineDescriptor error:NULL];
}

- (void)redraw
{
    id<MTLCommandQueue> commandQueue = [self.device newCommandQueue];
    id<MTLCommandBuffer> commandBuffer = [commandQueue commandBuffer];
    
    id<CAMetalDrawable> drawable = [self.metalLayer nextDrawable];
    id<MTLTexture> texture = drawable.texture;
    
    MTLRenderPassDescriptor *passDescriptor = [MTLRenderPassDescriptor renderPassDescriptor];
    passDescriptor.colorAttachments[0].texture = texture;
    passDescriptor.colorAttachments[0].loadAction = MTLLoadActionClear;
    passDescriptor.colorAttachments[0].storeAction = MTLStoreActionStore;
    passDescriptor.colorAttachments[0].clearColor = MTLClearColorMake(0.3, 0.3, 0.3, 1.0);
    
    id<MTLRenderCommandEncoder> commandEncoder = [commandBuffer renderCommandEncoderWithDescriptor:passDescriptor];
    [commandEncoder setRenderPipelineState:self.pipeline];
    [commandEncoder setVertexBuffer:self.positionBuffer offset:0 atIndex:0];
    [commandEncoder setVertexBuffer:self.colorBuffer offset:0 atIndex:1];
    [commandEncoder drawPrimitives:MTLPrimitiveTypeTriangle vertexStart:0 vertexCount:3 instanceCount:1];
    [commandEncoder endEncoding];
    
    [commandBuffer presentDrawable:drawable];
    [commandBuffer commit];
}

@end
