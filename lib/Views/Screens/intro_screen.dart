import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class intro_page extends StatefulWidget {
  const intro_page({super.key});

  @override
  State<intro_page> createState() => _intro_pageState();
}

class _intro_pageState extends State<intro_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: IntroductionScreen(
        pages: [
          PageViewModel(
            title: "Push Notification",
            body:
                "Get notification as soon as someone post a new quote on their wall",
            image: Center(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image:
                            AssetImage("lib/Views/Utils/Assets/Images/1.jpg"),
                        fit: BoxFit.cover)),
              ),
            ),
          ),
          PageViewModel(
            title: "Make it happen",
            body:
                "Follow your favourite entrepreneur to Listen to their podcast and quotes",
            image: Center(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage("lib/Views/Utils/Assets/Images/2.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          PageViewModel(
            title: "Svae favourite Quotes",
            body:
                "Now you can save your most favourite quotes and see them later on ",
            image: Center(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage("lib/Views/Utils/Assets/Images/3.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
        done: Text("done"),
        onDone: () async {
          SharedPreferences preferences = await SharedPreferences.getInstance();
          preferences.setBool("isIntroVisited", true);
          Navigator.pushReplacementNamed(context, 'Splash');
        },
        next: Text("Next"),
        showNextButton: true,
      ),
    );
  }
}
