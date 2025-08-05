#version 460

uniform sampler2D gtexture;
uniform sampler2D lightmap;
uniform sampler2D colortex0;

layout(location = 0) out vec4 outColor0;

in vec2 texCoord;

void main() {
    outColor0 = texture(gtexture, texCoord);
    outColor0 *= texture(lightmap, texCoord);
    outColor0 *= texture(colortex0, texCoord);

    if (outColor0.a < .1) {
        discard;
    }
}
