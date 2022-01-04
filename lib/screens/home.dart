import 'package:flutter/material.dart';
import 'package:flutter_app/config/constants.dart';
import 'package:flutter_app/services/api_client.dart';
import 'package:flutter_app/widgets/shortener_tab_bar.dart';

/// This widget shows the app title, app slogan and a tabBar
class Home extends StatefulWidget {
  final APIClient restAPIClient;

  @override
  _HomeState createState() => _HomeState(restAPIClient: this.restAPIClient);

  Home({required this.restAPIClient});
}

class _HomeState extends State<Home> {
  final APIClient restAPIClient;

  @override
  Widget build(BuildContext context) {
    //For responsive purposes we get screen width and height
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: 3,
      child: Scaffold(body: LayoutBuilder(
        /// Mobile responsive
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 600) {
            //Web
            return Padding(
              padding: EdgeInsets.symmetric(
                  vertical: height * 0.05, horizontal: width * 0.35),
              child: content(width),
            );
          } else {
            //Mobile
            return Padding(
              padding: EdgeInsets.symmetric(
                  vertical: height * 0.05, horizontal: width * 0.05),
              child: content(width),
            );
          }
        },
      )),
    );
  }

  /// Screen content
  Widget content(width) {
    var title = Text(
      Constants.APP_TITLE + "\n",
      style: Theme.of(context).textTheme.headline1,
      maxLines: 5,
    );

    var slogan = Text(
      Constants.APP_SLOGAN + "\n\n",
      style: Theme.of(context).textTheme.subtitle1,
      maxLines: 5,
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Flexible(flex: 1, child: title),
        Flexible(flex: 1, child: slogan),
        Flexible(flex: 1, child: shortenerTabBar()),
        Expanded(
            flex: 7,
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: shortenerTabBarView(restAPIClient: restAPIClient))),
      ],
    );
  }

  _HomeState({required this.restAPIClient});
}
