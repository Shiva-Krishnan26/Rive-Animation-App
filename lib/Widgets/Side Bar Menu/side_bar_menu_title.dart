// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../../Utils/Rive Anim/rive_assets.dart';

class SideMenuTile extends StatelessWidget {
  const SideMenuTile({
    Key key,
     this.menu,
     this.press,
     this.riveonInit,
     this.isActive,
  }) : super(key: key);

  final GRiveAssets menu;
  final VoidCallback press;
  final ValueChanged<Artboard> riveonInit;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 24.0),
          child: Divider(color: Colors.white24, height: 1),
        ),
        Stack(
          children: [
            AnimatedPositioned(
              curve: Curves.fastOutSlowIn,
              duration: Duration(milliseconds: 300),
              height: 56,
              left: 0,
              width: isActive ? 288 : 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF6792FF),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            ListTile(
              onTap: press,
              leading: SizedBox(
                height: 34,
                width: 34,
                child: RiveAnimation.asset(
                  menu.src,
                  artboard: menu.artboard,
                  onInit: riveonInit,
                ),
              ),
              title: Text(
                menu.title,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
