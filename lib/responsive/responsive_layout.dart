import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  //Tres variables de tipo widget para almacenar los widgets que se utilizaran para las medidas de las pantallas responsive!
  //Estas variiables se pasan como argumento al constructor de la clase:
  final Widget mobileScaffold;
  final Widget tabletScaffold;
  final Widget desktopScaffold;

  //Constructor de la clase ResponsiveLayout con sus argumentos:
  const ResponsiveLayout({
    super.key,
    required this.mobileScaffold,
    required this.tabletScaffold,
    required this.desktopScaffold,
  });

  @override
  Widget build(BuildContext context) {
    //Se utiliza el widget LayoutBuilder para obtener las restricciones de diseño actuales del widget:
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 500) {
        return mobileScaffold;
      } else if (constraints.maxWidth < 1100) {
        return tabletScaffold;
      } else {
        return desktopScaffold;
      }
    });
  }
}
