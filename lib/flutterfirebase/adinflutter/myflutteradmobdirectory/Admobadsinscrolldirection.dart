import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';

import 'MyFlutterAdmobFile.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize without device test ids.
  Admob.initialize();

  runApp(Admobadsinscrolldirection());
}

class Admobadsinscrolldirection extends StatelessWidget {
  const Admobadsinscrolldirection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepageforadmobadsinscrolldirection(),
    );
  }
}

class Homepageforadmobadsinscrolldirection extends StatefulWidget {
  const Homepageforadmobadsinscrolldirection({Key? key}) : super(key: key);

  @override
  State<Homepageforadmobadsinscrolldirection> createState() =>
      _HomepageforadmobadsinscrolldirectionState();
}

class _HomepageforadmobadsinscrolldirectionState
    extends State<Homepageforadmobadsinscrolldirection> {
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();

  void handleEvent(
      AdmobAdEvent event, Map<String, dynamic>? args, String adType) {
    switch (event) {
      case AdmobAdEvent.loaded:
        showSnackBar('New Admob $adType Ad loaded!');
        break;
      case AdmobAdEvent.opened:
        showSnackBar('Admob $adType Ad opened!');
        break;
      case AdmobAdEvent.closed:
        showSnackBar('Admob $adType Ad closed!');
        break;
      case AdmobAdEvent.failedToLoad:
        showSnackBar('Admob $adType failed to load. :(');
        break;
      case AdmobAdEvent.rewarded:
        showDialog(
          context: scaffoldState.currentContext!,
          builder: (BuildContext context) {
            return WillPopScope(
              onWillPop: () async {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                return true;
              },
              child: AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text('Reward callback fired. Thanks Andrew!'),
                    Text('Type: ${args!['type']}'),
                    Text('Amount: ${args['amount']}'),
                  ],
                ),
              ),
            );
          },
        );
        break;
      default:
    }
  }

  void showSnackBar(String content) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(content),
        duration: Duration(milliseconds: 1500),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text('Admob ads in Scroll'),
              centerTitle: true,
            ),
            body: Column(
              children: [
                Expanded(
                  child: Scrollbar(
                    child: ListView.builder(
                      padding: EdgeInsets.all(20.0),
                      itemCount: 1000,
                      itemBuilder: (BuildContext context, int index) {
                        if (index != 0 && index % 6 == 0) {
                          return Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(bottom: 20.0),
                                child: AdmobBanner(
                                  adUnitId: getBannerAdUnitId()!,
                                  adSize: AdmobBannerSize.FULL_BANNER,
                                  listener: (AdmobAdEvent event,
                                      Map<String, dynamic>? args) {
                                    handleEvent(event, args, 'Banner');
                                  },
                                  onBannerCreated:
                                      (AdmobBannerController controller) {
                                    // Dispose is called automatically for you when Flutter removes the banner from the widget tree.
                                    // Normally you don't need to worry about disposing this yourself, it's handled.
                                    // If you need direct access to dispose, this is your guy!
                                    // controller.dispose();
                                  },
                                ),
                              ),
                              Container(
                                height: 100.0,
                                margin: EdgeInsets.only(bottom: 20.0),
                                color: Colors.cyan,
                              ),
                            ],
                          );
                        }
                        return Container(
                          height: 100.0,
                          margin: EdgeInsets.only(bottom: 20.0),
                          color: Colors.cyan,
                        );
                      },
                    ),
                  ),
                ),
              ],
            )));
  }
}
