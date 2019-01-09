class Event{
  static int _id=1;
  String name,desc;
  int begin_date,begin_hour,lasting_time;
  int get my_id=>_id;

  Event(this.name,this.desc,this.begin_date,this.begin_hour,this.lasting_time){_id++;}



}