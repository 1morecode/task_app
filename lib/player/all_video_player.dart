
import 'package:ext_video_player/ext_video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_app/player/all_video_controller.dart';

class AllVideoPlayer extends StatefulWidget {
  final String url;

  AllVideoPlayer(this.url) : assert(url != null);

  @override
  AllVideoPlayerState createState() => AllVideoPlayerState();
}

class AllVideoPlayerState extends State<AllVideoPlayer> {
  VideoPlayerController _controller;
  String videoUrl;

  @override
  void initState() {
    super.initState();
    videoUrl = widget.url;
    print("-------------------+++++++++$videoUrl");
    _controller = VideoPlayerController.network("$videoUrl");
    _controller.setVolume(1.0);

    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize();
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: AspectRatio(
            aspectRatio: 4 / 2,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                VideoPlayer(_controller),
                AllVideoController(controller: _controller),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
