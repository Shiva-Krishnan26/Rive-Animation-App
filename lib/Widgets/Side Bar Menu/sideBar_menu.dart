// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:rive_animation/Widgets/Side%20Bar%20Menu/side_bar_menu_title.dart';
import '../../../../Utils/Rive Anim/rive_assets.dart';
import '../../../../Utils/Rive Anim/rive_controller.dart';
import 'info_card.dart';

// Welcome to the Episode 5
class SidebarMenu extends StatefulWidget {
  const SidebarMenu({
    Key key,
  }) : super(key: key);

  @override
  State<SidebarMenu> createState() => _SidebarMenuState();
}

class _SidebarMenuState extends State<SidebarMenu> {
  GRiveAssets selectedMenu = sideMenus.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 288,
        height: double.infinity,
        color: const Color(0xFF17203A),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InfoCard(name: "User Name", email: "example@email.com"),
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
                child: Text(
                  "menu".toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      .copyWith(color: Colors.white70),
                ),
              ),
              ...sideMenus.map(
                (menu) => SideMenuTile(
                  menu: menu,
                  riveonInit: (artboard) {
                    // Let me show you if user click on the menu how to show the animation
                    StateMachineController controller =
                        RiveUtils.getRiveController(artboard,
                            stateMachine: menu.stateMachineName);
                    menu.input = controller.findSMI("active") as SMIBool;
                    // See as we click them it start animate
                  },
                  press: () {
                    menu.input.change(true);
                    Future.delayed(const Duration(seconds: 1), () {
                      menu.input.change(false);
                    });
                    setState(() {
                      selectedMenu = menu;
                    });
                  },
                  isActive: selectedMenu == menu,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
                child: Text(
                  "Settings".toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      .copyWith(color: Colors.white70),
                ),
              ),
              ...sideMenu2.map(
                (menu) => SideMenuTile(
                  menu: menu,
                  riveonInit: (artboard) {
                    // Let me show you if user click on the menu how to show the animation
                    StateMachineController controller =
                        RiveUtils.getRiveController(artboard,
                            stateMachine: menu.stateMachineName);
                    menu.input = controller.findSMI("active") as SMIBool;
                    // See as we click them it start animate
                  },
                  press: () {
                    menu.input.change(true);
                    Future.delayed(const Duration(seconds: 1), () {
                      menu.input.change(false);
                    });
                    setState(() {
                      selectedMenu = menu;
                    });
                  },
                  isActive: selectedMenu == menu,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
