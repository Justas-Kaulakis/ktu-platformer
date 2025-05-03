shader_type canvas_item;

uniform sampler2D image : source_color;
uniform vec4 glow_color : source_color = vec4(0.5, 0.8, 1.0, 1.0); // Light cyan
uniform float glow_strength = 1.0;

void fragment() {
    vec4 tex_color = texture(TEXTURE, UV);
    COLOR = tex_color;

    // Additive emission (must have glow enabled in project settings)
    COLOR.rgb += glow_color.rgb * glow_strength * tex_color.a;
}