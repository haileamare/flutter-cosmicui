import 'package:flutter/material.dart';
import 'package:myfirstapp/main.dart';
import 'package:myfirstapp/widgets/buttonwidget.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final GlobalKey _firstChildKey = GlobalKey();
  double _firstChildHeight = 0;
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final box =
          _firstChildKey.currentContext?.findRenderObject() as RenderBox?;

      if (box != null) {
        setState(() {
          _firstChildHeight = box.size.height / 2;
        });
      }
    });
  }

  Widget Boxes(double width, double height) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(color: Color.fromARGB(200, 0, 0, 0)),
      child: Column(children:[

      ]
    ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/image10.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyActions: false,
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 49,
                height: 49,
                decoration: BoxDecoration(
                  color: Color.fromARGB(100, 0, 0, 0),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Color.fromARGB(167, 0, 0, 0),
                    width: 2,
                  ),
                ),

                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white, size: 25),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              Container(
                height: 49,
                width: 49,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(100, 0, 0, 0),
                  border: Border.all(
                    color: Color.fromARGB(150, 0, 0, 0),
                    width: 2,
                  ),
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                    size: 25,
                  ),
                  onPressed: () => {},
                ),
              ),
            ],
          ),
        ),

        body: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 90,
              left: 20,
              right: 20,
              child: Image.asset(
                'logo/planet4x.png',
                width: 500,
                height: 250,
                scale: 0.2,
              ),
            ),

            Positioned(
              top: _firstChildHeight / 2 + 125 + 90,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.only(top: 70),
                decoration: BoxDecoration(
                  color: Color.fromARGB(150, 0, 0, 0),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withValues(alpha: 0.2),
                      blurRadius: 3,
                      blurStyle: BlurStyle.normal,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      "Earth",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    
                       Expanded(
                         child: Container(
                          color: Colors.lightBlue,
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 20,
                          ),
                          child: GridView.builder(
                            shrinkWrap: true, //
                         
                            // physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  //mainAxisExtent: 200,
                                  crossAxisCount: 3,
                                  childAspectRatio: 3 / 4,
                                  mainAxisSpacing: 1,
                                  crossAxisSpacing: 10,
                                ),
                            itemCount: 6,
                            itemBuilder: (_, i) =>
                                Boxes(width * 0.5, height * 0.5),
                          ),
                                               
                                             ),
                       ),
                      Container(
                        padding:EdgeInsets.all(10),
                        margin:EdgeInsets.all(10),
                        decoration:BoxDecoration(
                          gradient:LinearGradient(
                            colors:[
                               Colors.purple,
                               Colors.blue
                            ],
                            end:Alignment.center,
                            begin:Alignment.topLeft
                          ),
                        ),
                        height:height*0.09,
                        width:width*0.3,
                        child:MaterialButton(
                          onPressed:()=>{print("visit Button pressed")}
                        ),
                      ),
                    //SizedBox(height:100)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
