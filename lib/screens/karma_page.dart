import 'package:flutter/material.dart';

class KarmaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange[400],
        // appBar: AppBar(
        // backgroundColor: Colors.orange[400],
        // elevation: 0,
        // ),
        body: Body());
  }
}

//TODO:Search Bar
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
                                  child: Column(children: [
                                    Text("9,523",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.0)),
                                    Text("JOINED",
                                        style: TextStyle(color: Colors.white)),
                                    Text("CATEGORY",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.0)),
                                    Text("SPIRITUAL EMPOWERMENT",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.0)),
                                    Row(
                                      children: [
                                        Icon(Icons.lock_clock,
                                            color: Colors.white),
                                        SizedBox(width: 10),
                                        Text("05:07 AM | 19 Mon 2021",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20.0)),
                                      ],
                                    ),
                                    Row(children: [
                                      RaisedButton(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 50),
                                          color: Colors.green,
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
                                    ])
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
                        backgroundColor: Colors.orange[200],
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
            ]),
          ]))
    ]));
  }
}
