import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';

class OriaVideoPlayer extends StatefulWidget {
  const OriaVideoPlayer({super.key, required this.videoUrl});
  final String videoUrl;

  @override
  State<OriaVideoPlayer> createState() => _OriaVideoPlayerState();
}

class _OriaVideoPlayerState extends State<OriaVideoPlayer> {
  late VideoPlayerController videoPlayerController;
  late CustomVideoPlayerController _customVideoPlayerController;

  @override
  void initState() {
    super.initState();
    videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
          ..initialize().then((value) => setState(() {}));
    _customVideoPlayerController = CustomVideoPlayerController(
      context: context,
      videoPlayerController: videoPlayerController,
    );
  }

  @override
  void dispose() {
    _customVideoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: CustomVideoPlayer(
          customVideoPlayerController: _customVideoPlayerController),
    );
  }
}
