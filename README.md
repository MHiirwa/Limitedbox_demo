# LimitedBox Demo

A Flutter demo app that showcases how `LimitedBox` works in a real-world layout scenario.

This project demonstrates a horizontal NBA team rankings carousel where the children inside a `ListView` receive unbounded constraints. `LimitedBox` is used to cap the maximum width and height of each ranking card so the layout remains controlled and responsive.

## What this app demonstrates

- The behavior of `LimitedBox` with unbounded constraints
- Horizontal scrolling in a `ListView`
- Live control of `maxWidth` and `maxHeight`
- Switching between different child widget styles inside the constrained box
- A practical UI example based on an NBA standings screen

## Features

- Horizontally scrollable team ranking cards
- Adjustable `LimitedBox` sizing using sliders
- Toggle between team-card and simple ranking-card layouts
- Material 3 styling
- Clean, beginner-friendly Flutter example for layout learning

## Project structure

- `lib/main.dart` — main Flutter app and demo logic
- `test/` — Flutter widget tests (if added later)

## Prerequisites

Before running this project, make sure you have Flutter installed and configured on your machine.

- Flutter SDK
- An IDE such as VS Code or Android Studio
- Emulator or connected device for running the app

## Getting started

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd limitedbox_demo
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run the app:
   ```bash
   flutter run
   ```

## Useful commands

- Check Flutter doctor:
  ```bash
  flutter doctor
  ```

- Run the app in release mode:
  ```bash
  flutter run --release
  ```

- Run tests:
  ```bash
  flutter test
  ```

## Why LimitedBox?

`LimitedBox` is especially useful when a parent widget, such as `ListView` in a horizontal direction, gives its children unconstrained dimensions. Without a limitation, children may grow beyond the intended layout. This demo shows how `LimitedBox` keeps the cards within a defined maximum size while preserving a clean and predictable interface.

## License

This project is for educational/demo purposes.
