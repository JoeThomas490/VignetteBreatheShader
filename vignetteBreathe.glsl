void main()
{
    float time = iGlobalTime * 1.0;
    vec2 uv = (gl_FragCoord.xy / iResolution.xy);

    gl_FragColor = vec4(uv.x, uv.y, 0.0, 1.0);
}

//Taken from : https://stackoverflow.com/questions/3451553/value-remapping
float map(float value, float inputMin, float inputMax, float outputMin, float outputMax)
{
    return outputMin + (value - inputMin) * (outputMax - outputMin) / (inputMax - inputMin);
}