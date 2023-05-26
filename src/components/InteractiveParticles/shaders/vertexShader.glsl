precision mediump float;

uniform mat4 modelMatrix;
uniform mat4 viewMatrix;
uniform mat4 projectionMatrix;

uniform float uPointSize;
uniform vec2 uCursor;
uniform float uAspect;

attribute vec3 position;

varying float vStrength;

void main() {

  vec4 initial = projectionMatrix * viewMatrix * modelMatrix * vec4(position, 1.0);

  // Normalized screen coordinates of points
  vec2 vertexScreen = initial.xy / initial.w;
  vertexScreen.x *= uAspect;

  vec2 cursorScreen = uCursor;
  cursorScreen.x *= uAspect;

  float distance = distance(cursorScreen, vertexScreen);
  float strength = (1.0 - smoothstep(0.0, 0.8, distance)) * 2.5;

  vec2 difference = vertexScreen - cursorScreen;
  vec3 transform = vec3(vec2(difference * strength * 0.1), strength);

  vec4 mPosition = modelMatrix * vec4(position, 1.0);
  vec4 mvPosition = viewMatrix * mPosition;

  // Moving points closer to the camera
  mvPosition.z += transform.z;

  vec4 mvpPosition = projectionMatrix * mvPosition;

  // Moving points away from the cursor
  mvpPosition.x += transform.x * mvpPosition.w;
  mvpPosition.y += transform.y * uAspect * mvpPosition.w;

  gl_PointSize = uPointSize;
  gl_Position =  mvpPosition;

  vStrength = strength;

}