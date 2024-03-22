import 'package:flutter/material.dart';
import 'package:quiz1/top_album.dart';
// import 'package:';

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
      appBar: AppBar(
        title: Text(widget.topAlbum.albumName),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                widget.topAlbum.imageUrls,
                // Menampilkan gambar pertama dari list URL gambar
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10),
              SizedBox(height: 5),
              Text(
                widget.topAlbum.albumName,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),

              Text(
                widget.topAlbum.singer,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              SizedBox(height: 5),
              Text(
                widget.topAlbum.releaseDate,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),

              SizedBox(height: 5),
              Text(
                widget.topAlbum.firstEntryDate,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),

              SizedBox(height: 5),
              Text(
                widget.topAlbum.firstEntryPosition,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),

              SizedBox(height: 5),
              Text(
                widget.topAlbum.source,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              SizedBox(height: 5),
              Container(
                child:
                Text(
                  widget.topAlbum.songs[0],
                  style: TextStyle(fontSize: 16),
                ),
              ),

              ElevatedButton(onPressed: (){
                // _launchURL(widget.topAlbum.albumurl);

              }, child: Text('Spotify'),
              )
            ],
          ),
        ),
      ),
    );
  }
  // Future<void> _launchURL(String url) async{
  //   if(await canLaunchUrl(Uri.parse(url))){
  //     launchUrl(Uri.parse(url));
  //   }else{
  //     throw 'Could not launch $url';
  //   }
}
