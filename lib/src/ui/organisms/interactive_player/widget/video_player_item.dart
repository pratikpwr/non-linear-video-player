import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';

class VideoPlayerItem extends StatelessWidget {
  const VideoPlayerItem({
    super.key,
    required this.controller,
  });

  final ChewieController controller;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: controller.aspectRatio ?? 16 / 9,
      child: Chewie(controller: controller),
    );
  }
}
