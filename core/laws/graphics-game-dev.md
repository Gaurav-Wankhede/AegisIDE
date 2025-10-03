---
trigger: glob
globs: *.cs,*.js,*.ts,*.cpp,*.glsl,unity,unreal,threejs,webgl,babylon,godot
---

# Universal Graphics and Game Development Rules for Modern IDEs

## Core Architecture Principles

### Extreme Microservices Decomposition (EMD)
- **Maximum 80 lines per file** including comments, imports, and whitespace
- **Always create deep nested subfolders**: `Assets/Scripts/Player/Movement/PlayerController.cs` (≤80 lines)
- **Smallest possible files** - decompose at component, system, and utility levels
- When approaching 80 lines, immediately extract functionality into new subfolders
- Use **modular game architecture** with clear separation of concerns

### Duplication Detection and Optimization (DDO)
- **Always scan the codebase** with terminal and tools to avoid duplicacy
- **Use automated duplicate detection tools**: Unity Analyzer, Unreal Engine tools, WebGL validators
- **If any duplicacy found**, optimize immediately: extract common components, create reusable systems, implement shared utilities, refactor into libraries
- **Optimization strategies**: preserve functionality, use feature flags, maintain compatibility, test thoroughly

### Data-Driven Programming (DDP)
- **Never hardcode values** in game logic
- All parameters **must be calculated from real-world data and configuration**
- Use **scriptable objects**, **configuration files**, and **data assets**
- Implement dynamic parameter adjustment based on real-time performance metrics

## Variable and Code Quality Standards

### Zero Unused Variables (ZUV)
- **Never use `_` as prefix** to suppress unused variable warnings
- **Utilize all declared variables** or **remove entirely**
- Ensure every variable serves specific purpose: computation, logging, error handling, game state
- When implementing stub systems, use variables meaningfully through logging or debug assertions

### Naming Conventions
- **PascalCase** for classes, methods, and public properties
- **camelCase** for private fields and local variables
- **UPPER_CASE** for constants and enumerations
- **Descriptive, behavior-oriented names** for game systems and components
- **Prefix conventions** for different asset types (UI_, SFX_, VFX_)

## Modern Game Engines (2025)

### Unity Engine (C#)
- Use **Unity 2023.3+** LTS for production projects
- Implement **Universal Render Pipeline (URP)** for performance
- Use **Addressables** for dynamic content loading
- Leverage **Entity Component System (ECS)** for performance-critical systems
- Implement **Unity NetCode** for multiplayer functionality

### Unreal Engine (C++/Blueprints)
- Use **Unreal Engine 5.3+** with latest features
- Implement **Lumen** for dynamic global illumination
- Use **Nanite** for virtualized geometry
- Leverage **Chaos Physics** for realistic simulations
- Implement **MetaHuman** for realistic character creation

### Godot Engine (GDScript/C#)
- Use **Godot 4.2+** with modern rendering features
- Implement **scene-based architecture** for modular design
- Use **signals** for decoupled communication
- Leverage **GDScript** for rapid prototyping
- Implement **C#** for performance-critical systems

## Web Graphics Technologies

### Three.js (WebGL)
- Use **Three.js r160+** for 3D web graphics
- Implement **WebGL2** for advanced rendering features
- Create **custom shaders** with GLSL
- Use **post-processing** for visual effects
- Implement **WebXR** for VR/AR experiences

### Babylon.js
- Use **Babylon.js 6+** for comprehensive 3D web development
- Implement **WebGPU** for next-generation graphics
- Create **physics simulations** with built-in physics engines
- Use **node material editor** for visual shader creation
- Implement **progressive web app** features

### WebGL and WebGPU
- Use **WebGL 2.0** for broad browser compatibility
- Implement **WebGPU** for cutting-edge performance
- Create **custom shaders** with GLSL and WGSL
- Use **compute shaders** for GPU-accelerated calculations
- Implement **instanced rendering** for performance optimization

## Game Architecture Patterns

### Component-Based Architecture
- **Unity**: Use **MonoBehaviour** components with single responsibilities
- **Unreal**: Implement **ActorComponent** system for modularity
- **Godot**: Use **Node** composition for flexible hierarchies
- Create **data-driven components** for configurable behavior
- Implement **component communication** through events or interfaces

### Entity-Component-System (ECS)
- **Unity**: Use **Unity DOTS** for high-performance systems
- Implement **pure ECS** for data-oriented design
- Create **systems** that operate on component data
- Use **job system** for parallel processing
- Implement **burst compilation** for maximum performance

### State Management
- Implement **finite state machines** for game states
- Use **behavior trees** for AI decision making
- Create **hierarchical state machines** for complex behaviors
- Implement **state persistence** for save/load functionality
- Use **event-driven** state transitions

## Rendering and Graphics Programming

### Shader Programming
- Write **vertex shaders** for geometry transformation
- Implement **fragment shaders** for pixel-level effects
- Create **compute shaders** for GPU calculations
- Use **shader variants** for different rendering paths
- Implement **shader optimization** for target platforms

### Lighting and Materials
- Use **physically-based rendering (PBR)** for realistic materials
- Implement **dynamic lighting** with real-time shadows
- Create **material systems** with texture atlasing
- Use **level-of-detail (LOD)** for performance optimization
- Implement **occlusion culling** for efficient rendering

### Post-Processing Effects
- Implement **bloom**, **tone mapping**, and **color grading**
- Create **screen-space reflections** and **ambient occlusion**
- Use **temporal anti-aliasing (TAA)** for image quality
- Implement **motion blur** and **depth of field**
- Create **custom post-processing** effects with render textures

