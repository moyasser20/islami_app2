import 'package:flutter/material.dart';
import 'package:islami_app2/core/constants/app_assets.dart';
import 'package:islami_app2/core/extensions/padding_ext.dart';
import 'package:just_audio/just_audio.dart';

class RadioContainerWidget extends StatefulWidget {
  final String radioName;
  final String radioUrl;

  const RadioContainerWidget({
    super.key,
    required this.radioName,
    required this.radioUrl,
  });

  @override
  State<RadioContainerWidget> createState() => _RadioContainerWidgetState();
}

class _RadioContainerWidgetState extends State<RadioContainerWidget> {
  late AudioPlayer _audioPlayer;
  bool _isPlaying = false;
  bool _isMuted = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _audioPlayer.setUrl(widget.radioUrl);

    _audioPlayer.playerStateStream.listen((state) {
      setState(() {
        _isPlaying = state.playing;
      });
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
  void _togglePlayPause() {
    if (_isPlaying) {
      _audioPlayer.pause();
    } else {
      _audioPlayer.play();
    }
  }


  void _toggleMute() {
    _audioPlayer.setVolume(_isMuted ? 1.0 : 0.0);
    setState(() => _isMuted = !_isMuted);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.5,
      height: size.height * 0.15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(
              AppAssets.RadioOff),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.radioName,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: "Janna",
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  _isPlaying ? Icons.pause : Icons.play_arrow,
                  color: Colors.black,
                  size: 50,
                ),
                onPressed: _togglePlayPause,
              ),
              IconButton(
                icon: Icon(
                  _isMuted ? Icons.volume_off : Icons.volume_up,
                  color: Colors.black,
                  size: 40,
                ),
                onPressed: _toggleMute,
              ),
            ],
          )
        ],
      ),
    ).setHorizontalAndVerticalPadding(context, 0.05, 0.01);
  }
}

