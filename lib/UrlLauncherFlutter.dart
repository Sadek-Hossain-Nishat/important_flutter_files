import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

void main(List<String> args) {
  runApp(UrlLauncherFlutter());
}

class UrlLauncherFlutter extends StatelessWidget {
  const UrlLauncherFlutter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepageforurllauncher(),
    );
  }
}

class Homepageforurllauncher extends StatefulWidget {
  const Homepageforurllauncher({Key? key}) : super(key: key);

  @override
  State<Homepageforurllauncher> createState() => _HomepageforurllauncherState();
}

class _HomepageforurllauncherState extends State<Homepageforurllauncher> {
  static const URL = 'https://www.google.com';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text('Url Launcher'),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            launchUrl(Uri.parse(URL));
                          },
                          child: Text('Open Link')),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            launchUrl(Uri(scheme: 'tel', path: '01986203704'));
                          },
                          child: Text('Open Phone')),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            launchUrl(Uri(scheme: 'sms', path: '12345'));
                          },
                          child: Text('Open Sms'))
                    ],
                  ),
                ))));
  }
}
