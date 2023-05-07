import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scan/src/common/logger/logger_utils.dart';
import 'package:mobile_scan/src/theme/color_schemes.g.dart';
import 'package:mobile_scan/src/widget/qr_scanner.dart';
import 'package:mobile_scan/src/widget/scan_button.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData.from(colorScheme: lightColorScheme),
      darkTheme: ThemeData.from(colorScheme: darkColorScheme),
      home: Platform.isAndroid
          ? const MyHomePage()
          : CupertinoApp(
              theme: MaterialBasedCupertinoThemeData(
                materialTheme: Theme.of(context),
              ),
              home: const MyHomePage(),
            ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool showScanner = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createBaseAppBar(),
      body: Stack(
        fit: StackFit.expand,
        children: [
          if (showScanner)
            QRScanner(
              onDetect: (barcodes) {
                Logger.logNoStack.d('Barcode found! ${barcodes.raw}');
              },
            ),
          Positioned(
            bottom: 20,
            right: 20,
            child: ScanButton(
                child: const Text('scan'),
                onLongPress: () {
                  setState(() {
                    showScanner = true;
                  });
                },
                onLongPressUp: () {
                  setState(() {
                    showScanner = false;
                  });
                }),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget createBaseAppBar() {
    return Platform.isAndroid
        ? AppBar(
            title: const Text('Material Design'),
            centerTitle: true,
          ) as PreferredSizeWidget
        : const CupertinoNavigationBar(
            middle: Text('Cupertino Design'),
          );
  }
}
