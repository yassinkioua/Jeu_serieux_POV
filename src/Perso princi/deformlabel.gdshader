shader_type canvas_item;

uniform float height = 0.50;
uniform float frequency = 10.0;
uniform float speed = 1.0;

void vertex() {
 VERTEX.y += height * sin((frequency * UV.x) + (speed * TIME));
}