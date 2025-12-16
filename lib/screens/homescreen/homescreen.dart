import 'package:flutter/material.dart';

class Planet {
  final String imagePath;
  final String imageContent;

  Planet({required this.imagePath, required this.imageContent});
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget card(String image, String content, BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      width: width * 0.88,
      height: height >= 812 ? 0.27 * height : height * 0.4,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Planet of the day",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("images/planet.png", fit: BoxFit.cover),
              SizedBox(width: 25),
              Column(
                children: [
                  SizedBox(
                    width: 200,

                    child: Text(
                      "Mars",
                      softWrap: true,
                      overflow: TextOverflow.visible,
                      style: TextStyle(
                        color: Colors.lightBlueAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: 180,
                    height: 150,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Text(
                        style: TextStyle(
                          overflow: TextOverflow.visible,
                          color: Colors.white,
                        ),
                        softWrap: true,
                        "Mars is the fourth planet from the Sun and the second-smallest planet in the Solar System, only being larger than Mercury. In the English language, Mars is named for the Roman god of war.Mars is the fourth planet from the Sun and the second-smallest planet in the Solar System, only being larger than Mercury. In the English language, Mars is named for the Roman god of war.",
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    List<String> planets = [
      "Mercury",
      "Venus",
      "Earth",
      "Mars",
      "Jupiter",
      "Uranus",
      "Neptun",
      "Pluto",
    ];

    List<Planet> pdetails = [
      Planet(
        imagePath: "images/mars.png",
        imageContent: "Mars is the fourth planet from the Sun.",
      ),
      Planet(
        imagePath: "images/earth.png",
        imageContent: "Earth is our home planet.",
      ),
      Planet(
        imagePath: "images/jupiter.png",
        imageContent: "Jupiter is the largest planet in the Solar System.",
      ),
    ];

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/image10.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        drawer: Drawer(child: Text('My drawer')),
        backgroundColor: Colors.transparent,

        appBar: AppBar(
          backgroundColor: Color.fromARGB(
            30,
            0,
            0,
            0,
          ), // ✅ needed so borderRadius in flexibleSpace is visible
          elevation: 0, //
          toolbarHeight: 75,
          automaticallyImplyActions: false,
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withValues(alpha: 0.3), // ✅ very low opacity
                  Colors.black.withValues(alpha: 0.3),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(18),
                bottomRight: Radius.circular(18),
              ),
            ),
          ),

          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Builder(
                builder: (context) {
                  return Container(
                    width: 46,
                    height: 46,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.transparent,
                      border: Border.all(color: Colors.black, width: 3),
                    ),
                    child: IconButton(
                      onPressed: () => {Scaffold.of(context).openDrawer()},
                      icon: Icon(Icons.menu, color: Colors.white),
                    ),
                  );
                },
              ),
              Column(
                children: [
                  Text(
                    "Milke Way",
                    style: TextStyle(color: Colors.white60, fontSize: 14),
                  ),
                  Text(
                    'Solar System',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),

              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(width: 3, color: Colors.black),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.person, color: Colors.white),
                ),
              ),
            ],
          ),
        ),

        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: const Color.fromRGBO(
            0,
            0,
            0,
            0,
          ), // ✅ full-screen body background (only visible below AppBar)
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: SizedBox(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: planets.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          color: Color.fromARGB(100, 0, 0, 0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.7),
                              blurRadius: 6,
                              spreadRadius: 2,
                              offset: const Offset(3, 3),
                            ),
                          ],
                        ),
                        child: SizedBox(
                          width: 130,
                          height: 60,
                          child: Row(
                            children: [
                              Image.asset(
                                "images/planet.png",
                                fit: BoxFit.cover,
                              ),
                              Text(
                                planets[index],
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: pdetails.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8,vertical:12 ),
                      child: card(
                        pdetails[index].imagePath,
                        pdetails[index].imageContent,
                        context,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
