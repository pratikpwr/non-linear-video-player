import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../entities/interaction_entity.dart';
import '../widget/interaction_input_dialog.dart';
import '../widget/video_player_item.dart';

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
  late ChewieController _chewieController;

  late InteractiveEntity _currentInteraction;

  @override
  void initState() {
    super.initState();
    _currentInteraction = widget.data;
    initializeVideo(widget.data.videoUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _videoController.value.isInitialized
            ? VideoPlayerItem(
                controller: _chewieController,
              )
            : const Center(child: CircularProgressIndicator()),
      ),
    );
  }

  void initializeVideo(String url) {
    _videoController = VideoPlayerController.network(url);

    _videoController.initialize().then((_) {
      _chewieController = ChewieController(
        videoPlayerController: _videoController,
        aspectRatio: _videoController.value.aspectRatio,
        autoInitialize: false,
        autoPlay: false,
        looping: false,
        allowFullScreen: true,
        allowMuting: true,
        errorBuilder: (context, errorMessage) {
          return Center(
            child: Text(
              errorMessage,
              style: const TextStyle(color: Colors.white),
            ),
          );
        },
      );
      setState(() {});
      _videoController.play();
    });

    _videoController.addListener(listener);
  }

  void changeVideo(String url) {
    _videoController.pause();
    _videoController.removeListener(listener);
    _chewieController.dispose();
    _videoController.dispose();
    initializeVideo(url);
  }

  void listener() {
    // video ended
    if (_videoController.value.position >= _videoController.value.duration) {
      if (_currentInteraction.isLast) {
        return;
      }
      interactionInputDialog(context, res: _currentInteraction,
          onSelect: (interaction) {
        changeVideo(interaction.videoUrl);
        setState(() {
          _currentInteraction = interaction;
        });
      });
    }
  }

  @override
  void dispose() {
    _videoController.removeListener(listener);
    _videoController.dispose();
    super.dispose();
  }
}
