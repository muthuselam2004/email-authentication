import 'package:flutter/material.dart';


class vid extends StatefulWidget {
  const vid({super.key});

  @override
  State<vid> createState() => _vidState();
}

class _vidState extends State<vid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
          // Video Player Container (UI only)
          Container(
          height: 220,
          width: double.infinity,
          color: Colors.black,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                color: Colors.black,
                child: const Center(
                  child: Icon(Icons.play_circle_fill, color: Colors.white, size: 64),
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Icon(Icons.arrow_back, color: Colors.white),
              ),
            ],
          ),
        ),

        // Title & Info
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Movie Title Here',
                style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Row(
                children: [
                  Text('2024 • 2h 20m • Action', style: TextStyle(color: Colors.grey)),
                ],
              ),
              SizedBox(height: 8),
              Text(
                'A short description or storyline of the movie goes here. This is static placeholder text.',
                style: TextStyle(color: Colors.white70),
              ),
            ],
          ),
        ),

        // Watchlist / Download Buttons
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: null,
                  icon: Icon(Icons.play_arrow),
                  label: Text('Play'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    foregroundColor: Colors.white,
                  ),
                ),
              ),
              SizedBox(width: 10),
              IconButton(
                onPressed: null,
                icon: Icon(Icons.file_download_outlined, color: Colors.white),
              ),
              IconButton(
                onPressed: null,
                icon: Icon(Icons.bookmark_border, color: Colors.white),
              ),
            ],
          ),
        ),

        Divider(color: Colors.grey),

        // Cast Section
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Text('Cast:', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              SizedBox(width: 10),
              Text('Actor 1, Actor 2, Director', style: TextStyle(color: Colors.grey)),
            ],
          ),
        ),

        Divider(color: Colors.grey),

        // Suggested Videos Section
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text('More Like This', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ),
        SizedBox(height: 8),
        SizedBox(
          height: 100,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 12),
              itemCount: 5,
              separatorBuilder: (_, index) => SizedBox(width: 10),
              itemBuilder: (_, index) => Container(
            width: 120,
            color: Colors.grey[800],
            child: Center(child: Text('Video ${index + 1}', style: TextStyle(color: Colors.white))),
          ),
        ),
      ),
            SizedBox(height: 8),
            SizedBox(
              height: 100,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 12),
                itemCount: 5,
                separatorBuilder: (_, index) => SizedBox(width: 10),
                itemBuilder: (_, index) => Container(
                  width: 120,
                  color: Colors.grey[800],
                  child: Center(child: Text('Video ${index + 1}', style: TextStyle(color: Colors.white))),
                ),
              ),
            ),
            SizedBox(height: 8),
            SizedBox(
              height: 100,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 12),
                itemCount: 5,
                separatorBuilder: (_, index) => SizedBox(width: 10),
                itemBuilder: (_, index) => Container(
                  width: 120,
                  color: Colors.grey[800],
                  child: Center(child: Text('Video ${index + 1}', style: TextStyle(color: Colors.white))),
                ),
              ),
            ),




      ],
    ),
    ),
    );

  }
}
