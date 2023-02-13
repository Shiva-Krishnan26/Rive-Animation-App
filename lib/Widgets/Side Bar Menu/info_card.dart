// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String name, email;
  const InfoCard({
    Key key,
     this.name,
     this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: ListTile(
        leading: CircleAvatar(
            backgroundColor: Colors.white24,
            child: Icon(CupertinoIcons.person, color: Colors.white)),
        title: Text(
          name,
          style: Theme.of(context)
              .textTheme
              .headline4
              .copyWith(fontSize: 16, color: Colors.white),
        ),
        subtitle: Text(
          email,
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(fontSize: 10, color: Colors.white),
        ),
      ),
    );
  }
}
