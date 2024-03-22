import 'package:flutter/material.dart';
import 'package:quiz1/detailPage.dart';
import 'package:quiz1/top_album.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TOP ALBUM'),
        actions: [
          IconButton(onPressed: (){
            Navigator.pushReplacementNamed((context), '/login');
          },
              icon: Icon(Icons.logout)
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
