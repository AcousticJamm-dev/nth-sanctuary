// written by groverbuger for g3d
// september 2021, hyperboid sept 2025 for ak3d
// MIT license

#include "base"

#ifdef PIXEL

vec4 frag( vec4 color, Image tex, vec2 texture_coords, vec2 screen_coords ) {
    return color * Texel(tex, texture_coords);
}

#endif

#include "effect"