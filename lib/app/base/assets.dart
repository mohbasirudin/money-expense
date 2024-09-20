class FontFamily {
  static const sourceSansPro = "Source Sans Pro";
}

class BaseAssets {
  static const _base = "assets";

  static var angleLeftB = _icon("angle_left_b");
  static var basketBall = _icon("basketball");
  static var bookOpen = _icon("book_open");
  static var calendarAlt = _icon("calendar_alt");
  static var carSideview = _icon("car_sideview");
  static var clapperBoard = _icon("clapper_board");
  static var home = _icon("home");
  static var pizzaSlice = _icon("pizza_slice");
  static var rssAlt = _icon("rss_alt");
  static var shoppingCart = _icon("shopping_cart");
  static var gift = _icon("gift");
  static var plus = _icon("plus");

  static String _icon(var name) {
    return "$_base/uil_$name.png";
  }
}
