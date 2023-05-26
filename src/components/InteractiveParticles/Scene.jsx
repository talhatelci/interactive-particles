import { useEffect, useRef } from "react";
import { useThree } from "@react-three/fiber";
import vertexShader from "./shaders/vertexShader.glsl?raw";
import fragmentShader from "./shaders/fragmentShader.glsl?raw";

const Scene = () => {
  const { pointer, size } = useThree();

  const uniforms = useRef({
    uPointSize: { value: 5.0 },
    uCursor: { value: pointer },
    uAspect: { value: size.width / size.height },
  });

  useEffect(() => {
    uniforms.current.uAspect.value = size.width / size.height;
  }, [size]);

  return (
    <>
      <points>
        <planeGeometry args={[64, 32, 64, 32]} />
        <rawShaderMaterial
          vertexShader={vertexShader}
          fragmentShader={fragmentShader}
          uniforms={uniforms.current}
          transparent
        />
      </points>
    </>
  );
};

export default Scene;
