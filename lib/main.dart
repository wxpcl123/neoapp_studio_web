import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'sections/about_section/about_section.dart';
import 'sections/declaration.dart';
import 'sections/feedback_section/feedback_section.dart';
import 'sections/service_section/service_section.dart';
import 'sections/start_new_section.dart';
import 'sections/top_section/top_section.dart';
import 'sections/works_section/recent_works_section.dart';
import 'utils/size_config.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
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
            Declaration(),
          ],
        ),
      ),
    );
  }
}
