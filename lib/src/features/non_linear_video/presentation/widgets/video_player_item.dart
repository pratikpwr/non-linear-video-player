import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';

class VideoPlayerItem extends StatefulWidget {
  const VideoPlayerItem({
    super.key,
    required this.controller,
  });

  final ChewieController controller;

  @override
  State<VideoPlayerItem> createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<VideoPlayerItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: widget.controller.aspectRatio ?? 16 / 9,
      child: Chewie(controller: widget.controller),
    );
  }

  @override
  void dispose() {
    // chewieController.dispose();
    super.dispose();
  }
}
