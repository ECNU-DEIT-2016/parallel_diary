class Events{
  static int _id=1;
  Map<int,String> dayName={0:"Sunday",1:"Monday",2:"Tursday",3:"Wednesday",4:"Thursday",5:"Friday",6:"Saturday"};
  String name,desc,type;
  int begin_date,begin_time,lasting_time,my_id;
  Events(this.name,this.desc,this.begin_date,this.begin_time,this.lasting_time,this.type){_id++;this.my_id=_id;}

  int get x=>begin_date*96+begin_time;
  int get width => lasting_time;
  String get begin_string => (this.begin_time~/4).toString()+":"+((this.lasting_time%4==0)?"00":(this.lasting_time%4*15).toString());
  String get lasting_string => (this.lasting_time~/4).toString()+":"+((this.lasting_time%4==0)?"00":(this.lasting_time%4*15).toString());

  UpdateEventTime(int x,int width){
    this.begin_date=(x/96).floor();
    this.begin_time=x%96;
    this.lasting_time=width;

  }



}