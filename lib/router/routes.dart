class Routes{
  static final String HOME_SCREEN = "home";
  static final String WELCOME_SCREEN = "welcome";
  static final String REGISTRATION_SCREEN = "registration";
  static final String LOGIN_SCREEN = "login";
  static final String FEATURE_SCREEN_1 = "1";
  static final String FEATURE_SCREEN_2 = "2";
  static final String FEATURE_SCREEN_3 = "3";
  static final String FEATURE_SCREEN_4 = "4";

  static String getWelcomeScreen(){
    return WELCOME_SCREEN;
  }

  static String getHomeScreen(){
    return HOME_SCREEN;
  }

  static String getRegistrationRoute(){
    return REGISTRATION_SCREEN;
  }

  static String getLoginRoute(){
    return LOGIN_SCREEN;
  }

}