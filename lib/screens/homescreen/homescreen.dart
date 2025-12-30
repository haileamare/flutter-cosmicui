import 'package:flutter/material.dart';
import 'package:myfirstapp/screens/detailscreen/detailscreen.dart';
import 'package:myfirstapp/screens/favorites/favorites.dart';

class Planet {
  final String imagePath;
  final String imageContent;
  final String planetName;

  Planet({
    required this.planetName,
    required this.imagePath,
    required this.imageContent,
  });
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget card(Planet planet, BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      width: width * 0.85,
      height: height * 0.35,
      padding: EdgeInsets.all(height * 0.02),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.5),
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
                fontWeight: FontWeight.w900,
                fontSize: 16,
                //fontFamily: 'Roboto',
                color: Colors.white,
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("images/planet.png", fit: BoxFit.cover),
              SizedBox(width: width*0.04),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child:  Column(
                    children: [
                      SizedBox(
                        width: width * 0.4,
                  
                        child: Text(
                          "Mars",
                          softWrap: true,
                          overflow: TextOverflow.visible,
                          style: TextStyle(
                            color: Colors.lightBlueAccent,
                            fontWeight: FontWeight.w900,
                            fontFamily: 'fantasy',
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(height: height*0.002),
                      SizedBox(
                        width: width * 0.4,
                        height:height<812? height *0.15:height*0.2,
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
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "details",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () => {
                      Navigator.push(context,MaterialPageRoute(builder:(context)=>DetailScreen()))
                    },
                    icon: Icon(
                      Icons.arrow_forward,
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                ],
              ),
            ),
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
        planetName: "Mars",
        imagePath: "images/planet.png",
        imageContent: "Mars is the fourth planet from the Sun.",
      ),
      Planet(
        imagePath: "images/planet.png",
        planetName: "Earth",
        imageContent: "Earth is our home planet.",
      ),
      Planet(
        planetName: "Jupiter",
        imagePath: "images/planet.png",
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
        bottomNavigationBar:Container(
          margin: EdgeInsets.symmetric(horizontal: 8),
          decoration:BoxDecoration(
          color:Color.fromARGB(25, 0,0,0),

          ),
          child: BottomNavigationBar(
            backgroundColor:Colors.transparent,
            selectedItemColor:Colors.lightBlueAccent,
            unselectedItemColor:Colors.white60,
            items:[
              BottomNavigationBarItem(
                label: "Home",
                icon:IconButton(
                  onPressed:(){},
                  icon:Icon(Icons.web,color: Colors.white,)
                ),
                
              ),
              BottomNavigationBarItem(
                label: "Favorites",
                icon:IconButton(
                  onPressed:(){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder:(context)=>Favorites(SelectedIndex: 0,))
                    );
                  },
                  icon:Icon(Icons.favorite,color:Colors.white),
                
                ),
                
              ),
               BottomNavigationBarItem(
                label: "More",
                
                icon:IconButton(
                  onPressed:(){},
                  icon:Icon(Icons.more,color:Colors.white),
                
                ),
                
              ),
            ]
          ),
        ),
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
                     width: 49,
                     height: 49,
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
                width: 49,
                height: 49,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(width: 3, color: Colors.black),
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.person, color: Colors.white),
                ),
              ),
            ],
          ),
        ),

        body: Container(
          //height: double.infinity,
          width: double.infinity,
          color: const Color.fromRGBO(
            0,
            0,
            0,
            0,
          ), // ✅ full-screen body background (only visible below AppBar)
          child: SingleChildScrollView(
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
                SizedBox(
                  height: height * 0.38,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: pdetails.length,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 0,
                              ),
                              child: card(pdetails[index], context),
                            ),
                          ],
                        );
                      },
                    ),
                ),
                Container(
                  width: width,
                  height: height * 0.38,
                  padding:EdgeInsets.symmetric(horizontal: 20,vertical:15),
                  margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  child:SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment:CrossAxisAlignment.start,
                      children:[
                        Text(
                          "Solar System",
                          style:TextStyle(
                            color:Colors.white,
                            fontWeight:FontWeight.bold,
                            fontSize:18
                          ),
                        ),
                        Text("The Solar System is the gravitationally bound system of the Sun and the objects that orbit it. It formed 4.6 billion years ago from the gravitational collapse of a giant interstellar molecular cloud. The vast majority (99.86%) of the system's mass is in the Sun, with most of the remaining mass contained in the planet Jupiter. The four inner system planets—Mercury, Venus, Earth and Mars—are terrestrial planets, being composed primarily of rock and metal. The four giant planets of the outer system are substantially larger and more massive than the terrestrials. ",
                        style:TextStyle(
                          color:Colors.white70,
                          fontWeight:FontWeight.normal,
                          fontFamily:'new times roman',
                          fontSize:14,
                          wordSpacing:2
                        ))
                      ]
                    ),
                  ),
                ),
                  Container(
                  width: width,
                  height: height * 0.38,
                  padding:EdgeInsets.symmetric(horizontal: 20,vertical:15),
                  margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  child:SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment:CrossAxisAlignment.start,
                      children:[
                        Text(
                          "Solar System",
                          style:TextStyle(
                            color:Colors.white,
                            fontWeight:FontWeight.bold,
                            fontSize:18
                          ),
                        ),
                        Text("The Solar System is the gravitationally bound system of the Sun and the objects that orbit it. It formed 4.6 billion years ago from the gravitational collapse of a giant interstellar molecular cloud. The vast majority (99.86%) of the system's mass is in the Sun, with most of the remaining mass contained in the planet Jupiter. The four inner system planets—Mercury, Venus, Earth and Mars—are terrestrial planets, being composed primarily of rock and metal. The four giant planets of the outer system are substantially larger and more massive than the terrestrials. ",
                        style:TextStyle(
                          color:Colors.white70,
                          fontWeight:FontWeight.normal,
                          fontFamily:'new times roman',
                          fontSize:14,
                          wordSpacing:2
                        ))
                      ]
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
