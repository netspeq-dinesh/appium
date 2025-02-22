import 'package:flutter/material.dart';


void showCustomToastFailure(BuildContext context, String message) {
  final overlay = Overlay.of(context);
  final overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      bottom: 50,
      left: 20,
      right: 20,
      child: Material(
        color: Colors.transparent,
        child: Center(
          child: IntrinsicWidth(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFFFFEBEE), // Light red background
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFFEF5350), width: 1), // Red border
              ),
              child: Text(
                message,
                style: const TextStyle(
                  color: Color(0xFFC62828), // Dark red text
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    ),
  );

  overlay.insert(overlayEntry);

  // Remove the toast after 3 seconds
  Future.delayed(const Duration(seconds: 3), () {
    overlayEntry.remove();
  });
}

void showCustomToastSuccess(BuildContext context, String message) {
  final overlay = Overlay.of(context);
  final overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      bottom: 50,
      left: 20,
      right: 20,
      child: Material(
        color: Colors.transparent,
        child: Center(
          child: IntrinsicWidth(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFFE8F5E9), // Light green background
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFF4CAF50), width: 1), // Green border
              ),
              child: Text(
                message,
                style: const TextStyle(
                  color: Color(0xFF1B5E20), // Dark green text
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    ),
  );

  overlay.insert(overlayEntry);

  // Remove the toast after 3 seconds
  Future.delayed(const Duration(seconds: 3), () {
    overlayEntry.remove();
  });
}