import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/utils/colorConstant.dart';

class Onboarding_Screen extends StatefulWidget {
  const Onboarding_Screen({super.key});

  @override
  State<Onboarding_Screen> createState() => _Onboarding_ScreenState();
}

class _Onboarding_ScreenState extends State<Onboarding_Screen> {
  List onBoardingData = [
    {
      "image": "assets/images/screen1.png",
      "title": "Care your Family",
      "description": "The process can include educating new"
    },
    {
      "image": "assets/images/screen2.png",
      "title": "Act ahead of time!",
      "description": 'No holding back'
    },
    {
      "image": "assets/images/screen3.png",
      "title": "Go Ahead.....!!",
      "description": 'See the world....'
    }
  ];

  PageController _controller = PageController();
  int currentPage = 0;
  onChanged(int index) {
    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstant.whitecolor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: ColorsConstant.whitecolor,
          actions: [
            TextButton(
                onPressed: () {
                  _controller.jumpToPage(2);
                },
                child: Text("Skip",
                    style: TextStyle(color: (ColorsConstant.textcolor))))
          ]),
      body: Stack(children: [
        PageView.builder(
          scrollDirection: Axis.horizontal,
          controller: _controller,
          itemCount: onBoardingData.length,
          onPageChanged: onChanged,
          itemBuilder: ((context, index) {
            return Column(
              children: [
                Image.asset(onBoardingData[index]['image']),
                Text(
                  onBoardingData[index]['title'],
                  style:
                      TextStyle(color: ColorsConstant.textcolor, fontSize: 20),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  onBoardingData[index]['description'],
                  style: TextStyle(color: ColorsConstant.textcolor),
                )
              ],
            );
          }),
        ),
        Column(mainAxisAlignment: MainAxisAlignment.end, 
        children: [
          currentPage == (onBoardingData.length - 1)
              ? Center(
                child: ElevatedButton(
                  style: TextButton.styleFrom(padding: EdgeInsets.symmetric(horizontal: 100),backgroundColor: Colors.teal),
                  onPressed: () {}, child: Text("Continue")),
              )
              : SizedBox()
        ])
      ]),
    );
  }
}
