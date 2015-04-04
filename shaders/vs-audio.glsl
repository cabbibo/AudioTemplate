uniform sampler2D t_audio;
uniform float time;

varying vec4 vAudio;

varying float vAudioLookup;

$simplex

//vec3 getPos( vec3 position 
void main(){

  
  float displacement = snoise( vec4( position * 4. , time * .1 ) );

  vAudioLookup =  abs( displacement ); //abs( normal.x * normal.y * normal.z * 3. );
  // Here we sample the audio from a texture that we will
  // be creating on the cpu
  vec4 audio = texture2D( t_audio , vec2( vAudioLookup , 0. ));

  vAudio = audio;


  // To visualize the audio, we will displace the position
  // by a value based on the audio, along the normal
  vec3 pos = position + .1 * displacement * length( audio)  * normal;

  // Use this position to get the final position 
  gl_Position = projectionMatrix * modelViewMatrix * vec4( pos , 1.);

}
