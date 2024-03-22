import 'package:flutter/material.dart';
import 'package:quiz1/detailPage.dart';
import 'package:quiz1/top_album.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[700],
      appBar: AppBar(
        title: Text('TOP ALBUM', style: TextStyle(fontSize: 20, color: Colors.blueGrey[50]), ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[900],
        actions: [
          IconButton(onPressed: (){
            Navigator.pushReplacementNamed((context), '/login');
          },
              icon: Icon(Icons.logout),color: Colors.blueGrey[50],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0
                ),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: topAlbumList.length,
                itemBuilder: (context, index){
                  TopAlbum topAlbum = topAlbumList[index];
                  return InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailPage(topAlbum: topAlbum),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(topAlbum.imageUrls),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  );
                },
            ),
          ],
        ),
      ),
    );
  }
}
