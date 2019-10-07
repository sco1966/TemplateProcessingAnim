// from shadertoy https://www.shadertoy.com/view/4dBGzK

uniform vec2 iResolution;
uniform sampler2D texture;
uniform float iGlobalTime;

#define iChannel0 texture

//#define t iGlobalTime
//#define r iResolution.xy
//#define im iMouse

highp float rand(vec2 co)
{
    highp float a = 12.9898;
    highp float b = 78.233;
    highp float c = 43758.5453;
    highp float dt= dot(co.xy ,vec2(a,b));
    highp float sn= mod(dt,3.14);
    return fract(sin(sn) * c);
}

void mainImage( out vec4 fragColor, in vec2 fragCoord );

void main() {
    mainImage(gl_FragColor,gl_FragCoord.xy);
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
	vec2 uv = fragCoord.xy / iResolution.xy;
    vec2 ra = iResolution.xy;
	// Flip Y Axis
	// uv.y = -uv.y;
    
    float timer =iGlobalTime;

	highp float magnitude = 0.005;
    
    vec3 ca;
    float l,z=iGlobalTime;
    float ba =texture(iChannel0,uv).r;
    float bb =texture(iChannel0,uv).b;
    float ga;
    vec2 p;
    for(int i=0;i<4;i++) {
        vec2 uva;
        p=fragCoord.xy/ra;
        uva=p;
        p-=.5;
        p.x*=(ra.x)*ba/ra.y;
        z+=.001;
        l=length(p);
        timer = mod(z, 0.2);
        uva+=p/l*(sin(timer)+1.)*abs(sin(l*bb-z*2.));
            ca[i]=.01/length(abs(mod(uva,1.)*ba)-.5);
    }



	// Set up offset
	vec2 offsetRedUV = uv;
	offsetRedUV.x = uv.x + rand(vec2(iGlobalTime*0.03,uv.y*0.42)) * 0.001;
	offsetRedUV.x += sin(rand(vec2(iGlobalTime*0.2, uv.y)))*magnitude;

	vec2 offsetGreenUV = uv;
	offsetGreenUV.x = uv.x + rand(vec2(iGlobalTime*0.004,uv.y*0.002)) * 0.004;
	offsetGreenUV.x += sin(iGlobalTime*2.0)*magnitude;

	vec2 offsetBlueUV = uv;
	offsetBlueUV.x = uv.y;
	offsetBlueUV.x += rand(vec2(cos(iGlobalTime*0.01),sin(uv.y)));

	// Load Texture
	float r = texture(iChannel0, offsetRedUV).r;
	float g = texture(iChannel0, offsetGreenUV).g;
	float b = texture(iChannel0, uv).b;
  
    
                     //float pct = 0.0;
                     
                     // a. The DISTANCE from the pixel to the center
                    // pct = distance(uv,vec2(0.5));

	fragColor = vec4(r*ca.x,ca.y,b,0);
    //fragColor = vec4(pct,pct,pct,0);

}
