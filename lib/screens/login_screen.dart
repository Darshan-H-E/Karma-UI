import 'package:demof/api/api_service.dart';
import 'package:demof/model/login_model.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

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
                decoration: BoxDecoration(color: kOrange1),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 35),
                      Text("KARMA",
                          style: TextStyle(color: Colors.white, fontSize: 36)),
                      const Divider(
                        height: 2,
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
        Form(
            key: globalFormKey,
            child: Column(children: <Widget>[
              SizedBox(height: 60),
          Padding( padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10), child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          onSaved: (input) => loginRequestModel.email = input,
          validator: (input) =>
              !input.contains('@') ? "Email Id should be valid" : null,
          decoration: InputDecoration(
            hintText: "Email Address",
				filled: true,
				enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
					color: Colors.grey[200]
					),
				borderRadius: BorderRadius.all(Radius.circular(10)),
				),
				focusedBorder: UnderlineInputBorder(
				  borderSide: BorderSide(color: Colors.grey[200])),

				fillColor: Colors.grey[300],
          ),
        ),),
        SizedBox(height: 20),
        Padding( padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10), child:TextFormField(
          style: TextStyle(color: Theme.of(context).accentColor),
          keyboardType: TextInputType.text,
          onSaved: (input) => loginRequestModel.password = input,
          validator: (input) => input.length < 3
              ? "Password should be more than 3 characters"
              : null,
          obscureText: hidePassword,
          decoration: new InputDecoration(
            hintText: "Password",
				filled: true,
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
					color: Colors.grey[200]
					),
				borderRadius: BorderRadius.all(Radius.circular(10)),
				),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[200])),
				fillColor: Colors.grey[300],
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  hidePassword = !hidePassword;
                });
              },
              color: Colors.black.withOpacity(0.4),
              icon:
                  Icon(hidePassword ? Icons.visibility_off : Icons.visibility),
            ),
          ),
        ),),
            ])),
        Align(
            alignment: Alignment.topRight,
            child: TextButton(
                child: Text("Forgot Password   ",
                    style: TextStyle(color: kOrange1, fontSize: 18)),
                onPressed: () {})),
        SizedBox(height: 130),

        FlatButton(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 60),
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
                  } else {
					print("login unsuccesfful");
                  }
                }
              });
            }
          },
          child: Text(
            "Login",
            style: TextStyle(color: Colors.white),
          ),
            color: Colors.lightGreen,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0))),
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
                  style: TextStyle(color: kOrange1, fontSize: 16)),
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

