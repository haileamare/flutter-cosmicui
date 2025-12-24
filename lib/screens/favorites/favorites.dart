import 'package:flutter/material.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:BoxDecoration(
       image:DecorationImage(
        image:AssetImage('images/image10.png'),
        fit:BoxFit.cover
       )
      ),
      child: Scaffold(
        backgroundColor:Colors.transparent,
        bottomNavigationBar:BottomNavigationBar(
          items:[
            BottomNavigationBarItem(
              icon:Icon(Icons.home),
              label:"Home"
            ),
            BottomNavigationBarItem(
              icon:Icon(Icons.favorite),
              label:"Favorite"
            )
          ]
        ),
        appBar: AppBar(
          automaticallyImplyActions: false,
          automaticallyImplyLeading: false,
          backgroundColor:Colors.transparent,
          toolbarHeight:75,
          flexibleSpace: FlexibleSpaceBar(
            background:Container(
              padding:EdgeInsets.symmetric(vertical:10),
              decoration:BoxDecoration(
               color:Color.fromARGB(120, 0, 0, 0),
               borderRadius: BorderRadius.only(
                 bottomLeft: Radius.circular(16),
                 bottomRight:Radius.circular(16)
               )
                ),
                )
              ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height:45,
                width:45,
                decoration:BoxDecoration(
                  shape:BoxShape.circle,
                   color:Colors.transparent,
                  border:Border.all(width:3)
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.menu,
                    color:Colors.white
                    ), 
                  onPressed: () {}),
              ),
              Text(
                "Favorites",
                style:TextStyle(
                  color:Colors.white,
                  fontWeight:FontWeight.bold,
                  fontSize:25
                )
                ),
              Container(
                height:45,
                width:45,
                decoration:BoxDecoration(
                  shape:BoxShape.circle,
                  color:Colors.transparent,
                  border:Border.all(width:3)
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.person,
                    color:Colors.white
                    ), 
                  onPressed: () {}),
              ),
            ],
          ),
        ),
        body:Container(
           margin:EdgeInsets.only(top:20),
           padding:EdgeInsets.all(18),
           decoration:BoxDecoration(
            boxShadow:[
              BoxShadow(
                blurRadius:10,
               color:Color.fromARGB(100,0,0,0),
                offset:Offset(0,0)
              )
            ]
           ),
          child:ListView.builder(
            itemCount:16,
            itemBuilder: (BuildContext context, int index) { 
            return Container(
              margin:EdgeInsets.symmetric(vertical: 9),  
              padding:EdgeInsets.only(top:20,bottom:20,right:20),           
               decoration:BoxDecoration(
               borderRadius:BorderRadius.all(Radius.circular(18)),
               color:Color.fromARGB(100,0,0,0),
               ),
              child:Stack(
                children:[
                Row(
                  mainAxisAlignment:MainAxisAlignment.start,
                  children:[
                    Image.asset(
                      "images/planet.png",
                      width:100,
                      height:100,
                      ),
                      Expanded(
                        child:Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                            Text("Mercury",
                            style:TextStyle(color:Colors.white,
                            fontWeight:FontWeight.bold,
                            fontSize:18)),
                            Text(
                              "Mercury is the smallest planet in the Solar System and the closest to the Sun."
                              ,softWrap: true,
                              style:TextStyle(color:Colors.white)),

                              Align(
                                alignment:Alignment.bottomRight,
                                child:Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                    children:[
                                      Text("Details",
                                      style:TextStyle(color:Colors.lightBlue)),
                                      IconButton(
                                        icon:Icon(Icons.forward,color:Colors.white),
                                        onPressed:(){}),

                                    ]
                                  )
                              )
                
                          ]
                        )
                      ),
                  ]
                ),

                      Positioned(
                        top:-10,
                        right:-10,
                        child:IconButton(
                          icon:Icon(Icons.favorite_border,color:Colors.white),
                          onPressed:(){}
                        )
                      ),
                ] 
              )
            );
           },
            
          ),
        )
      ),
    );
  }
}
