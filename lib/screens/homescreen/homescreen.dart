import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:BoxDecoration(
        image:DecorationImage(
          image:AssetImage('images/image10.png'),
          fit:BoxFit.cover
        ),
      ),
      child: Scaffold(
        drawer: Drawer(child: Text('My drawer')),
        backgroundColor: Colors.transparent,

        appBar: AppBar(
          backgroundColor: Color.fromARGB(30, 0, 0, 0), // ✅ needed so borderRadius in flexibleSpace is visible
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
                  return IconButton(
                    onPressed: () => {Scaffold.of(context).openDrawer()},
                    icon: Icon(Icons.menu, color: Colors.white),
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

              IconButton(
                onPressed: () {},
                icon: Icon(Icons.person, color: Colors.white),
              ),
            ],
          ),
        ),

        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors
              .transparent, // ✅ full-screen body background (only visible below AppBar)
          child: const Center(child: Text('Welcome')),
        ),
      ),
    );
  }
}
