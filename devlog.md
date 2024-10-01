# Development Log

## Table of contents

## Day 1

**Some learning notes:**

- **Nodes** are the game's smallest building blocks.
- Combine nodes together and we get **scenes**.
- Combine and nest scenes together and we get **scene tree**.
- **Signals** are used to make nodes react to events in other nodes or different scene tree branches.
  - Signals are Godot's implementation of [**observer**](https://gameprogrammingpatterns.com/observer.html).
  - In C#, observer can be called with the `event` keyword.
