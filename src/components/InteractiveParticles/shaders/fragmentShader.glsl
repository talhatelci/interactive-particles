precision mediump float;

varying float vStrength;

void main() {

    float dist = distance(gl_PointCoord, vec2(0.5));
    float alpha = 1.0 - smoothstep(0.2, 0.5, dist);

    gl_FragColor = vec4(vec3(0.3, 0.8, 0.9) + vStrength * 0.3, alpha);
  
}