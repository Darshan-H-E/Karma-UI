import 'package:flutter/material.dart';
// import 'package:flutter_switch/flutter_switch.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange[400],
        // appBar: AppBar(
        //   backgroundColor: Colors.orange[400],
        //   elevation: 0,
        // ),
        // leading: CircleAvatar(
        // backgroundColor: Colors.orange[200],
        // child: IconButton(icon:Icon(Icons.arrow_back_ios_rounded,color:Colors.white),
        // onPressed:(){ Navigator.pop(context); }
        body: Body());
  }
}

class Body extends StatefulWidget {
  var value = true;

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Column(children: [
      SizedBox(
          height: size.height,
          child: Stack(children: [
            Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: size.height * 0.2),
                // padding: EdgeInsets.only(top: size.height*0.10,right: 80),
                padding: EdgeInsets.only(top: size.height * 0.10),
                height: 600,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(44),
                      topRight: Radius.circular(44)),
                ),
                //TODO: Name, Ph.no, Loc, Interest
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 30),
                          child: Text("Name"),
                        ),
                        SizedBox(width: 150),
                        Text("Phone Number"),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      child: Row(children: [
                        Container(
                            height: 40,
                            width: 140,
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            child: Center(child: Text("Paul"))),
                        SizedBox(width: 50),
                        Container(
                            height: 40,
                            width: 140,
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            child: Center(child: Text("+919875421938"))),
                      ]),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 35),
                      child: Row(
                        children: [
                          Text("Location"),
                          SizedBox(width: 140),
                          Text("Interest"),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      child: Row(children: [
                        Container(
                            height: 40,
                            width: 140,
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            child: Center(child: Text("New York City"))),
                        SizedBox(width: 50),
                        Container(
                            height: 40,
                            width: 140,
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            child: Center(child: Text("Football"))),
                      ]),
                    ),
                    Padding(
                        padding: EdgeInsets.all(30.0),
                        child: Row(children: [
                          Text("Notifications", style: TextStyle(fontSize: 18)),
                          SizedBox(width: 150),
                          AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.decelerate,
                              width: 70,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: widget.value
                                      ? Colors.orange[400]
                                      : Colors.grey,
                                  borderRadius: BorderRadius.circular(5.0)),
                              child: Row(children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 14, right: 8),
                                  child: Text("ON",
                                      style: TextStyle(color: Colors.white)),
                                ),
                                AnimatedAlign(
                                    duration: const Duration(milliseconds: 300),
                                    alignment: widget.value
                                        ? Alignment.centerRight
                                        : Alignment.centerLeft,
                                    curve: Curves.decelerate,
                                    child: Container(
                                        width: 25,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            color: Colors.orange[700],
                                            borderRadius:
                                                BorderRadius.circular(5.0))))
                              ]))
                        ])),
                    // FlutterSwitch(
                    // 	width: 10,
                    // 	height: 10,
                    // 	borderRadius: 0.0
                    // )
                    // Padding( padding: EdgeInsets.symmetric(vertical: 10, horizontal: 35),
                    // ),
                    // Container(
                    // 	height: 24,
                    // 	width: 24,
                    // decoration: BoxDecoration(
                    // border: Border.all(style: )
                    // )
                    // )
                  ],
                )),
            Column(
				children: [
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
                            onPressed: () { Navigator.pop(context); })),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text("Profile",
                        style: TextStyle(color: Colors.white, fontSize: 22)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 200),
                    child: CircleAvatar(
                        backgroundColor: Colors.orange[200],
                        child: IconButton(
                            icon: Icon(Icons.edit, color: Colors.white),
                            onPressed: () {})),
                  )
                ],
              ),
              SizedBox(height: 8.0),
              Container(
                  padding: EdgeInsets.all(10.0),
                  width: MediaQuery.of(context).size.width / 3,
                  height: MediaQuery.of(context).size.width / 3,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),
                      shape: BoxShape.circle,
                      color: Colors.white,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/emp_6.jpg'))))
            ]),
          ]))
    ]));
  }
}
