#version 460

uniform sampler2D gtexture;
uniform sampler2D lightmap;

layout(location = 0) out vec4 outColor0;

in vec2 texCoord;
in vec4 foliageColor;

void main() {
    // vec4 color = texture(gtexture, texCoord) * texture(lightmap, texCoord) * foliageColor;
    //
    // color.rgb = vec3((color.r + color.g + color.b) / 3);

    vec4 color = foliageColor;

    outColor0 = color;
}
