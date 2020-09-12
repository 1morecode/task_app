import 'package:ext_video_player/ext_video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_app/player/all_video_progress_bar.dart';
import 'utils.dart';

class AllVideoController extends StatelessWidget {
  final VideoPlayerController controller;

  const AllVideoController({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Duration completeDuration;
    Duration currentDuration;
    if (controller.value.duration != null) {
      completeDuration =
          new Duration(milliseconds: controller.value.duration.inMilliseconds);
      currentDuration =
          new Duration(milliseconds: controller.value.position.inMilliseconds);
    }
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: Duration(milliseconds: 50),
          reverseDuration: Duration(milliseconds: 200),
          child: Container(
              color: Colors.black12,
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  new Container(
                    height: 40,
                  ),
                  new Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.black.withOpacity(0.7),
                    alignment: Alignment.center,
                    child: Padding(
                        padding: EdgeInsets.only(right: 15, left: 15, top: 10, bottom: 5),
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            new Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                !controller.value.initialized
                                    ? new CupertinoActivityIndicator(
                                  animating: true,
                                  radius: 10,
                                )
                                    : GestureDetector(
                                  child: controller.value.isPlaying
                                      ? Icon(Icons.pause, size: 32, color: Colors.white,)
                                      : Icon(Icons.play_arrow, size: 32, color: Colors.white,),
                                  onTap: () {
                                    if (controller.value.isPlaying) {
                                      controller.pause();
                                    } else {
                                      controller.play();
                                    }
                                  },
                                ),
                                new SizedBox(
                                  width: 10,
                                ),
                                new Text(
                                  controller.value.duration != null ? "${formatVideoDuration(currentDuration)}" : "00:00",
                                  textAlign: TextAlign.center,
                                  style:
                                  TextStyle(fontSize: 14, color: Colors.white,),
                                ),
                                new SizedBox(
                                  width: 10,
                                ),
                                new Expanded(
                                  child: AllVideoProgressIndicator(
                                    controller,
                                    padding: EdgeInsets.all(10),
                                    allowScrubbing: true,
                                    colors: VideoProgressColors(
                                        playedColor:  Colors.blueGrey,
                                        bufferedColor: Colors.grey,
                                        backgroundColor: Colors.white.withOpacity(0.5),),
                                  ),
                                ),
                                new SizedBox(
                                  width: 10,
                                ),
                                new Text(
                                  controller.value.duration != null ? "${formatVideoDuration(completeDuration)}" : "00:00",
                                  textAlign: TextAlign.center,
                                  style:
                                  TextStyle(fontSize: 14, color: Colors.white,),
                                ),
                              ],
                            )
                          ],
                        )),
                  ),
                ],
              )),
        ),
//        GestureDetector(
//          onTap: () {
//            controller.value.isPlaying ? controller.pause() : controller.play();
//          },
//        ),
      ],
    );
  }
}
