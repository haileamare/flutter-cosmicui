import 'package:flutter/material.dart';
import 'package:myfirstapp/main.dart';
import 'package:myfirstapp/widgets/buttonwidget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
          var offeset=box.localToGlobal(Offset.zero);
          var top=offeset.dy;
        setState(() {
          _firstChildHeight = box.size.height / 2 +top;
        });
        debugPrint('top:${_firstChildHeight}');
      }
    });
  }

  Widget Boxes(double width, double height, IconData icon) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(color: Color.fromARGB(200, 0, 0, 0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[
        Container(
          child:Icon(
           icon,
            color:Colors.white,
            size:40)
        ),
         RichText(

          text: TextSpan(
            text:"Mass",
            style:TextStyle(color:Colors.white)
          ),
         ),
         RichText(
          text: TextSpan(
            children:[
             TextSpan(text:"( 10",style:TextStyle(color:Colors.white)),
             WidgetSpan(
              child:Transform.translate(
                offset:Offset(0,-5),
                child:Text("24",
                style: TextStyle(color:Colors.white),)
              )
             ),
             TextSpan(text:"Kg )",style: TextStyle(color:Colors.white))
            ]
          ),
         ),
         Text(
          "5.98",
          style:TextStyle(
            color:Colors.white,
            fontSize: 25,
            fontWeight:FontWeight.bold
          )
         )
      ]
    ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    final icons =[
      FontAwesomeIcons.personBooth,
      FontAwesomeIcons.magnet,
      FontAwesomeIcons.sun,
      FontAwesomeIcons.rocket,
      FontAwesomeIcons.thermometer,
      FontAwesomeIcons.sunPlantWilt];
    final imageTop=height *0.01;
    final imageHeight=height *0.25;
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
              top:height *0.01,
              left: 20,
              right: 20,
              child: Image.asset(
                'logo/planet4x.png',
                key:_firstChildKey,
                width: 500,
                height: 250,
                scale: 0.2,
              ),
            ),

            Positioned(
              top: imageHeight/2+imageTop+30,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.only(top: 30),
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
                          alignment:Alignment.center,
                          color: Colors.transparent,
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
                                  childAspectRatio: width <=385 ?2/ 3:8/9,
                                  mainAxisSpacing: 0,
                                  crossAxisSpacing: 0,
                                ),
                            itemCount: 6,
                            itemBuilder: (_, i) =>
                                Boxes(width * 0.5, height * 0.5,icons[i]),
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
                            begin:Alignment.topLeft,
                            
                          ),
                          borderRadius:BorderRadius.all(Radius.elliptical(26,30))
                        ),
                        height:height*0.07,
                        width:width*0.3,
                        child:MaterialButton(
                          onPressed:()=>{print("visit Button pressed")},
                          child:Text("Visit",
                          style:TextStyle(fontSize: 18,fontWeight:FontWeight.bold,
                          color:Colors.white))
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
