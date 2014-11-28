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

@end

@implementation MetalView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        _metalLayer = (CAMetalLayer *)[self layer];
        _device = MTLCreateSystemDefaultDevice();
        
        _metalLayer.device = self.device;
        _metalLayer.pixelFormat = MTLPixelFormatBGRA8Unorm;
    }
    
    return self;
}

+ (Class)layerClass
{
    return [CAMetalLayer class];
}

- (void)didMoveToWindow
{
    [self redraw];
}

#pragma mark - Private

- (void)redraw
{
    NSLog(@"Redrawing!");
    
    id<CAMetalDrawable> drawable = [self.metalLayer nextDrawable];
    id<MTLTexture> texture = drawable.texture;
    
    MTLRenderPassDescriptor *passDescriptor = [MTLRenderPassDescriptor renderPassDescriptor];
    passDescriptor.colorAttachments[0].texture = texture;
    passDescriptor.colorAttachments[0].loadAction = MTLLoadActionClear;
    passDescriptor.colorAttachments[0].storeAction = MTLStoreActionStore;
    passDescriptor.colorAttachments[0].clearColor = MTLClearColorMake(1.0, 0.0, 1.0, 1.0);
    
    // TODO: Keep a reference to the command queue.
    id<MTLCommandQueue> commandQueue = [self.device newCommandQueue];
    id<MTLCommandBuffer> commandBuffer = [commandQueue commandBuffer];
    
    id <MTLRenderCommandEncoder> commandEncoder =
    [commandBuffer renderCommandEncoderWithDescriptor:passDescriptor];
    [commandEncoder endEncoding];
    
    [commandBuffer presentDrawable:drawable];
    [commandBuffer commit];
}

@end
