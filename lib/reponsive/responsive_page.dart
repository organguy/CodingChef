import 'package:coding_chef/reponsive/desktop_body.dart';
import 'package:coding_chef/reponsive/mobile_body.dart';
import 'package:coding_chef/reponsive/responsive_layout.dart';
import 'package:flutter/material.dart';

class ResponsivePage extends StatefulWidget {
  const ResponsivePage({Key? key}) : super(key: key);

  @override
  State<ResponsivePage> createState() => _ResponsivePageState();
}

class _ResponsivePageState extends State<ResponsivePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveLayout(
          mobileBody: MobileBody(),
          desktopBody: DesktopBody()
      ),
    );
  }
}
