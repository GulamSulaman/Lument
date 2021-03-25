import 'package:flutter/material.dart';

import '../widgets/onboarding_widgets.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        child: OnboardingWidgets(),
      ),
    );
  }
}
