import 'package:flutter_modular/flutter_modular.dart';
import 'package:potter_trunfo/features/splash/view/screen/splash_screen.dart';

class SplashModule extends Module {
  
  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            child: (context, args) => SplashScreen())
      ];
}
