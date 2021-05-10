import 'package:demof/screens/karma_page.dart';
import 'package:demof/screens/login_screen.dart';
import 'package:demof/screens/profile_page.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

void main() => runApp( MyApp() );

class MyApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			debugShowCheckedModeBanner:false,
			title: 'Karma App',
			theme: ThemeData(
				scaffoldBackgroundColor: kBackgroundColor,
				fontFamily: "OpenSans"
			),
			// home: LoginScreen(),
			routes: {
			  '/': (context) => LoginScreen(),
			  '/home': (context) => KarmaPage(),
			  '/profile': (context) => ProfilePage()
			}
		);
	}
}

