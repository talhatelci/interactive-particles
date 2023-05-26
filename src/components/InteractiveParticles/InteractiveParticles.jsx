import { Canvas } from "@react-three/fiber";
import Settings from "./Settings.jsx";
import Scene from "./Scene.jsx";

const InteractiveParticles = () => {
  return (
    <div className="interactive-particles">
      <Canvas
        camera={{
          position: [0, 0, 16],
        }}
      >
        <Settings />
        <Scene />
      </Canvas>
    </div>
  );
};

export default InteractiveParticles;
