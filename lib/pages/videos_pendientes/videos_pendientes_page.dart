import 'package:flutter/material.dart';

class VideosPendientesPage extends StatefulWidget {
  const VideosPendientesPage({super.key});

  @override
  State<VideosPendientesPage> createState() => _VideosPendientesPage();
}

class _VideosPendientesPage extends State<VideosPendientesPage> {
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      extendBodyBehindAppBar: false,
      extendBody: true,
      appBar: AppBar(
        title: Image.asset(
          'assets/images/logo_aifcf.png',
          fit: BoxFit.contain,
          height: 60,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        // actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: Text(
              "Concluidos",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Horizontal list of featured content
          Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(8),
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage("assets/images/logo.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),

          // Popular shows section
          Container(
            padding: EdgeInsets.all(16),
            child: Text(
              'Sin Empezar',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 0.7,
              ),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            "assets/images/logo.jpg",
                            // popularShows[index].imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Titulo del curso",
                        // popularShows[index].title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              })
        ],
      ),
    );
  }

}
