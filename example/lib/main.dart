import 'package:flutter/material.dart';
import 'package:video_cached_player/video_cached_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final CachedVideoPlayerController controller =
  CachedVideoPlayerController.network(
    "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
    formatHint: VideoFormat.other,
    videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
  );

  @override
  void initState() {
    super.initState();
    _initializeController(controller);
  }

  Future<void> _initializeController(
      CachedVideoPlayerController controller) async {
    await controller.initialize().then((value) {
      controller.play();
    });
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      body: Column(
        children: [
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Player with cache enabled.",
              style: TextStyle(fontSize: 16),
            ),
          ),
          AspectRatio(
              aspectRatio: controller.value.aspectRatio,
              child: CachedVideoPlayer(controller)),
          TextButton(
            child: Text("Start pre cache"),
            onPressed: () {
              //video gets downloaded for 300 ms before playback.
              //controller.preCache(300);
              //precaching duration can also be hardcoded
              //controller.preCache();
            },
          ),
          TextButton(
            //video playback shouldn't start automatically
            child: Text("Play video"),
            onPressed: () {
              controller.play();
            },
          ),
          TextButton(
            child: Text("Pause video"),
            onPressed: () {
              controller.pause();
            },
          ),
          TextButton(
            child: Text("Stop video"),
            onPressed: () {
              //pause and move to first frame
              //controller.stop();
            },
          ),
          TextButton(
            //clear url resource from DataSource
            child: Text("Clear cache"),
            onPressed: () {
            },
          ),
        ],
      ),

      /*
      body: Center(
          child: controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: controller.value.aspectRatio,
                  child: CachedVideoPlayer(controller))
              : const CircularProgressIndicator()), // This trailing comma makes auto-formatting nicer for build methods.
   */

    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
