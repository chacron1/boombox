shader_type canvas_item;

uniform float move = 1.0;
uniform float offset = 1.0;

uniform vec4 w1_color;
uniform vec4 w2_color;
uniform vec4 w3_color;
uniform vec4 w4_color;

uniform float w1_dist;
uniform float w2_dist;
uniform float w3_dist;
uniform float w4_dist;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	// Called for every pixel the material is visible on.
	vec2 center = vec2(0.5, 0.1);
	float dist = (distance(UV, center));
	float test = sin(dist * 25.0 - (move * 2.0 * PI) + offset);
	float alpha = 1.0;
	if (UV.y < center.y) {
		alpha = 1.0 - distance(center.y, UV.y) * 12.0 / 1.0;
	}
	
	if (test >= 0.8) {
		if (distance(dist, w1_dist) <= 0.15) {
			COLOR = vec4(w1_color.r, w1_color.g, w1_color.b, test);
		} else if (distance(dist, w2_dist) <= 0.15) {
			COLOR = vec4(w2_color.r, w2_color.g, w2_color.b, test);
		} else if (distance(dist, w3_dist) <= 0.15) {
			COLOR = vec4(w3_color.r, w3_color.g, w3_color.b, test);
		} else {
			COLOR = vec4(w4_color.r, w4_color.g, w4_color.b, test);
		}
		
	} else {
		COLOR = vec4(1.0, 1.0, 1.0, 0.0);
	}

	// COLOR = vec4(sin(dist * 30.0 + (move * 2.0 * PI)), 0.9, 0.9, 1.0);
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
