import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../core/export/export.core.dart';

class AppWebView extends StatefulWidget {
  const AppWebView({
    super.key,
    required this.url,
  });

  final String url;

  @override
  State<AppWebView> createState() => _AppWebViewState();
}

class _AppWebViewState extends State<AppWebView> {
  late final WebViewController _controller;
  final UniqueKey _key = UniqueKey();

  final Set<Factory<OneSequenceGestureRecognizer>> gestureRecognizers = {
    Factory(() => EagerGestureRecognizer())
  };

  bool loading=true;
  @override
  void initState() {
    super.initState();
    initializeWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        automaticallyImplyLeading: false,
        leading: BackButton(
          onPressed: ()=>Navigator.pop(context),
          color: AppColors.black,
        ),
      ),
      body: WebViewWidget(
        key: _key,
        gestureRecognizers: gestureRecognizers,
        controller: _controller,
      ),
    );
  }

  initializeWebView() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..loadRequest(Uri.parse(widget.url))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            if(progress>50){
              setState(() {
                loading=false;
              });
            }
          },
        ),
      );
  }
}
