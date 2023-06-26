import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../widgets/video_player_item.dart';

class InteractivePlayer extends StatefulWidget {
  const InteractivePlayer({super.key});

  @override
  State<InteractivePlayer> createState() => _InteractivePlayerState();
}

class _InteractivePlayerState extends State<InteractivePlayer> {
  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();

    initVideoController(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    );
  }

  //initializing the video controller
  void initVideoController(String url) {
    _videoController = VideoPlayerController.network(url);

    _videoController.initialize().then((_) {
      setState(() {});
      _videoController.play();
    });

    _videoController.addListener(videoStatus);
  }

  void videoStatus() {
    if (_videoController.value.position >= _videoController.value.duration) {
      askInput(context);
    }
  }

  void changeVideo(String url) {
    _videoController.pause();
    _videoController.removeListener(videoStatus);
    _videoController.dispose();
    initVideoController(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: VideoPlayerItem(
          controller: _videoController,
        ),
      ),
    );
  }

  askInput(BuildContext context) {
    if (_hasAlreadyDialog(context)) {
      Navigator.of(context).pop();
    }
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Alert'),
          content: const Text('Video has ended'),
          actions: [
            TextButton(
              onPressed: () {
                changeVideo(
                  'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
                );
                Navigator.of(context).pop();
              },
              child: const Text('Bees'),
            ),
            TextButton(
              onPressed: () {
                changeVideo(
                  'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
                );
                Navigator.of(context).pop();
              },
              child: const Text('Butterfly'),
            ),
          ],
        );
      },
    );
  }

  _hasAlreadyDialog(BuildContext context) =>
      ModalRoute.of(context)?.isCurrent != true;

  @override
  void dispose() {
    _videoController.removeListener(videoStatus);
    _videoController.dispose();
    super.dispose();
  }
}
