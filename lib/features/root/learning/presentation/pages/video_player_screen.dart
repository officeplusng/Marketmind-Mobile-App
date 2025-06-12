import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

import '../../../../../core/export/export.core.dart';
import 'package:marketmind/features/root/home/presentation/components/home_app_bar_action_icon.dart';
import '../_components/tp_sl_configuration.dart';
import '../_components/video_preview_component.dart';

class VideoPlayerLandscapeScreen extends StatefulWidget {
  final String url;
  final String title;

  const VideoPlayerLandscapeScreen({super.key, required this.url, required this.title});

  @override
  _VideoPlayerLandscapeScreenState createState() => _VideoPlayerLandscapeScreenState();
}

class _VideoPlayerLandscapeScreenState extends State<VideoPlayerLandscapeScreen> {
  @override
  void initState() {
    super.initState();
    // Lock to landscape
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);

    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.url))
      ..initialize().then((_) {
        setState(() {});
      });
    _controller.addListener(() async {
      final durationInSeconds = _controller.value.duration.inSeconds;
      final positionInSeconds = _controller.value.position.inSeconds;
      final progressPercent = (positionInSeconds / durationInSeconds) * 100;
      setState(() {
        _currentValue = progressPercent;
      });
    });
  }

  late VideoPlayerController _controller;

  bool _play = false;

  double _currentValue = 0;

  @override
  void dispose() {
    _controller.dispose();
    // Reset to default orientations when leaving
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var copyWith = context.textTheme.bodyMedium
        ?.copyWith(fontWeight: FontWeight.w500, color: AppColors.white);
    return BaseScaffold(
      backgroundColor: AppColors.black,
        horizontalPadding: 0,
        verticalPadding: 0,
        child:  Container(
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        children: [
          Center(
            child: _controller.value.isInitialized
                ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(
                _controller,
              ),
            )
                : Container(),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: ShapeDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      AppColors.black.withOpacity(.6),
                      AppColors.black.withOpacity(.4),
                      AppColors.black.withOpacity(.2),
                      AppColors.black.withOpacity(0),
                      AppColors.black.withOpacity(.2),
                      AppColors.black.withOpacity(.4),
                      AppColors.black.withOpacity(.6),
                    ]),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
          Center(
            child: InkWell(
              onTap: () {
                setState(() {
                  _controller.value.isPlaying
                      ? _controller.pause()
                      : _controller.play();
                });
              },
              child: Container(
                width: 50,
                height: 50,
                alignment: Alignment.center,
                decoration: const ShapeDecoration(
                  shape: const CircleBorder(),
                  color: AppColors.white,
                ),
                child: Icon(
                  color: AppColors.primary,
                  size: 30,
                  _controller.value.isPlaying
                      ? Icons.pause
                      : Icons.play_arrow,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 50),
              padding: const EdgeInsets.all(20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _play = !_play;
                        _controller.value.isPlaying
                            ? _controller.pause()
                            : _controller.play();
                      });
                    },
                    child: Icon(
                      _play
                          ? Icons.pause_circle_outline
                          : Icons.play_circle_outline,
                      color: AppColors.white,
                    ),
                  ),
                  15.horizontalSpace,
                  Text(
                    formatDuration(_controller.value.position),
                    style: copyWith,
                  ),
                  15.horizontalSpace,
                  Expanded(
                      child: SizedBox(
                        height: 10,
                        child: SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbShape: CustomBorderThumb(
                                thumbRadius: 12, color: AppColors.white),
                            activeTrackColor: AppColors.white,
                            trackHeight: 6,
                            padding: const EdgeInsets.all(0),
                            inactiveTrackColor: AppColors.gray.withOpacity(.5),
                          ),
                          child: Slider(
                            value: _currentValue,
                            min: 0,
                            max: 100,
                            divisions: 100,
                            onChanged: (value) => setState(() {
                              _currentValue = value;
                              final positionInSeconds =
                                  (value * _controller.value.duration.inSeconds) /
                                      100;
                              _controller.seekTo(
                                  Duration(seconds: positionInSeconds.toInt()));
                            }),
                          ),
                        ),
                      )),
                  15.horizontalSpace,
                  Text(formatDuration(_controller.value.duration),
                      style: copyWith),
                  15.horizontalSpace,
                  GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset(Assets.maximize),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 50),
              padding: const EdgeInsets.all(20),
              child:
              HomeAppBarActionIcon(
                color: AppColors.black.withOpacity(.75),
                onClick: () {
                  context.pop();
                },
                child:  const Icon(
                  Icons.keyboard_arrow_left,
                  color: AppColors.white,
                  size: 18,
                ),
              ),),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                widget.title,
                style: context.textTheme.titleMedium?.copyWith(
                    fontSize: 20,
                    color: AppColors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