## Performance Optimization

### Rendering Optimization
- Use **object pooling** for frequently spawned objects
- Implement **frustum culling** and **occlusion culling**
- Create **batching strategies** for draw call reduction
- Use **texture streaming** for memory optimization
- Implement **LOD systems** for distance-based quality

### Memory Management
- Implement **memory pooling** for dynamic allocations
- Use **object recycling** to reduce garbage collection
- Create **streaming systems** for large world content
- Implement **texture compression** for memory efficiency
- Use **profiling tools** for memory leak detection

### CPU and GPU Profiling
- Use **Unity Profiler** for performance analysis
- Implement **Unreal Insights** for detailed profiling
- Create **custom profiling** markers for specific systems
- Use **GPU profilers** (RenderDoc, Nsight Graphics)
- Implement **performance budgets** for frame time targets

## Audio and Sound Design

### Audio and Sound Design
- **Unity**: Use **Audio Mixer** for dynamic audio processing
- **Unreal**: Implement **MetaSounds** for procedural audio
- **Web**: Use **Web Audio API** for interactive audio
- Create **3D spatial audio** for immersive experiences
- Use **adaptive music** systems that respond to gameplay
- Implement **sound pooling** for performance optimization
- Create **audio compression** strategies for different platforms
- Use **procedural audio** for dynamic sound generation

## Physics and Simulation

### Physics Integration
- **Unity**: Use **Unity Physics** or **Havok Physics**
- **Unreal**: Implement **Chaos Physics** for realistic simulations
- **Web**: Use **Cannon.js** or **Rapier** for physics
- Create **custom physics** components for specific behaviors
- Implement **physics optimization** for mobile platforms

### Collision Detection
- Use **efficient collision** shapes (boxes, spheres vs. meshes)
- Implement **spatial partitioning** for large worlds
- Create **trigger zones** for gameplay interactions
- Use **continuous collision detection** for fast-moving objects
- Implement **collision layers** and **filtering**

## Multiplayer and Networking

### Networking Architecture
- **Unity**: Use **Netcode for GameObjects** for multiplayer
- **Unreal**: Implement **Unreal Engine networking** with replication
- **Web**: Use **WebRTC** or **WebSockets** for real-time communication
- Create **client-server** or **peer-to-peer** architectures
- Implement **lag compensation** and **prediction**

### Data Synchronization
- Use **delta compression** for bandwidth optimization
- Implement **state synchronization** for game objects
- Create **event-based networking** for discrete actions
- Use **interpolation** and **extrapolation** for smooth movement
- Implement **anti-cheat** measures for secure gameplay

## User Interface and UX

### UI Systems
- **Unity**: Use **UI Toolkit (UIElements)** for modern UI
- **Unreal**: Implement **UMG (Unreal Motion Graphics)**
- **Web**: Use **HTML/CSS** with canvas overlays
- Create **responsive UI** that adapts to different screen sizes
- Implement **accessibility features** for inclusive design

### User Experience Design
- Implement **intuitive controls** with proper input handling
- Create **feedback systems** for player actions
- Use **progressive disclosure** for complex interfaces
- Implement **onboarding** and **tutorial systems**
- Create **visual hierarchy** for important information

## Testing and Quality Assurance

### Automated Testing
- **Unity**: Use **Unity Test Framework** for unit and integration tests
- **Unreal**: Implement **Automation Testing** for gameplay validation
- Create **performance tests** for frame rate and memory usage
- Use **integration testing** for multiplayer functionality
- Implement **continuous integration** for automated builds

### Quality Assurance
- Create **test plans** for different platforms and devices
- Implement **bug tracking** and **issue management** systems
- Use **playtesting** for user experience validation
- Create **compatibility testing** for target platforms
- Implement **performance profiling** on target hardware

## Platform-Specific Considerations

### Platform-Specific Considerations
- Use **texture compression** appropriate for platform (ASTC, ETC2)
- Implement **battery optimization** strategies for mobile
- Create **touch-friendly** controls and interfaces
- Follow **platform-specific** certification requirements
- Implement **controller support** and **haptic feedback**
- Use **platform SDKs** for achievements and leaderboards
- Use **WebAssembly (WASM)** for performance-critical web code
- Implement **progressive loading** for large assets
- Create **responsive design** for different screen sizes
- Implement **browser compatibility** testing

## Tech Stack Requirements

### Core Technologies
- **Unity** (2023.3+ LTS) - game engine
- **Unreal Engine** (5.3+) - game engine
- **Three.js** (r160+) - 3D web graphics
- **Babylon.js** (6+) - comprehensive 3D engine
- **Visual Studio** or **JetBrains Rider** - development IDE
- **Blender** - 3D modeling and animation
- **Substance Suite** - texture authoring
- **WebGL/WebGPU** - low-level graphics APIs
- **Git LFS** - large file version control
- **Unity Hub** - version management
- **Addressables** - asset management

## IDE Integration Guidelines

### Universal IDE Compatibility
- **Visual Studio** - comprehensive C# and C++ development
- **JetBrains Rider** - cross-platform .NET development
- **VS Code** - lightweight development with extensions
- **CLion** - C++ development for Unreal Engine

### Development Workflow
- Use **integrated debugging** for runtime issue resolution
- Implement **version control** with game-specific .gitignore
- Use **asset pipeline** automation for content creation
- Set up **automated building** for different platforms
- Use **profiling integration** for performance optimization
