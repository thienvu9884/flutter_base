import 'package:flutter/material.dart';

//apply this class on home attribute of Material App at main.dart
class GlowCircle extends StatefulWidget {
  const GlowCircle({super.key});

  @override
  State<StatefulWidget> createState() {
    return _GlowCircle();
  }
}

class _GlowCircle extends State<GlowCircle>
    with SingleTickerProviderStateMixin {
  //use "with SingleThickerProviderStateMixin" at last of class declaration
  //where you have to pass "vsync" argument, add this

  late Animation<double> animation; //animation variable for circle 1
  late AnimationController
      animationController; //animation controller variable circle 1

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    //here we have to vash vsync argument, there for we use "with SingleTickerProviderStateMixin" above
    //vsync is the ThickerProvider, and set duration of animation

    animationController.repeat();
    //repeat the animation controller

    animation = Tween<double>(begin: 0, end: 500).animate(animationController);
    //set the begin value and end value, we will use this value for height and width of circle

    animation.addListener(() {
      setState(() {});
      //set animation listiner and set state to update UI on every animation value change
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose(); //destory anmiation to free memory on last
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        height: double.infinity,
        child: Container(
          decoration: const BoxDecoration(
              shape: BoxShape.circle, //making box to circle
              color: Colors.deepOrangeAccent //background of container
              ),
          height: animation.value, //value from animation controller
          width: animation.value, //value from animation controller
        ),
      ),
    );
  }
}
