#version 460

uniform sampler2D gtexture;
uniform sampler2D lightmap;

layout(location = 0) out vec4 outColor0;

in vec2 texCoord;

void main() {
    outColor0 = texture(gtexture, texCoord);
    outColor0 *= texture(lightmap, texCoord);
}
