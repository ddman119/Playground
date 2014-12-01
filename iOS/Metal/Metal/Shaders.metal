//
//  Shaders.metal
//  Metal
//
//  Created by Sam Symons on 2014-11-29.
//  Copyright (c) 2014 Sam Symons. All rights reserved.
//

#include <metal_stdlib>
using namespace metal;

struct ColoredVertex {
    float4 position [[position]];
    float4 color;
};

// Vertex shaders take vertex data and return a vertex to be rendered on-screen.
// We're playing it safe here and just using the data which was passed in.
vertex ColoredVertex vertex_main(constant float4 *position [[buffer(0)]], constant float4 *color [[buffer(1)]], uint vid [[vertex_id]])
{
    ColoredVertex vert;
    
    vert.position = position[vid];
    vert.color = color[vid];

    return vert;
}

// Fragment shaders return the color for each fragment.
fragment float4 fragment_main(ColoredVertex vert [[stage_in]])
{
    return vert.color;
}
