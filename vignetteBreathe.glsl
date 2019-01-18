void main()
{
    float time = iGlobalTime * 1.0;
    vec2 uv = (gl_FragCoord.xy / iResolution.xy);

    gl_FragColor = vec4(uv.x, uv.y, 0.0, 1.0);
}