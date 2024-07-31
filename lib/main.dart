
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'core/theme/theme_data.dart';
import 'core/utils/exception/common_exception.dart';
import 'core/utils/logger.dart';
import 'data/data_source/mock/display_mock_api.dart';
import 'data/data_source/remote/display.api.dart';
import 'presentation/routes/routes.dart';
import 'service_locator.dart';

void main() async {
  setLocator();

  try {
    final test = await locator<DisPlayApi>().getViewModulesByTabId(10001);
    CustomLogger.logger.d(test.data);
  } catch(error) {
    final errorData = CommonException.setError(error);
    CustomLogger.logger.e(errorData);
  }
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      /// routes/routes.dart 경로지정
      theme: CustomThemeData.themeData,
      /// core/theme 디자인 지정
    );
  }
}
