# Interactive Video Player

A Non linear Video session player which provides interactive elements to the user, allowing them to make decisions that will dynamically impact the later parts of the video.


# Features

The Flutter application has 2 main features:

## Interactive Player

The `InteractivePlayer` widget provides an interactive video player with user interactions. To use this widget, follow the steps below:

1. Import the `InteractivePlayer` widget.
2. Create an instance of InteractionEntity to define the video and interactions:
    ```
    final interaction = InteractionEntity(
      videoUrl: 'https://example.com/video.mp4',
      title: 'Video Title',
      question: 'Question to ask the user',
      options: [
        // List of InteractionEntity options if any
      ],
    );
    ```
3. Pass the interaction to the `InteractivePlayer` widget:
    ```
    InteractivePlayer(
      initialInteraction: interaction,
      onInteraction: (selectedInteraction) {
        // Handle user interaction here
      },
    );
    ```
    - initialInteraction: The initial interaction to be shown on the video.
    - onInteraction: A callback function that will be called when the user interacts with the video.

## Interactive Player With History

1. Import the `InteractivePlayerWithHistory` widget.
2. create `InteractionEntity` as above.
3. Use the InteractionPlayerWithHistory widget in your Flutter UI:
    ```
    InteractivePlayerWithHistory(
      initialInteraction: interaction,
    );
    ```
    - initialInteraction: The initial interaction to be shown on the video.
    - This will show list of previous interactions below the video player.
   

# Pre-requisites

Before proceeding with the installation and usage of the Flutter application, make sure you have the following pre-requisites:

* Flutter Version: 3.10.5
* Channel: stable
* Dart: Dart 3.0.5


# Installation

To install the Flutter application, follow these steps:

1. Clone the repository to your local machine.
2. Open a terminal and navigate to the project's root directory.
3. Run the command `flutter pub get` to fetch the project dependencies.
4. Run the command `flutter run` to launch the application on a connected device or simulator.
5. Optionally, you can run the command `flutter build apk` to build an APK file for distribution.


# System Architecture

The Flutter application follows the Clean Architecture design pattern and incorporates the following technologies:

* Architecture: [Clean Architecture](https://resocoder.com/2019/08/27/flutter-tdd-clean-architecture-course-1-explanation-project-structure/)
* State Management: [Cubits](https://pub.dev/packages/flutter_bloc)
* Dependency Injection: [GetIt](https://pub.dev/packages/get_it)

# Folder Structure

The project follows clean architecture. The folder structure is as follows:

```
lib
│───src
│   │───core
│   │   │───constants
│   │   │───enums
│   │   │───exceptions
│   │   │───extensions
│   │   │───models
│   │   └───utils
│   │───features
│   │   └───football_manager
│   │       │───data
│   │       │   │─── datasources
│   │       │   │─── models
│   │       │   └─── repositories
│   │       │───domain
│   │       │   │─── entities
│   │       │   │─── repositories
│   │       │   └─── usecases
│   │       └───presentation
│   │           │─── cubits
│   │           │─── screens
│   │           └─── widgets
│   │───ui
│   │   │───atoms
│   │   │───molecules
│   │   └───organisms
│   └───app.dart
└───main.dart
```