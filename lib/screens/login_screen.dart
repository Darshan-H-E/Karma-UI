import 'package:demof/api/api_service.dart';
import 'package:demof/model/login_model.dart';
import 'package:flutter/material.dart';

import '../Progress.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool hidePassword = true;
  bool isApiCallProcess = false;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  LoginRequestModel loginRequestModel;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    loginRequestModel = new LoginRequestModel();
  }

  @override
  Widget build(BuildContext context) {
	return ProgressHUD(child: _uiSetup(context),
		inAsyncCall: isApiCallProcess,
		opacity:0.3,
   	);
  }

  Widget _uiSetup(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView( child: Column(
      children: <Widget>[
        ClipPath(
            clipper: MyClipper(),
            child: Container(
                height: 280,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.orange[400]),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("KARMA",
                          style: TextStyle(color: Colors.white, fontSize: 26)),
                      const Divider(
                        height: 5,
                        color: Colors.white,
                        thickness: 1,
                        indent: 150,
                        endIndent: 150,
                      ),
                      Text("UNITING POWER",
                          style: TextStyle(color: Colors.white, fontSize: 10)),
                      SizedBox(height: 15),
                      Text("LOGIN",
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                    ]))),
        //text fields
        // Padding(
        //     padding: EdgeInsets.all(20),
        //     child: TextField(
        //       decoration: InputDecoration(
        //         border: OutlineInputBorder(),
        //         hintText: 'Phone Number',
        //       ),
        //     )),
        Form(
            key: globalFormKey,
            child: Column(children: <Widget>[
              SizedBox(height: 60),
        new TextFormField(
          keyboardType: TextInputType.emailAddress,
          onSaved: (input) => loginRequestModel.email = input,
          validator: (input) =>
              !input.contains('@') ? "Email Id should be valid" : null,
          decoration: new InputDecoration(
            hintText: "Email Address",
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Theme.of(context).accentColor.withOpacity(0.2))),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).accentColor)),
          ),
        ),
        SizedBox(height: 20),
        new TextFormField(
          style: TextStyle(color: Theme.of(context).accentColor),
          keyboardType: TextInputType.text,
          onSaved: (input) => loginRequestModel.password = input,
          validator: (input) => input.length < 3
              ? "Password should be more than 3 characters"
              : null,
          obscureText: hidePassword,
          decoration: new InputDecoration(
            hintText: "Password",
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Theme.of(context).accentColor.withOpacity(0.2))),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).accentColor)),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  hidePassword = !hidePassword;
                });
              },
              color: Theme.of(context).accentColor.withOpacity(0.4),
              icon:
                  Icon(hidePassword ? Icons.visibility_off : Icons.visibility),
            ),
          ),
        ),
            ])),
        // Padding(
        //     padding: EdgeInsets.all(20),
        //     child: TextField(
        //       obscureText: true,
        //       decoration: InputDecoration(
        //         suffixIcon: Icon(Icons.visibility, color: Colors.black),
        //         // border: InputBorder.none,
        //         border: OutlineInputBorder(),
        //         hintText: 'Password',
        //       ),
        //     )),
        // Padding(
        // 	padding: EdgeInsets.only(left: 210),
        // 	child: TextButton(child: Text("Forgot Password", style: TextStyle(color: Colors.orange[400], fontSize: 18)),onPressed:(){})
        // ),
        Align(
            alignment: Alignment.topRight,
            child: TextButton(
                child: Text("Forgot Password   ",
                    style: TextStyle(color: Colors.orange[400], fontSize: 18)),
                onPressed: () {})),
        SizedBox(height: 130),

        FlatButton(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 80),
          onPressed: () {
            if (validateAndSave()) {
              print(loginRequestModel.toJson());

              setState(() {
                isApiCallProcess = true;
              });

              APIService apiService = new APIService();
              apiService.login(loginRequestModel).then((value) {
                if (value != null) {
                  setState(() {
                    isApiCallProcess = false;
                  });

                  if (value.token.isNotEmpty) {
					print("login successful");
					Navigator.pushNamed(context,'/home');
                    // final snackBar = SnackBar(content: Text("Login Successful"));
                    // scaffoldKey.currentState.showSnackBar(snackBar);
                  } else {
					print("login unsuccesfful");
                    // final snackBar = SnackBar(content: Text(value.error));
                    // scaffoldKey.currentState.showSnackBar(snackBar);
                  }
                }
              });
            }
          },
          child: Text(
            "Login",
            style: TextStyle(color: Colors.white),
          ),
          color: Theme.of(context).accentColor,
          shape: StadiumBorder(),
        ),

        // RaisedButton(
        //     padding: EdgeInsets.fromLTRB(70, 20, 70, 20),
        //     color: Colors.lightGreen,
        //     child: Text("Login",
        //         style: TextStyle(color: Colors.white, fontSize: 18)),
        //     shape: const RoundedRectangleBorder(
        //         borderRadius: BorderRadius.all(Radius.circular(12.0))),
        //     onPressed: () {}),
        // SizedBox(height:10),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("Not a member yet?",
              style: TextStyle(color: Colors.black, fontSize: 16)),
          TextButton(
              child: Text("Click here",
                  style: TextStyle(color: Colors.orange[400], fontSize: 16)),
              onPressed: () {})
        ])
      ],
    )));
  }
	bool validateAndSave() {
	  final form = globalFormKey.currentState;
	  if (form.validate()) {
		form.save();
		return true;
	  }
	  return false;
	}
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

