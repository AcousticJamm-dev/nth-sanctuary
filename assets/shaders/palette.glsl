#define TRANSPARENT vec4(0.0, 0.0, 0.0, 0.0)
#define TOLERANCE 0.004
#define MAX_COLORS 256
uniform sampler2D palette_tex;
uniform highp int palette_id;
uniform ivec2 palette_tex_size;

highp vec4 fetch_from_palette_tex(ivec2 location_texel) {
    return texelFetch(palette_tex, location_texel, 0);
}

highp vec4 find_alt_color(vec4 in_color)
{
    if (in_color.a == 0.0) return TRANSPARENT;
    
    float dist;
    for (int i = 0; i <= MAX_COLORS; i++) {
        if (i > palette_tex_size.y) continue;
		ivec2 test_pos = ivec2(0, i);
		highp vec4 test_color = fetch_from_palette_tex(test_pos);
        
		dist = distance(test_color, in_color);

		if (dist < TOLERANCE) {
            return fetch_from_palette_tex(ivec2(palette_id, i));
		}
    }
    return in_color;
}

vec4 effect(vec4 color, Image image, vec2 uvs, vec2 screen_coords) {
    vec4 pixel = Texel(image, uvs);
    if (pixel.a == 0.0) {
        discard;
    }
    pixel = find_alt_color(pixel);
    return pixel*color;
}
