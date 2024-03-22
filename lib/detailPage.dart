import 'package:flutter/material.dart';
import 'package:quiz1/top_album.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  final TopAlbum topAlbum;

  DetailPage({required this.topAlbum});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[700],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: Text(widget.topAlbum.albumName, style: TextStyle(color: Colors.blueGrey[50]),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(
                  widget.topAlbum.imageUrls, // menampilkan url gambar
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Text(
                  widget.topAlbum.albumName, // menampilkan nama album
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blueGrey[50]),
                ),
              ),
              Center(
                child: Text(
                  widget.topAlbum.singer, // menampilkan nama penyanyi
                  style: TextStyle(fontSize: 16, color: Colors.blueGrey[100]),
                ),
              ),
              SizedBox(height: 10),

              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_month_outlined,
                            color: Colors.blueGrey[100],
                          ),
                          SizedBox(width: 5),
                          Text(
                            widget.topAlbum.releaseDate,
                            style: TextStyle(fontSize: 16, color: Colors.blueGrey[100]),
                          ),
                        ],
                      ),
                      SizedBox(height: 20, child: VerticalDivider(color: Colors.blueGrey[50])),
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_month,
                            color: Colors.blueGrey[100],
                          ),
                          SizedBox(width: 5),

                          Text(
                            widget.topAlbum.firstEntryDate,
                            style: TextStyle(fontSize: 16, color: Colors.blueGrey[100]),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),

                  Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.blueGrey[400],
                            child: Text(
                              widget.topAlbum.firstEntryPosition,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.blueGrey[50],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              _launchURL(widget.topAlbum.albumurl);
                            },
                            icon: Image.network('https://www.freepnglogos.com/uploads/spotify-logo-png/spotify-logo-spotify-symbol-3.png', width: 64, height: 64,) ,
                          ),

                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 10),

                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.house_outlined,
                          color: Colors.blueGrey[100],
                        ),
                        SizedBox(width: 3),
                        Text(
                          widget.topAlbum.source,
                          style: TextStyle(fontSize: 16, color: Colors.blueGrey[100]),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),

              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 4.0),
                padding: EdgeInsets.all(14.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueGrey),
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.blueGrey[400],
                ),
                child: Text(
                  "Song List :",
                  style: TextStyle(fontSize: 16, color: Colors.blueGrey[50]),
                ),
              ),
              _songListWidget(widget.topAlbum.songs),
            ],
          ),
        ),
      ),
    );
  }

  Widget _songListWidget(List<String> songs) {
    return Column(
      children: songs.map((song) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 4.0),
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(12.0),
            color: Colors.blueGrey[50],
          ),
          child: ListTile(
            title: Text(song, textAlign: TextAlign.center,
            ),
          ),
        );
      }).toList(),
    );
  }


  Future<void> _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }
}


