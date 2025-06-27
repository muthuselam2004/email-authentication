import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';



class ott extends StatefulWidget {
  const ott({super.key});

  @override
  State<ott> createState() => _ottState();
}




class _ottState extends State<ott> {

  late FlickManager flickManager;
  bool playing = false;





  @override
  void dispose() {
    if (playing) flickManager.dispose();
    super.dispose();
  }


  void playEpisode() {
    setState(() {
      playing = true;

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: playing
          ? Center(
        child: FlickVideoPlayer(flickManager: flickManager),
      )
          : _buildEpisodeInfo(),
    );
  }

  Widget _buildEpisodeInfo() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.black, Colors.grey.shade900],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: playEpisode,
            child: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.white.withOpacity(0.8),
              child: Icon(Icons.play_arrow, size: 50, color: Colors.black),
            ),
          ),
          SizedBox(height: 30),
          Text(
            'Doraemon',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            'S20 E3 Taxi-kerchief; Omni-Sketchbook',
            style: TextStyle(fontSize: 14, color: Colors.grey.shade300),
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              iconButton(Icons.add, 'Watchlist', () => print('Watchlist')),
              iconButton(Icons.download, 'Download', () => print('Download')),
              iconButton(Icons.share, 'Share', () => print('Share')),
              iconButton(Icons.favorite_border, 'Rate', () => print('Rate')),
            ],
          )
        ],
      ),
    );
  }

  Widget iconButton(IconData icon, String label, VoidCallback onPressed) {
    return Column(
      children: [
        IconButton(
          icon: Icon(icon, color: Colors.white),
          onPressed: onPressed,
        ),
        Text(label, style: TextStyle(color: Colors.white)),
      ],
    );
  }
}




