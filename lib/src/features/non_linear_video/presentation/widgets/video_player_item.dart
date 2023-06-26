import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerItem extends StatefulWidget {
  const VideoPlayerItem({
    super.key,
    required this.controller,
  });

  final VideoPlayerController controller;

  @override
  State<VideoPlayerItem> createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<VideoPlayerItem> {
  late ChewieController chewieController;

  @override
  void initState() {
    super.initState();

    // chewieController = ChewieController(
    //   videoPlayerController: widget.controller,
    //   autoInitialize: false,
    //   looping: false,
    //   allowFullScreen: false,
    //   allowMuting: true,
    //   aspectRatio: widget.controller.value.aspectRatio,
    //   errorBuilder: (context, errorMessage) {
    //     return Center(
    //       child: Text(
    //         errorMessage,
    //         style: const TextStyle(color: Colors.white),
    //       ),
    //     );
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: widget.controller.value.aspectRatio,
      child: VideoPlayer(widget.controller),
    );
  }

  @override
  void dispose() {
    chewieController.dispose();
    super.dispose();
  }
}
