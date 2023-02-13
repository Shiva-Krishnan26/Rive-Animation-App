// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:rive_animation/Screens/home_page.dart';
import '../Utils/Rive Anim/rive_assets.dart';
import '../Utils/Rive Anim/rive_controller.dart';
import '../Utils/SideMenubar Icon/sidebar_icon.dart';
import '../Widgets/Bottom Navigation Bar/rive_navigationBar.dart';
import '../Widgets/Side Bar Menu/sideBar_menu.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({Key key}) : super(key: key);

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint>
    with SingleTickerProviderStateMixin {
  GRiveAssets selectedBottomNav = bottomNavs.first;

  AnimationController _animationController;
  Animation<double> animation;
  Animation<double> scalAnimation;

  // Let's chnage the name
  SMIBool isSideBarClosed;

  int pageIndex = 0;

  // Pages for Navigation Bar
  List<Widget> pageList = <Widget>[
    HomePage(),
  ];

  bool isSideMenuClosed = true;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    )..addListener(() {
        setState(() {});
      });

    animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
          parent: _animationController, curve: Curves.fastOutSlowIn),
    );
    scalAnimation = Tween<double>(begin: 1, end: 0.8).animate(
      CurvedAnimation(
          parent: _animationController, curve: Curves.fastOutSlowIn),
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF17203A),
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: Stack(
        // It's time to add the SideMenu
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            curve: Curves.fastOutSlowIn,
            width: 288,
            left: isSideMenuClosed ? -288 : 0,
            height: MediaQuery.of(context).size.height,
            child: const SidebarMenu(),
          ),
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(animation.value - 30 * animation.value * pi / 180),
            child: Transform.translate(
              offset: Offset(animation.value * 265, 0),
              child: Transform.scale(
                scale: scalAnimation.value,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                  child: PageTransitionSwitcher(
                    transitionBuilder: (child, primaryAnim, secondaryAnim) =>
                        FadeThroughTransition(
                      animation: primaryAnim,
                      secondaryAnimation: secondaryAnim,
                      child: child,
                    ),
                    child: pageList[pageIndex],
                  ),
                ),
              ),
            ),
          ),
          // As you can see it's an ANimated button
          AnimatedPositioned(
            duration: Duration(milliseconds: 200),
            curve: Curves.fastOutSlowIn,
            left: isSideMenuClosed ? 0 : 220,
            top: 8,
            child: SidebarMenuBtn(
              riveOnInit: (artboard) {
                StateMachineController controller = RiveUtils.getRiveController(
                    artboard,
                    stateMachine: "State Machine");
                isSideBarClosed = controller.findSMI("isOpen") as SMIBool;
                // Now it's easy to understand
                isSideBarClosed.value = true;
              },
              // Let's fixed the scal animation
              press: () {
                isSideBarClosed.value = !isSideBarClosed.value;
                if (isSideMenuClosed) {
                  _animationController.forward();
                } else {
                  _animationController.reverse();
                }
                setState(() {
                  isSideMenuClosed = isSideBarClosed.value;
                });
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Transform.translate(
        offset: Offset(0, 100 * animation.value),
        child: RiveNavigationBar(),
      ),
    );
  }
}
