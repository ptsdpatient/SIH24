class GlobalData {
  GlobalData._privateConstructor();

  static final GlobalData _instance = GlobalData._privateConstructor();

  static GlobalData get instance => _instance;

  String theme = 'Nebula';
  bool lightMode = true;
}