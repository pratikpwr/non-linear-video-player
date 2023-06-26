import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../domain/entities/interaction_entity.dart';
import '../widgets/video_player_item.dart';

class InteractivePlayer extends StatefulWidget {
  const InteractivePlayer({
    super.key,
    required this.data,
  });

  final InteractiveEntity data;

  @override
  State<InteractivePlayer> createState() => _InteractivePlayerState();
}

class _InteractivePlayerState extends State<InteractivePlayer> {
  late VideoPlayerController _videoController;

  late InteractiveEntity currentData;

  @override
  void initState() {
    super.initState();

    currentData = widget.data;
    initVideoController(
      widget.data.videoUrl,
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
      if (currentData.isFinal) {
        return;
      }
      askInput(context, res: currentData);
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

  void askInput(
    BuildContext context, {
    required InteractiveEntity res,
  }) {
    if (_hasAlreadyDialog(context)) {
      Navigator.of(context).pop();
    }
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Choose your option'),
          content: Text(res.question ?? ''),
          actions: List.generate(
            res.options.length,
            (index) {
              return TextButton(
                onPressed: () {
                  changeVideo(res.options[index].videoUrl);
                  setState(() {
                    currentData = res.options[index];
                  });
                  Navigator.of(context).pop();
                },
                child: Text(res.options[index].title),
              );
            },
          ),
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
