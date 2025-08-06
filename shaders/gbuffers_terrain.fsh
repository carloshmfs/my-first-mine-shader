#version 460

uniform sampler2D gtexture;
uniform sampler2D lightmap;
uniform sampler2D colortex0;

layout(location = 0) out vec4 outColor0;

in vec2 texCoord;
in vec4 foliageColor;

void main() {
    vec4 color = texture(gtexture, texCoord) * texture(lightmap, texCoord) * texture(colortex0, texCoord) * foliageColor;

    if (color.a < .1) {
        discard;
    }

    outColor0 = color;
}
