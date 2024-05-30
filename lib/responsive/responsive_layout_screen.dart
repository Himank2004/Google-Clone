import 'package:flutter/material.dart';

class RespnsiveLayoutScreen extends StatelessWidget {
  final Widget mobileScreenLayout;
  final Widget webScreenLayout;
  const RespnsiveLayoutScreen({
    Key? key,
    required this.mobileScreenLayout,
    required this.webScreenLayout,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints){
        if(constraints.minWidth <= 768){
          return mobileScreenLayout;
        }
        else return webScreenLayout;

    },
    );
  }
}