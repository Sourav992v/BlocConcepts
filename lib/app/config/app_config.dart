import 'package:bloc_equatable_impl/app/config/env.dart';

class AppConfig{
  final Environment environment;
  final String appName;

  static late AppConfig instance;

  AppConfig._({
    required this.environment,
    required this.appName
});

  factory AppConfig.init(){
    final env = getEnvironment();
    switch(env){
      case Environment.dev:
        instance = AppConfig._(
          environment: env,
          appName: "Product Dev"
        );
        break;

      case Environment.staging:
        instance = AppConfig._(
          environment: env,
          appName: "Product Staging"
        );
        break;

      case Environment.prod:
        instance = AppConfig._(
          environment: env,
          appName: "Product Prod"
        );
        break;

    }
    return instance;
  }
}