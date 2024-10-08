shader_type canvas_item;

uniform vec4 tint_color : source_color = vec4(1.0, 1.0, 1.0, 1.0);
uniform float tint_effect_factor : hint_range(0, 1) = 0.0;

//---------------------------------------------
//fragment
//---------------------------------------------
void fragment() {
	vec4 c = texture(TEXTURE, UV);
	vec4 c2 = c * tint_color;
	COLOR =  mix(c, c2, tint_effect_factor);
	//COLOR = c;
}