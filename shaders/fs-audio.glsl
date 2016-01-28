uniform sampler2D t_audio;

varying vec3 vNorm;
varying vec4 vAudio;
varying float vAudioLookup;
varying vec2 vUv;

void main(){

  vec4 audio = texture2D( t_audio , vec2( vUv.x , 0. ) );
  // the base color will be the normal
  vec3 col =audio.xyz;// vNorm * .5 + .5;

  // We are also going to color our fragments
  // based on the color of the audio
  //col *= 1.5 * audio.xyz;

  gl_FragColor = vec4( col , 1. );

}
