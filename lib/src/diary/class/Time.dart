class Time{
  int hour;
  int minute;

  Time(int hour,int minute){
    this.hour=hour;
    this.minute=minute;
  }
  bool equal(Time another){
    if(this.hour==another.hour && this.minute==another.minute) return true;
    else return false;
  }

  String getTime(){
    String time=this.hour.toString()+":"+this.minute.toString();
    return time;
  }
}