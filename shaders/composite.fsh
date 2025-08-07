#version 460

uniform sampler2D gtexture;
uniform sampler2D lightmap;
uniform sampler2D colortex0;

layout(location = 0) out vec4 outColor0;

in vec2 texCoord;

void main() {
    vec4 color = texture(gtexture, texCoord);

    color.rgb = vec3((color.r + color.g + color.b) / 3);

    outColor0 = color;
}
