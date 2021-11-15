import 'package:flutter/material.dart';
import 'package:flutternewsrealm/view/screens/detailed_screen.dart';

abstract class FlowCoordinator {
  /// Navigates to view detailed screen
  void goToViewDetailedScreen();
}

class MyFlowCoordinator implements FlowCoordinator {
  final BuildContext _context;

  MyFlowCoordinator(this._context);

  @override
  void goToViewDetailedScreen() {
    Navigator.push(
      _context,
      MaterialPageRoute(builder: (context) => const DetailedScreen()),
    );
  }
}
