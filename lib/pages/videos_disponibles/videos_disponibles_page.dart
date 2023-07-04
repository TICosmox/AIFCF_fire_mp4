import 'package:flutter/material.dart';


class VideosDisponoblesPage extends StatefulWidget {
  const VideosDisponoblesPage({super.key});

  @override
  State<VideosDisponoblesPage> createState() => _VideosDisponoblesPageState();
}

class _VideosDisponoblesPageState extends State<VideosDisponoblesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        title: Image.asset('assets/images/logo_aifcf.png', fit: BoxFit.contain, height: 60,),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
      ),

      body: Stack(
        children: [
          ListView(
            children: [
              Container(
                height: 100,
                color: Colors.grey,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: 100,
                      margin: const EdgeInsets.all(8),
                      color: Colors.red,
                      child: Center(
                        child: Text(
                          'Video $index',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 50), // Espacio para dejar lugar a la lista horizontal
              
              Container(
                height: 100,
                color: Colors.grey,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 100,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: 100,
                      margin: EdgeInsets.all(8),
                      color: Colors.blue,
                      child: Center(
                        child: Text(
                          'Video $index',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 50), // Espacio para dejar lugar a la lista horizontal
              
              Container(
                height: 100,
                color: Colors.grey,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 100,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: 100,
                      margin: EdgeInsets.all(8),
                      color: Colors.red,
                      child: Center(
                        child: Text(
                          'Video $index',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 50), // Espacio para dejar lugar a la lista horizontal
              
              Container(
                height: 100,
                color: Colors.grey,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 100,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: 100,
                      margin: EdgeInsets.all(8),
                      color: Colors.blue,
                      child: Center(
                        child: Text(
                          'Video $index',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: 50), // Espacio para dejar lugar a la lista horizontal
              Container(
                height: 100,
                color: Colors.grey,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 100,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: 100,
                      margin: EdgeInsets.all(8),
                      color: Colors.red,
                      child: Center(
                        child: Text(
                          'Video $index',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: 50), // Espacio para dejar lugar a la lista horizontal
              Container(
                height: 100,
                color: Colors.grey,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 100,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: 100,
                      margin: EdgeInsets.all(8),
                      color: Colors.blue,
                      child: Center(
                        child: Text(
                          'Item $index',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 50), // Espacio para dejar lugar a la lista horizontal
              Container(
                height: 100,
                color: Colors.grey,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 100,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: 100,
                      margin: EdgeInsets.all(8),
                      color: Colors.red,
                      child: Center(
                        child: Text(
                          'Item $index',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCarousel(BuildContext context, int carouselIndex) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text('Carousel $carouselIndex'),
        SizedBox(
          // you may want to use an aspect ratio here for tablet support
          height: MediaQuery.of(context).size.height * .7,
          child: PageView.builder(
            // store this controller in a State to save the carousel scroll position
            controller: PageController(viewportFraction: 0.8),
            itemBuilder: (BuildContext context, int itemIndex) {
              return _buildCarouselItem(context, carouselIndex, itemIndex);
            },
          ),
        )
      ],
    );
  }

  Widget _buildCarouselItem(
      BuildContext context, int carouselIndex, int itemIndex) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Card(
        elevation: 12,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        color: Colors.black,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
              child: Image.asset(
                'assets/images/logo.jpg',
                height: 200,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            const ListTile(
              title: Text(
                'Melbourne Cricket Stadium',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              subtitle: Text(
                'Australia',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        style:
                            TextButton.styleFrom(backgroundColor: Colors.white),
                        onPressed: () {},
                        child: const Text(
                          "Edit",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: TextButton(
                        style:
                            TextButton.styleFrom(backgroundColor: Colors.red),
                        onPressed: () {},
                        child: const Text(
                          "Delete",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),

      // Container(
      //   decoration: const BoxDecoration(
      //     color: Colors.grey,
      //     borderRadius: BorderRadius.all(Radius.circular(4.0)),
      //   ),
      // ),
    );
  }
}
