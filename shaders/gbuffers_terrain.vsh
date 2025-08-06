#version 460

in vec3 vaPosition;
in vec2 vaUV0;
in vec4 mc_Entity;

uniform vec3 chunkOffset;
uniform mat4 modelViewMatrix;
uniform mat4 projectionMatrix;
uniform float frameTimeCounter;

out vec2 texCoord;
out vec4 foliageColor;

void main() {
    vec3 pos = vaPosition;

    if (mc_Entity.x == 5) {
        float waveSpeed = 1.5;
        float waveStrength = 0.002;

        float swayAmount = max(.0, pos.y) * waveStrength;
        pos.x += sin(pos.z * 2.0 + frameTimeCounter * waveSpeed) * swayAmount;
        pos.z += cos(pos.x * 2.0 + frameTimeCounter * waveSpeed) * swayAmount;
        pos.y += sin(pos.y * 2.0 + frameTimeCounter * waveSpeed) * swayAmount;
    }

    foliageColor = vaColor;
    texCoord = vaUV0;
    gl_Position = projectionMatrix * modelViewMatrix * vec4(pos + chunkOffset, 1);
}
