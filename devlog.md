# Development Log

## Table of contents

- [Development Log](#development-log)
  - [Table of contents](#table-of-contents)
  - [Day 1](#day-1)
    - [Some learning notes](#some-learning-notes)
  - [Day 2](#day-2)
    - [Some learning notes](#some-learning-notes-1)
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

## Useful for later

- [Godot's Introduction to 3D](https://docs.godotengine.org/en/stable/tutorials/3d/introduction_to_3d.html#doc-introduction-to-3d)
- [Developer Tips for Uploading Godot Games to Itch.io](https://www.reddit.com/r/godot/comments/s8zwq5/psa_developer_tips_for_uploading_godot_games_to/)
- [Exporting for the Web](https://docs.godotengine.org/en/stable/tutorials/export/exporting_for_web.html)
- [Uploading HTML5 games](https://itch.io/docs/creators/html5)
