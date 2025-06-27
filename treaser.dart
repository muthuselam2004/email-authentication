import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class tren extends StatefulWidget {
  const tren({super.key});

  @override
  State<tren> createState() => _VideoState();
}

class _VideoState extends State<tren> {
  late FlickManager flickManager;
  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
        videoPlayerController:
        VideoPlayerController.networkUrl(Uri.parse("http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4"),
        ));


  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Icon(Icons.arrow_back,color: Colors.white,),
        actions: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.cast,size: 20,color: Colors.white,),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.perm_contact_calendar_sharp,size: 20,color: Colors.white,),
              )
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 450,
              width: 400,
              child: FlickVideoPlayer(
                flickManager: flickManager,
                flickVideoWithControls: FlickVideoWithControls(
                  closedCaptionTextStyle: TextStyle(fontSize: 8),
                  controls: FlickPortraitControls(),),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("JIO CINEMA",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.shopping_bag,color: Colors.red,size: 30,),
                  Text("Watch with jio membership",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  onPressed: (){}, child: Text("Watch with membership",style: TextStyle(color: Colors.black),)),
            ),
            Container(
              height: 80,

              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 1,
                  itemBuilder: (BuildContext context,int index)
                  {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Icon(Icons.video_collection_outlined,size: 30,),
                              Text("saved ")
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Icon(Icons.add,size: 30,),
                              Text("Watchlist")
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Icon(Icons.thumb_up_alt_outlined,size: 30,),
                              Text("Like")
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Icon(Icons.thumb_down_alt_outlined,size: 30,),
                              Text("Not for me")
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Icon(Icons.share,size: 30,color: Colors.black,),
                              Text("Share")
                            ],
                          ),
                        )
                      ],
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("A shepherd boy repeatedly tricked villagers by falsely claiming a wolf was attacking his flock. When a real wolf appeared, no one believed him, and his sheep were lost. Moral: Honesty is important."),
            ),
            SizedBox(width:350,child: Text("IMDb 7.5")),
            SizedBox(width:350,child: Text("2025 93 min")),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 20,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.white
                    ),
                    child: Row(
                      children: [
                        Text("LATEST VIDEOS",),

                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}