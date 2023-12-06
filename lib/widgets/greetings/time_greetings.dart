class Greetings {

  static String getGreetingsByTime (){
    var hour = DateTime.now().hour;
    if (hour <= 12) {
      return 'Good Morning';
    } else if ((hour > 12) && (hour <= 16)) {
      return 'Good Afternoon';
    } else if ((hour > 16) && (hour < 20)) {
      return 'Good Evening';
    } else {
      return 'Good Night';
    }
  }




}