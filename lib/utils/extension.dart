import 'dart:io';

import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  EdgeInsets get kdefaultPadding => const EdgeInsets.all(15);
  Size get size_ => MediaQuery.sizeOf(this);
  EdgeInsets get viewInsets => MediaQuery.viewInsetsOf(this);
  EdgeInsets get padding => MediaQuery.viewPaddingOf(this);

  bool get large => size_.width >= 1240;
  bool get medium => size_.width > 900 && size_.width < 1240;
  bool get small => size_.width <= 900;
  bool get extraSmall => size_.width < 600;

  ThemeData get theme => Theme.of(this);
  ColorScheme get scheme => theme.colorScheme;
  TextTheme get style => theme.textTheme;
  EdgeInsetsGeometry get kpadding => const EdgeInsets.all(16);

  void message(dynamic value) {
    ScaffoldMessenger.of(this)
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          backgroundColor: scheme.inverseSurface,
          behavior: SnackBarBehavior.floating,
          content: Text(
            '$value',
            style: TextStyle(color: scheme.onInverseSurface),
          ),
        ),
      );
  }

  void error(dynamic e) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        backgroundColor: scheme.onErrorContainer,
        behavior: SnackBarBehavior.floating,
        content: Text(
          e is SocketException ? e.message : '$e',
          style: TextStyle(color: scheme.errorContainer),
        ),
      ),
    );
  }

  void customError(String title, String e) {
    final overlay = Overlay.of(this);
    OverlayEntry? overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => Align(
        alignment: Alignment.bottomCenter,
        child: Material(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Container(
              width: 500,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(255, 247, 247, 1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.red)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.error_outline,
                        color: Color.fromRGBO(246, 61, 61, 1),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(title),
                      const Spacer(),
                      IconButton(
                          onPressed: () {
                            overlayEntry!.remove();
                          },
                          icon: const Icon(Icons.close))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          e,
                          style: style.bodySmall,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);
    Future.delayed(const Duration(seconds: 3), () {
      overlayEntry!.remove();
    });
  }

  void customSuccess(String e) {
    final overlay = Overlay.of(this);
    OverlayEntry? overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => Align(
        alignment: Alignment.bottomCenter,
        child: Material(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Container(
              width: 500,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(236, 255, 237, 1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Color.fromRGBO(15, 132, 87, 1))),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Text(
                        e,
                        style: style.bodySmall,
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {
                            overlayEntry!.remove();
                          },
                          icon: const Icon(Icons.close))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);
    Future.delayed(const Duration(seconds: 3), () {
      overlayEntry!.remove();
    });
  }
}
