/// This class groups all app constants
class Constants {
  //Private constructor to prevent this class being instantiated
  Constants._();

  /// Home screen
  static const String APP_TITLE = "URL Shortener";
  static const String APP_SLOGAN = "Just copy an URL and we will do the magic "
      "for you!";

  /// SingleUrl screen
  static const String URL_TAB = "From URL";

  /// MultipleUrl screen
  static const String MULTIPLE_URLS_TAB = "From multiple URLs";
  static const String MULTIPLE_URLS_INFO = "You can short multiple URLs in one";
  static const String MULTIPLE_URLS_INFO_WARNING = "The shorted URL redirects"
      " to a random active URL from the original URLs";

  /// Csv screen
  static const String CSV_TAB = "From CSV";
  static const String CSV_INFO = "You can import a csv file with multiples "
      "URL to short.\n"
      "Each line must contain only one URL.\n"
      "You will receive another CSV file eith all URLs shorted.";
  static const String CSV_ERROR = "Something is wrong with the CSV file";
  static const String CSV_ERROR_ADVICE = "Check the file and upload it again";
  static const String CSV_BUTTON = "Add CSV file";
  /// Buttons
  static const String SHORT_BUTTON = "Short";
  static const String GO_BACK_BUTTON = "Short another URL";
  static const String ADD_URL_BUTTON = "Add another URL";
}
