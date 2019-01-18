//Taken from : https://stackoverflow.com/questions/3451553/value-remapping
float map(float value, float inputMin, float inputMax, float outputMin, float outputMax)
{
    return outputMin + (value - inputMin) * (outputMax - outputMin) / (inputMax - inputMin);
}

void main()
{
    //How quickly vignette cycles
    float _BreatheRate = 2.0;
    //How much vignette is visible (0->1)
    float _VigIntensity = 1.0;
    //Power of vignette. x = min, y = max
    vec2 _VigPower = vec2(0.2, 0.8);
    //Base colour of "scene" (would usually be texture from camera)
    vec4 _BaseColour = vec4(1,1,1,1);
    //Colour of vignette
    vec4 _VigColour = vec4(.0,0.0,0.2,1.0);

    float time = iGlobalTime * 1.0;
    vec2 uv = (gl_FragCoord.xy / iResolution.xy);
    uv *= 1.0 - uv;

    float vig = uv.x * uv.y * 15.0;
    vig = pow(vig, map(sin(time * 2.0), -1.0, 1.0, _VigPower.x, _VigPower.y));

    vec4 rimColour = mix(vec4(1,1,1,1), _VigColour, (1.0 -vig)* _VigIntensity);
    
    gl_FragColor = _BaseColour * rimColour;
}

