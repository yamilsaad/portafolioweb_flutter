import 'package:flutter/material.dart';

import '../responsive/responsive.dart';

class HomeScreem extends StatelessWidget {
  const HomeScreem({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
        desktopScaffold: ResponsiveDesktop(),
        mobileScaffold: ResponsiveMobile(),
        tabletScaffold: ResponsiveTablet());
  }
}
