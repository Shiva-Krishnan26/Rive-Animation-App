// ignore_for_file: prefer_const_constructors,file_names

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import '../../../../Utils/Rive Anim/rive_assets.dart';
import '../../../../Utils/Rive Anim/rive_controller.dart';
import 'navigation_animatedBar.dart';

class RiveNavigationBar extends StatefulWidget {
  const RiveNavigationBar({Key key, }) : super(key: key);

  @override
  State<RiveNavigationBar> createState() => _RiveNavigationBarState();
}

class _RiveNavigationBarState extends State<RiveNavigationBar> {
  GRiveAssets selectedBottomNav = bottomNavs.first;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          color: Color(0xFF17203A).withOpacity(0.8),
          borderRadius: const BorderRadius.all(Radius.circular(24)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...List.generate(
              bottomNavs.length,
              (index) => GestureDetector(
                onTap: () {
                  bottomNavs[index].input?.change(true);
                  if (bottomNavs[index] != selectedBottomNav) {
                    setState(() {
                      selectedBottomNav = bottomNavs[index];
                    });
                  }
                  Future.delayed(const Duration(seconds: 1), () {
                    bottomNavs[index].input?.change(false);
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedBar(
                        isActive: bottomNavs[index] == selectedBottomNav),
                    SizedBox(
                      height: 36,
                      width: 36,
                      child: Opacity(
                        opacity:
                            bottomNavs[index] == selectedBottomNav ? 1 : 0.5,
                        child: RiveAnimation.asset(
                          bottomNavs.first.src,
                          artboard: bottomNavs[index].artboard,
                          onInit: (artboard) {
                            StateMachineController controller =
                                RiveUtils.getRiveController(artboard,
                                    stateMachine:
                                        bottomNavs[index].stateMachineName);

                            bottomNavs[index].input =
                                controller.findSMI("active") as SMIBool;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
