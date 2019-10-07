#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

// From Processing 2.1 and up, this line is optional
#define PROCESSING_COLOR_SHADER

// if you are using the filter() function, replace the above with
// #define PROCESSING_TEXTURE_SHADER

// ----------------------
//  SHADERTOY UNIFORMS  -
// ----------------------

uniform vec3      iResolution;           // viewport resolution (in pixels)
uniform float     iTime;                 // shader playback time (in seconds) (replaces iGlobalTime which is now obsolete)
uniform float     iTimeDelta;            // render time (in seconds)
uniform int       iFrame;                // shader playback frame

uniform vec4      iMouse;                // mouse pixel coords. xy: current (if MLB down), zw: click
uniform vec4      iDate;                 // (year, month, day, time in seconds)

uniform sampler2D iChannel0;             // the audio data as a 512x2 texture

//uniform float     iChannelTime[2];
//uniform vec3      iChannelResolution[2];


// Channels can be either 2D maps or Cubemaps.
// Pick the ones you need and uncomment them.


// uniform float     iChannelTime[1..4];       // channel playback time (in seconds)
// uniform vec3      iChannelResolution[1..4]; // channel resolution (in pixels)

/*
uniform sampler2D iChannel0;
uniform sampler2D iChannel1;
uniform sampler2D iChannel2;
uniform sampler2D iChannel3;

uniform samplerCube iChannel0;
uniform samplerCube iChannel1;
uniform samplerCube iChannel2;
uniform samplerCube iChannel3;

uniform vec3  iChannelResolution[4]; // channel resolution (in pixels)

uniform float iChannelTime[4]; // Channel playback time (in seconds)
*/

vec4 fragColor;
vec2 fragCoord = gl_FragCoord.xy;

void mainImage( out vec4 fragColor, in vec2 fragCoord );

void main() {
    mainImage(gl_FragColor,gl_FragCoord.xy);
}

// ------------------------------
//  SHADERTOY CODE BEGINS HERE  -
// ------------------------------


// Created by inigo quilez - iq/2013
// License Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License.


// See also:
//
// Input - Keyboard    : https://www.shadertoy.com/view/lsXGzf
// Input - Microphone  : https://www.shadertoy.com/view/llSGDh
// Input - Mouse       : https://www.shadertoy.com/view/Mss3zH
// Input - Sound       : https://www.shadertoy.com/view/Xds3Rr
// Input - SoundCloud  : https://www.shadertoy.com/view/MsdGzn
// Input - Time        : https://www.shadertoy.com/view/lsXGz8
// Input - TimeDelta   : https://www.shadertoy.com/view/lsKGWV
// Inout - 3D Texture  : https://www.shadertoy.com/view/4llcR4

#define t iTime
#define r iResolution.xy
#define im iMouse
//
// http://www.pouet.net/prod.php?which=57245
// If you intend to reuse this shader, please add credits to 'Danilo Guanabara'


void mainImage( out vec4 fragColor, in vec2 fragCoord ){
    vec3 c;
    float l,z=t;
    float g, timer;
    for(int i=0;i<4;i++) {
        vec2 uv,p=fragCoord.xy/r;
        uv=p;
        p-=.5;
        p.x*=r.x/r.y;
        z+=.07;
        l=length(p);
        g = mod(t,30.0);
        timer = mod(t, 20.0);
        uv+=p/l*(sin(z)+1.)*abs(sin(l*9.-z*2.));
        c[i]=.01/length(abs(mod(uv,1.)*1.0*(timer))-.5);
    }
    fragColor=vec4(c/l,t);
}



// ----------------------------
//  SHADERTOY CODE ENDS HERE  -
// ----------------------------
