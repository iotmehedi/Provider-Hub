import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:provider_hub/const/utils/consts/app_colors.dart';
import 'package:provider_hub/const/utils/consts/app_sizes.dart';
import 'package:provider_hub/features/screens/homepage/presentation/controller/controller.dart';
import 'package:provider_hub/features/widget/custom_appbar/custom_appbar.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class WebPage extends StatefulWidget {
  final String? url, pageTitle;

  const WebPage({
    super.key,
    this.pageTitle,
    this.url,
  });

  @override
  WebPageState createState() => WebPageState();
}

class WebPageState extends State<WebPage> {
  InAppWebViewController? inAppWebViewController;
  var homepageController = Get.put(HomepageContorller());
  int pages = 0;
  int currentPage = 0;
  bool isReady = false;
  String errorMessage = '';

  // Future<void> setCookieAndLoadUrl(String url) async {
  //   url = Uri.encodeFull(url);
  //   await CookieManager.instance().deleteAllCookies();
  //   await CookieManager.instance().setCookie(
  //     url: WebUri(url),
  //     name: "",
  //     value: "",
  //   );
  //   /* await CookieManager.setCookie(
  //     url,
  //     cookieName,
  //     cookieValue,
  //     add_step_domain: 'corporate3.bdjobs.com',
  //     isSecure: true,
  //   );*/
  // }
  //
  // @override
  // void didChangeDependencies() {
  //   setState(() {
  //     setCookieAndLoadUrl(widget.url!);
  //   });
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "License",
        fontSize: AppSizes.size20,
        needTitleCenter: false,
        textColor: AppColors.white,
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: AppColors.backgroundColor,
      body:  widget.url?.contains(".pdf") ?? false
          ? SfPdfViewer.network(
              widget.url ?? '')
          : Stack(
              children: <Widget>[
                Container(
                  child: InAppWebView(
                    initialUrlRequest:
                        URLRequest(url: WebUri(widget.url ?? '')),
                    initialOptions: InAppWebViewGroupOptions(
                      crossPlatform: InAppWebViewOptions(
                        javaScriptEnabled: true,
                        javaScriptCanOpenWindowsAutomatically: true,
                        supportZoom: true,
                      ),
                    ),
                    initialSettings: InAppWebViewSettings(
                      clearCache: true,
                      allowContentAccess: true,
                      allowFileAccess: true,
                      javaScriptEnabled: true,
                      allowUniversalAccessFromFileURLs: true,
                      cacheEnabled: true,
                      pageZoom: 0.3,
                      mixedContentMode:
                          MixedContentMode.MIXED_CONTENT_ALWAYS_ALLOW,
                    ),
                    onReceivedServerTrustAuthRequest:
                        (controller, challenge) async {
                      // Accept all SSL certificates (for debugging only)
                      return ServerTrustAuthResponse(
                          action: ServerTrustAuthResponseAction.PROCEED);
                    },
                    onLoadError: (controller, url, code, message) {
                      print('Failed to load: $message');
                    },
                    onLoadHttpError:
                        (controller, url, statusCode, description) {
                      print('HTTP error: $description');
                    },
                    onLoadStart: (controller, url) {
                      setState(() {
                        homepageController.showLoading.value = true;
                      });
                    },
                    onProgressChanged:
                        (InAppWebViewController controller, int progress) {
                      if (progress > 60) {
                        setState(() {
                          homepageController.showLoading.value = false;
                        });
                      }
                    },
                    onLoadStop: (controller, url) {
                      // Optionally handle stop of load
                    },
                  ),
                ),
                Center(
                  child: homepageController.showLoading.value == true
                      ? const CircularProgressIndicator()
                      : const SizedBox(),
                )
              ],
            ),
    );
  }
}
