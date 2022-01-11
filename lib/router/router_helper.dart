import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:notify_me_app/router/routes.dart';
import 'package:notify_me_app/screens/feature_screen1/feature_screen_1.dart';
import 'package:notify_me_app/screens/feature_screen2/feature_screen_2.dart';
import 'package:notify_me_app/screens/feature_screen3/feature_screen_3.dart';
import 'package:notify_me_app/screens/feature_screen4/feature_screen_4.dart';
import 'package:notify_me_app/screens/home_screen/home_screen.dart';
import 'package:notify_me_app/screens/login_screen/login_screen.dart';
import 'package:notify_me_app/screens/registration_screen/registration_screen.dart';

class RouterHelper {
  static final FluroRouter router = FluroRouter();

//*******Handlers*********
  static final Handler _homeScreenHandler = new Handler(handlerFunc: (context, Map<String, dynamic> params) => HomeScreen());
  static final Handler _loginScreenHandler = new Handler(handlerFunc: (context, Map<String, dynamic> params) => LoginScreen());
  static final Handler _registrationScreenHandler = new Handler(handlerFunc: (context, Map<String, dynamic> params) => RegistrationScreen());
  static final Handler _featureScreen1Handler = new Handler(handlerFunc: (context, Map<String, dynamic> params) => FeatureScreen1());
  static final Handler _featureScreen2Handler = new Handler(handlerFunc: (context, Map<String, dynamic> params) => FeatureScreen2());
  static final Handler _featureScreen3Handler = new Handler(handlerFunc: (context, Map<String, dynamic> params) => FeatureScreen3());
  static final Handler _featureScreen4Handler = new Handler(handlerFunc: (context, Map<String, dynamic> params) => FeatureScreen4());


//*******Route Define*********
  static void setupRouter() {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
          return;
        });
    router.define(Routes.HOME_SCREEN, handler: _homeScreenHandler, transitionType: TransitionType.fadeIn);
    router.define(Routes.LOGIN_SCREEN, handler: _loginScreenHandler, transitionType: TransitionType.fadeIn);
    router.define(Routes.REGISTRATION_SCREEN, handler: _registrationScreenHandler, transitionType: TransitionType.fadeIn);
    router.define(Routes.FEATURE_SCREEN_1, handler: _featureScreen1Handler, transitionType: TransitionType.fadeIn);
    router.define(Routes.FEATURE_SCREEN_2, handler: _featureScreen2Handler, transitionType: TransitionType.fadeIn);
    router.define(Routes.FEATURE_SCREEN_3, handler: _featureScreen3Handler, transitionType: TransitionType.fadeIn);
    router.define(Routes.FEATURE_SCREEN_4, handler: _featureScreen4Handler, transitionType: TransitionType.fadeIn);

  }
}