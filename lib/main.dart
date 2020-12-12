import 'dart:ui';

import 'package:flutter/material.dart';

import 'sections/about_section/about_section.dart';
import 'sections/feedback_section/feedback_section.dart';
import 'sections/service_section/service_section.dart';
import 'sections/start_new_section.dart';
import 'sections/top_section/top_section.dart';
import 'sections/works_section/recent_works_section.dart';
import 'utils/size_config.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NeoApp设计工作室',
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: HomePage(),
    ),
  );
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopSection(),
            ServiceSection(),
            StartANewProject(),
            RecentWorksSection(),
            FeedBackSection(),
            AboutSection(),
            Container(
              width: 200,
              height: 200,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              child: Image.asset('assets/images/docker_13.png'),
            ),
            SizedBox(height: 1000),
          ],
        ),
      ),
    );
  }
}
