import 'package:marketmind/core/export/export.core.dart';
import 'package:marketmind/features/root/learning/presentation/_components/tp_sl_configuration.dart';
import 'package:marketmind/features/root/learning/presentation/pages/video_player_screen.dart';
import 'package:marketmind/features/root/learning/presentation/video_player_screen.dart';
import 'package:video_player/video_player.dart';

class VideoPreviewComponent extends StatefulWidget {
  const VideoPreviewComponent({super.key, required this.url});

  final String url;

  @override
  State<VideoPreviewComponent> createState() => _VideoPreviewComponentState();
}

class _VideoPreviewComponentState extends State<VideoPreviewComponent> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
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

  bool _play = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double _currentValue = 0;

  @override
  Widget build(BuildContext context) {
    var copyWith = context.textTheme.bodyMedium
        ?.copyWith(fontWeight: FontWeight.w500, color: AppColors.white);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 210,
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
                        AppColors.black.withOpacity(0)
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
              child: Padding(
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
                      onTap: () {
                        context.push(VideoPlayerLandscapeScreen(
                          url: widget.url,
                          title: 'Technical Analysis: Support & Resistance',
                        ));
                      },
                      child: SvgPicture.asset(Assets.maximize),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String formatDuration(Duration duration) {
  if (duration.inSeconds == 0) {
    return '0:00';
  }
  String twoDigits(int n) => n.toString().padLeft(2, '0');

  final hours = duration.inHours;
  final minutes = duration.inMinutes.remainder(60);
  final seconds = duration.inSeconds.remainder(60);

  if (hours > 0) {
    return '${hours}:${twoDigits(minutes)}:${twoDigits(seconds)}';
  } else {
    return '${twoDigits(minutes)}:${twoDigits(seconds)}';
  }
}
