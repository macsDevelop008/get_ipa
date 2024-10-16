import 'package:flutter/material.dart';
import 'package:modelo_para_ganar/presentation/presentation.dart';

class SummaryBaseScreen extends StatelessWidget {
  const SummaryBaseScreen({super.key, required this.child});

  //static const String name = 'summary-screen';
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      // ignore: deprecated_member_use
      onPopInvoked: (didPop) {
        if (didPop) {
          debugPrint('PopScope: Se intentó hacer pop');
        }
        debugPrint('PopScope: No se puede hacer pop');
      },
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          // Tamaños
          final height = constraints.maxHeight;
          final width = constraints.maxWidth;

          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //! Publicidad
              SummaryAdvertisingView(
                height: height,
                width: width,
              ),
              //! Pestañas - tabs
              SummayTabNavigationView(
                height: height * 0.08,
                width: width,
              ),
              //! Hijo - Resumen, Autoejecución, Radiografía
              Expanded(child: child)
            ],
          );
        },
      ),
    );
  }
}
