#version 460

in vec3 vaPosition;
in vec2 vaUV0;
in vec4 mc_Entity;
in vec3 vaNormal;

uniform vec3 chunkOffset;
uniform mat4 modelViewMatrix;
uniform mat4 projectionMatrix;
uniform float frameTimeCounter;
uniform int worldTime;
uniform vec3 cameraPosition;

out vec2 texCoord;
out vec4 foliageColor;
out vec4 mc_entity;
out vec3 va_normal;

const float PI48 = 150.796447372;
float animationSpeed = 2.0;
float pi2wt = (PI48*worldTime / 20) * animationSpeed;

vec3 calcWave(in vec3 pos, in float fm, in float mm, in float ma, in float f0, in float f1, in float f2, in float f3, in float f4, in float f5) {
    vec3 ret;
    float magnitude,d0,d1,d2,d3;
    magnitude = sin(pi2wt*fm + pos.x*0.5 + pos.z*0.5 + pos.y*0.5) * mm + ma;
    d0 = sin(pi2wt*f0);
    d1 = sin(pi2wt*f1);
    d2 = sin(pi2wt*f2);
    ret.x = sin(pi2wt*f3 + d0 + d1 - pos.x + pos.z + pos.y) * magnitude;
    ret.z = sin(pi2wt*f4 + d1 + d2 + pos.x - pos.z + pos.y) * magnitude;
	ret.y = sin(pi2wt*f5 + d2 + d0 + pos.z + pos.y - pos.y) * magnitude;
    return ret;
}

vec3 calcMove(in vec3 pos, in float f0, in float f1, in float f2, in float f3, in float f4, in float f5, in vec3 amp1, in vec3 amp2) {
    vec3 move1 = calcWave(pos      , 0.0027, 0.0400, 0.0400, 0.0127, 0.0089, 0.0114, 0.0063, 0.0224, 0.0015) * amp1;
	vec3 move2 = calcWave(pos+move1, 0.0348, 0.0400, 0.0400, f0, f1, f2, f3, f4, f5) * amp2;
    return move1+move2;
}

void main() {
    vec3 pos = vaPosition;
    vec3 worldpos = pos.xyz + cameraPosition;

    if (mc_Entity.x == 5) {
        pos.xyz += calcMove(pos.xyz,
                                 0.0040,
                                 0.0064,
                                 0.0043,
                                 0.0035,
                                 0.0037,
                                 0.0041,
                                 vec3(1.0,0.2,1.0),
                                 vec3(0.5,0.1,0.5));
    }

    va_normal = vaNormal;
    mc_entity = mc_Entity;
    foliageColor = vaColor;
    texCoord = vaUV0;
    gl_Position = projectionMatrix * modelViewMatrix * vec4(pos + chunkOffset, 1);
}
