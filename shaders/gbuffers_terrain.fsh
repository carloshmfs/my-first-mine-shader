#version 460

uniform sampler2D gtexture;
uniform sampler2D lightmap;

layout(location = 0) out vec4 outColor0;

in vec2 texCoord;
in vec4 foliageColor;
in vec4 mc_entity;

void main() {
    vec4 color = texture(gtexture, texCoord) * texture(lightmap, texCoord) * foliageColor;

    if (color.a < .1) {
        discard;
    }

    if (mc_entity.x == 5) {
        color.rgb *= vec3(1, 0, 0);
    }

    outColor0 = color;
}
