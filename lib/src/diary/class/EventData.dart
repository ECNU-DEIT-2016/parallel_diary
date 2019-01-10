import 'Time.dart';
import 'dart:async';
import 'package:sqljocky5/sqljocky.dart';

class EventData{
  int id;
  String name;
  Time startTime;
  Time finishTime;
  String description;
  String type;
  
  Event(String name, String startTime, String finishTime, String description, String type){
    this.name=name;
    this.description=description;
    this.type=type;

    List temp=startTime.split(":");
    this.startTime=new Time(int.parse(temp[0]),int.parse(temp[1]));

    temp=finishTime.split(":");
    this.finishTime=new Time(int.parse(temp[0]),int.parse(temp[1]));
  }
  
  void UploadDatabase() async{
    var s = ConnectionSettings(
    user: "deit2016",
    password: "deit2016@ecnu",
    host: "www.muedu.org",
    port: 3306,
    db: "deit2016db_10164507136",
  );
    print("Opening connection ...");
  var conn = await MySqlConnection.connect(s);
  print("Opened connection!");

  List<int> Items;
  Results results = await conn.execute('select id from events');
   results.forEach(
     (Row row) {
     Items.add(int.parse('id:${row[0]}'));
     }
   );

   this.id=Items.length+1;
   
  print("Inserting rows ...");
  List<Results> r1 =
      await conn.preparedMulti("INSERT INTO events (id,name,description,startTime,finishTime,type) VALUES (?,?,?,?,?,?)", 
      [
        [this.id,this.name,this.description,this.startTime.getTime(),this.finishTime.getTime(),this.type]
      ]);
  print("Rows inserted!");
}    
  }

  