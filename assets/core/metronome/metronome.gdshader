shader_type canvas_item;

uniform float move = 1.0;
uniform float offset = 0.1;

uniform vec4 w1_color = vec4(0.0, 0.0, 0.0, 1.0);
uniform vec4 w2_color = vec4(0.0, 0.0, 0.0, 1.0);
uniform vec4 w3_color = vec4(0.0, 0.0, 0.0, 1.0);
uniform vec4 w4_color = vec4(0.0, 0.0, 0.0, 1.0);

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
//	if (UV.y < center.y) {
//		alpha = 1.0 - distance(center.y, UV.y) * 12.0 / 1.0;
//	}

	
	if (test >= 0.98 && UV.y > 0.2) {
		if (distance(dist, w1_dist) <= 0.15) {
			COLOR = w1_color;
		} else if (distance(dist, w2_dist) <= 0.15) {
			COLOR = w2_color;
		} else if (distance(dist, w3_dist) <= 0.15) {
			COLOR = w3_color;
		} else {
			COLOR = w4_color;
		}
		
	} else {
		COLOR = vec4(1.0, 1.0, 1.0, 0.0);
	}
}

