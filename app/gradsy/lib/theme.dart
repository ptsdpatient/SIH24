
import 'global_data.dart';

class userTheme{
  String name;
  String gradientStart="";
  String gradientEnd="";

  bool lightMode=GlobalData.instance.lightMode;

  userTheme({
    required this.name,
    required this.gradientStart,
    required this.gradientEnd,
  });


  static bool setMode(bool lightMode){
    lightMode=GlobalData.instance.lightMode;
    return true;
  }

  //find the user theme and return the particular theme
  static userTheme getTheme(String name){
    for(userTheme t in themes){
      if(t.name == name){
        return t;
      }
    }
    return themes[0];
  }



  //return gradient of current theme


  //for background gradient wrt light mode
  static String modeBG(){
    if(currentTheme.lightMode) return "ffffff";
    else return "000000";
  }



  //for text display in different themes
  static String textMode(){
    if(currentTheme.lightMode) return currentTheme.gradientStart;
    else return "ffffff";
  }

  //change current theme when global theme string changes
  static bool setTheme(String name){
    currentTheme=userTheme.getTheme(name);
    currentTheme.lightMode=GlobalData.instance.lightMode;
    return true;
  }

}


List<userTheme> themes =[
  userTheme(
    name: "Zen",
    gradientStart: "000000",
    gradientEnd: "000000",

  ),
  userTheme(
    name: "Nebula",
    gradientStart: "258eff",
    gradientEnd: "7d2eff",

  ),
  userTheme(
      name: "Dream",
      gradientStart: "4d88e0",
      gradientEnd: "bd85e0",

  ),userTheme(
      name: "Amethyst",
      gradientStart: "a28fff",
      gradientEnd: "7000ff",

  ),
  userTheme(
      name: "Burn",
      gradientStart: "e77c19",
      gradientEnd: "ff46bb",

  ),
  userTheme(
      name: "Cotton",
      gradientStart: "5170ff",
      gradientEnd: "ff66c4",

  ),
  userTheme(
      name: "Viper",
      gradientStart: "26b273",
      gradientEnd: "5ee130",

  ),
];


userTheme currentTheme=userTheme.getTheme(GlobalData.instance.theme);


