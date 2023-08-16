class AppAssets {
  AppAssets._();
  //! For Images
  static String _getImgPath(String asset) {
    return "assets/../$asset.png";
  }

  static String _getSvgPath(String asset) {
    return "assets/images/$asset.svg";
  }

//! For Icons
  static String _getIconPath(String asset) {
    return "assets/.../$asset.png";
  }

  static String _getIconSvgPath(String asset) {
    return "assets/icons/$asset.svg";
  }

//! Assets

  static String appLogo = _getImgPath("logo");
  static String appIcon = _getSvgPath("app_icon");

  static String appLogo1 = _getIconPath("logo");
  static String appIcon1 = _getIconSvgPath("app_icon");

  static const String following = "following";
  static const String notFollowing = "follow";

//! url
  static const String url = "http://localhost:80";
}
