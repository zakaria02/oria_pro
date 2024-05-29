import 'package:flick_video_player/flick_video_player.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class OriaVideoPlayer extends StatefulWidget {
  const OriaVideoPlayer({super.key, required this.videoUrl});
  final String videoUrl;

  @override
  State<OriaVideoPlayer> createState() => _OriaVideoPlayerState();
}

class _OriaVideoPlayerState extends State<OriaVideoPlayer> {
  late FlickManager flickManager;
  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
        videoPlayerController: VideoPlayerController.networkUrl(
      Uri.parse(widget.videoUrl),
    ));
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: FlickVideoPlayer(flickManager: flickManager),
    );
  }
}
