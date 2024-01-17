import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pod_player/pod_player.dart';
import 'package:riverspods/providers/movie_provider.dart';


class VideoPage extends ConsumerWidget {
  final int id;
  const VideoPage({super.key, required this.id});

  @override
  Widget build(BuildContext context, ref) {
    final videoData = ref.watch(videoProvider(id));
    return Scaffold(
        body: Column(
          children: [
            videoData.when(data: (data){

              return  PlayVideoFromNetwork(keys: data[0].key,);
            }, error: (err, st) => Center(child: Text('$err')), loading: () => Container())

          ],
        )
    );
  }
}


class PlayVideoFromNetwork extends StatefulWidget {
  final String keys;
  const PlayVideoFromNetwork({Key? key, required this.keys}) : super(key: key);

  @override
  State<PlayVideoFromNetwork> createState() => _PlayVideoFromNetworkState();
}

class _PlayVideoFromNetworkState extends State<PlayVideoFromNetwork> {
  late final PodPlayerController controller;

  @override
  void initState() {
    controller = PodPlayerController(
      playVideoFrom:  PlayVideoFrom.youtube('https://youtu.be/${widget.keys}'),
    )..initialise();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PodVideoPlayer(controller: controller);
  }
}
