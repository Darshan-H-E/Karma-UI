import 'package:flutter/material.dart';

import '../constants.dart';

class KarmaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kOrange1,
        body: Body());
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final List<String> _listItem = [
    'assets/images/image_1.jpeg',
    'assets/images/image_2.jpg',
    'assets/images/image_3.jpeg',
    'assets/images/image_4.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Column(children: [
      SizedBox(
          height: size.height,
          child: Stack(children: [
            Expanded(
              child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: size.height * 0.24),
                  // padding: EdgeInsets.only(top: size.height*0.10,right: 80),
                  padding: EdgeInsets.only(top: size.height * 0.04),
                  height: 700,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(44),
                        topRight: Radius.circular(44)),
                  ),
                  child: GridView.count(
                      crossAxisCount: 1,
                      padding: EdgeInsets.all(20),
                      // crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: _listItem
                          .map((item) => Card(
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(24)),
                                      // border: Border.all(width: 2),
                                      image: DecorationImage(
                                        image: AssetImage(item),
                                        fit: BoxFit.cover,
                                      )),
                                  child: Column(
									  crossAxisAlignment: CrossAxisAlignment.end,
									  children: [
                                    Padding( padding: EdgeInsets.only(top:20, right: 40), child: Text("9,523",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.0,
											fontWeight: FontWeight.w800
											)),),
                                    Padding( padding: EdgeInsets.only(right: 40), child: Text("JOINED",
                                        style: TextStyle(
											color: Colors.white,
											fontStyle: FontStyle.italic
											)),),
                                    Padding( padding: EdgeInsets.only(top:70, right: 235), child: Text("CATEGORY",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18.0,
											fontStyle: FontStyle.italic
											)),),
                                    Padding( padding: EdgeInsets.only(top:10,bottom:20, right: 50), child: Text("SPIRITUAL EMPOWERMENT",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.0,
											fontWeight: FontWeight.w800
											)),),
                                    Padding(
										padding: EdgeInsets.only(left: 25),
								     child:Row(
                                      children: [
                                        Icon(Icons.access_time,
                                            color: Colors.white),
                                        SizedBox(width: 10),
                                        Text("05:07 AM | 19 Mon 2021",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16.0,
												fontStyle: FontStyle.italic
												)),
                                      ],
                                    ),),
                                    Padding(
										padding: EdgeInsets.symmetric(horizontal: 5, vertical: 19),
								     child:Row(children: [
                                      RaisedButton(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 50),
                                          color: kGreen,
                                          child: Text("JOINED",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w900)),
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(32.0))),
                                          onPressed: () {}),
                                      SizedBox(width: 10),
                                      RaisedButton(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 50),
                                          color: Colors.white,
                                          child: Text("DO KARMA",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w900)),
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(32.0))),
                                          onPressed: () {}),
                                    ]))
                                  ]))))
                          .toList())),
            ),
            // child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            // children: [
            // Text("hello"),
            // Container(
            // height: 24,
            // width: 24,
            // )
            // ],
            // )
            Column(children: [
              SizedBox(height: 60),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: CircleAvatar(
                        backgroundColor:kOrange2 ,
                        child: IconButton(
                            icon: Icon(Icons.arrow_back_ios_rounded,
                                color: Colors.white),
                            onPressed: () {
                              Navigator.pop(context);
                            })),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text("Karma Drives",
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 78),
                      child: RaisedButton(
                          // padding: EdgeInsets.fromLTRB(40,20,40,20),
                          color: Colors.white,
                          child: Text("MY DRIVES",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w900)),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(32.0))),
                          onPressed: () {
                            Navigator.pushNamed(context, '/profile');
                          }))
                ],
              ),
			  SizedBox( height: 20 ),
			  Container( 
				  height: 50,
				  width: 280,
				  decoration: BoxDecoration( 
					  color:  Colors.white,
					  borderRadius: BorderRadius.all(Radius.circular(26)),
				  ),
				  child: Row( 
					  mainAxisAlignment: MainAxisAlignment.end,
					  crossAxisAlignment: CrossAxisAlignment.center,
					  children: [
						Padding(padding : EdgeInsets.only(right: 80),child: Text( "Search Here...." ),),
						Container( 
							height:40,
							width: 50,
							decoration:BoxDecoration( 
								color: Colors.black,
								borderRadius: BorderRadius.all(Radius.circular(100))
							),
							child:Icon(Icons.search,color:Colors.white)
						)
					  ]
				  )
			  )
				 
            ]),
          ]))
    ]));
  }
}
