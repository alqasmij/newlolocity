import 'package:flutter/material.dart';
import 'package:city_lolo/tools/toolsUtilities.dart';
import 'package:webview_flutter/webview_flutter.dart';

final webViewKey = GlobalKey<WebViewContainerState>();

class AllPostsPage extends StatefulWidget {
  @override
  AllPostsPageState createState() => AllPostsPageState();
}

class AllPostsPageState extends State<AllPostsPage> {
  bool isLoading = true;

  @override
  void initState() {
    setState(() {

        isLoading = false;


    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("البراندات"),
        backgroundColor: ToolsUtilities.mainColor,
        centerTitle: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              // using currentState with question mark to ensure it's not null
              webViewKey.currentState?.reloadWebView();
            },
          )
        ],
      ),
      body: WebViewContainer(key: webViewKey),
    );
  }
}

class WebViewContainer extends StatefulWidget {
  WebViewContainer({required Key key}) : super(key: key);

  @override
  WebViewContainerState createState() => WebViewContainerState();
}

class WebViewContainerState extends State<WebViewContainer> {
  late WebViewController _webViewController;

  @override
  Widget build(BuildContext context) {
    return WebView(
      onWebViewCreated: (controller) {
        _webViewController = controller;
      },
      initialUrl:ToolsUtilities.allPageUrl,
      javascriptMode: JavascriptMode.unrestricted,
    );
  }

  void reloadWebView() {
    _webViewController.reload();
  }
}
