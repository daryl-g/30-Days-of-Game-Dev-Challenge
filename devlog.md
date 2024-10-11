# Development Log

## Table of contents

- [Development Log](#development-log)
  - [Table of contents](#table-of-contents)
  - [Day 1](#day-1)
    - [Some learning notes](#some-learning-notes)
  - [Day 2](#day-2)
    - [Some learning notes](#some-learning-notes-1)
  - [Day 3](#day-3)
    - [Some learning notes](#some-learning-notes-2)
  - [Day 4 + 5](#day-4--5)
    - [Some learning notes](#some-learning-notes-3)
  - [Day 6](#day-6)
  - [Day 7](#day-7)
    - [Some learning notes](#some-learning-notes-4)
  - [Day 8](#day-8)
    - [Some learning notes](#some-learning-notes-5)
  - [Day 9 + 10 + 11](#day-9--10--11)
    - [Some learning notes](#some-learning-notes-6)
  - [Day 12](#day-12)
  - [Useful for later](#useful-for-later)

## Day 1

- Interesting that you can use Godot's own language, GDScript, to code games. Maybe not this time, let's go with C# since I'm more familiar with it.
  - On second thought, maybe let's use GDScript. It's good to get some practice with C#, but you can't export a web-based game with C# using Godot 4. So...let's go with GDScript.
- Godot's interface looks kinda neat and clean, simple to understand.
- Also comes with a detailed user manual to get started too!
- This is gonna be useful for later: [Godot's forum and Q&A](https://forum.godotengine.org) and [How to best ask questions on the forum](https://docs.godotengine.org/en/stable/getting_started/introduction/learning_new_features.html#learning-with-the-community)
- Interesting structure diagram that I can follow:

  ![Instancing Diagram for an Open-World game](https://docs.godotengine.org/en/stable/_images/instancing_diagram_open_world.png "Instancing Diagram for an Open-World game - Godot")

### Some learning notes

- A Godot game is a **tree of scenes**, and each scene is a **tree of nodes**.
- **Nodes** are the game's smallest building blocks.
  - Part of a tree.
  - Always **inherit** from their **parents** up to the Node class.
  - Most Nodes **work independently** from each other.
  - Have these characteristics:
    - A name.
    - Editable properties.
    - Receive callbacks to update every frame.
    - Extendable with new properties and functions.
    - Can be added to another Node as a child.
  - Different nodes have different functions, **combining** them produces more **complex behaviour**.
- Combine nodes together and we get **scenes**.
  - Organise nodes in a tree = **construct a scene**.
  - Scenes can work like Node types after they are saved in the editor.
  - Can be added as a **child** of an **existing Node**.
  - **Compose**, **aggregate**, and **inherit** scenes.
    - Compose nodes to create **custom** and **complex Node types**.
  - Can be a Weapon, a Character, an Item, a Door, a Level, part of a level, etc.
  - Requires **one scene** to be the application's **main scene**.
  - Have these characteristics:
    - Always have one root Node.
    - Can be saved to local drive and load later.
    - Can create as many instances as needed. _(Basically acts very similar to a Class in C#/OOP.)_
  - `.tscn` = text scenes.
  - **Replicate** an object from a template is called **instancing**.
    - Editor will hide an instanced scene as default.
- Combine and nest scenes together and we get **scene tree**.
- **Signals** are used to make nodes react to events in other nodes or different scene tree branches.
  - Signals are Godot's implementation of [**observer**](https://gameprogrammingpatterns.com/observer.html).
  - In C#, observer can be called with the `event` keyword.

## Day 2

- GDScript does not turn out to be too bad. Similar to Python, but it can do a bit more.
- Got the basics of GDScript now, which does not seem to complicated (_for now_). I do expect it to get a lot more complicated once the physics and 3D stuff comes into play, but it is the fun part of the process to learn and navigate through things.
- Had a bit of play around with a terrain creation tool (Terrain3D). Textures have been installed but I have not seen anything so far, things take time though.

### Some learning notes

- Two main tools to listen to the user's input:
  - Built-in callbacks, mainly `_unhandled_input()`.
  - The `Input` singleton (singleton = globally accessible object).
- In GDScript, variables that are at the top of the file are **class' properties**/member variables.
- Godot provides built-in virtual functions like:
  - `_process()`: apply changes to the node every frame
  - `_unhandled_input()`: handle user inputs

## Day 3

- GDScript has a literal `is_on_floor() -> bool` to check if a character is on the floor or not?! This opens up a whole new world!
  - Function belongs to class `CharacterBody3D`, so needs `extends CharacterBody3D` to call the function.
- Managed to get through half of the progress to create the tutorial 3D game, and it seems to be going quite well so far. Most importantly, I am enjoying it, and that is the main point of this 30-day challenge!

### Some learning notes

- `Vector3` is the type for a 3D vector, while `Vector2` is the type for a 2D vector.
- Distances are in meters.
  - In 2D, 1000 pixels = half of screen width.
  - In 3D, 1000 pixels = 1km (kilometer).
- **Right-handed coordination system**:
  - X-axis: left/right (side-to-side)
  - Y-axis: up/down
  - Z-axis: forward/backward
- Ground plane:
  - In 2D, **X-Y** is the ground plane.
  - In 3D, **X-Z** is the ground plane.
- Node that detects when objects leave the screen: [`VisibleOnScreenNotifier3D`](https://docs.godotengine.org/en/stable/classes/class_visibleonscreennotifier3d.html#class-visibleonscreennotifier3d)

## Day 4 + 5

- Nothing to note so far, but I kinda like the fact that you can work on the UI, add music, and work on the animations within a single project.
- Though I do know that you can do that with Unity and Unreal Engine too.
- Squash the Creeps demo/tutorial is finally completed! The full code for it should be on the branch with the same name.

### Some learning notes

- `Collision -> Mask` property allows a `Node` to listen to interaction with other physics objects.
- Connect functions/Nodes to other Nodes using `$Node` in GDScript.
- To do animation, use the `AnimationPlayer` node.
- To create keyframes for the animation of the `Node3D` node, use the key symbol in the Inspector menu, at the far right of the `position` and `rotation` sections.
- In animation, it is recommended not to time and space everything evenly. Instead, offset and contrast the character's motion to make them feel alive.

**From [Godot's Introduction to 3D](https://docs.godotengine.org/en/stable/tutorials/3d/introduction_to_3d.html#doc-introduction-to-3d)**:

- Godot uses the metric system for everything 3D: **1 unit = 1 meter**.
- Axis - color: X-Y-Z = Red-Green-Blue
- Useful keybindings:
  - To snap placement or rotation, press `Ctrl` while moving, scaling, or rotating.
  - To center the view on the selected object, press `F`.
- Create custom geometry by using the [`ArrayMesh`](https://docs.godotengine.org/en/stable/classes/class_arraymesh.html#class-arraymesh) resource directly.
  - `ArrayMesh` tends to be used to create geometry that **does not update often**.
- For simple geometry that needs to be updated often, use [`ImmediateMesh`](https://docs.godotengine.org/en/stable/classes/class_immediatemesh.html#class-immediatemesh) in a `MeshInstance3D` node.
- To edit the environment, use the [`WorldEnvironment`](https://docs.godotengine.org/en/stable/classes/class_worldenvironment.html#class-worldenvironment) node.

## Day 6

- Watched a Cuphead playthrough for inspiration!

## Day 7

![Progress after day 7](./Progress%20screenshots/Day7.png "A game engine depicting a terrain with simulated rains and clouds")

- ^ This is the progress after day 7! Going from knowing nothing about Godot to successfully importing the terrain, adding rain and cloud to the world environment is not too bad.
- Still a long way to go though!

### Some learning notes

- Angles in 3D are called "Euler angles".
- There is no _unique_ way (no formula) to construct an orientation from the 3D angles.
  - The only way an orientation can be produced is to rotate an object angle by angle, in an _arbitrary order_.
- Applying rotation is not enough, a _rotation order_ is necessary.
- Should not use the `rotation` property of `Node3D` nodes in Godot.

## Day 8

### Some learning notes

- Godot uses the [`Transform3D`](https://docs.godotengine.org/en/stable/classes/class_transform3d.html#class-transform3d) datatype for orientations.
  - Each `Node3D` contains a `transform` property.
  - A transform has a [`Basis`](https://docs.godotengine.org/en/stable/classes/class_basis.html#class-basis), which contains of 3 `Vector3` vectors.
    - Can be accessed via `transform.basis` or directly by `transform.basis.x`, `transform.basis.y`, `transform.basis.z`.
  - A transform also has an _origin_.
    - A `Vector3` specifying how far away from the actual origin `(0, 0, 0)` the transform is.
- Rotate a transform by **multiplying its basis by another**, or by \*\*using the `rotate()` function.
- Precision errors:
  - Floating-point error can result in a loss of precision after doing successive transformations.
  - Solution: _orthonormalise_ the transform via `transform.orthonormalized()` function.
    - Means create a set of vectors that are all perpendicular to each other.
    - However, any scale applied to the transform will be lost.
    - It is recommended not to scale nodes that are going to be manipulated, instead scale their children notes instead.
- Can be interpolated with **quaternions**.
  - More info on [`Quaternion`](https://docs.godotengine.org/en/stable/classes/class_quaternion.html#class-quaternion) type.
  - Needs to be normalised once in a while since it can also suffer from numerical precision errors.

## Day 9 + 10 + 11

- Too much procrastination + tiredness lead to me combining the progress of three days into one.
- But that means...it's Blender time to make more progress!
- Never knew how much effort goes into making a 3D model. Here I am making a 3D model of a Tree and it already took me an hour!

### Some learning notes

- Hold `Shift` in Blender allows you to fine tune things easier.
- Press `S + (axis)` in Blender to scale things.
- Press `R + (axis)` in Blender to rotate things.
- Press `G + (axis)` in Blender to move things.
- The `Shading` tab in Blender is useful to add textures and stuff to models/meshes.
- The `UV Editing` tab in Blender is useful for mapping the texture to the model/mesh.

## Day 12

- Continue [here](https://docs.godotengine.org/en/stable/tutorials/3d/procedural_geometry/index.html)!

## Useful for later

- [Thor's develop games website](www.develop.games)
- [Terrain3D Docs](https://terrain3d.readthedocs.io/en/stable/docs/texture_painting.html)
- [Developer Tips for Uploading Godot Games to Itch.io](https://www.reddit.com/r/godot/comments/s8zwq5/psa_developer_tips_for_uploading_godot_games_to/)
- [Exporting for the Web](https://docs.godotengine.org/en/stable/tutorials/export/exporting_for_web.html)
- [Uploading HTML5 games](https://itch.io/docs/creators/html5)
