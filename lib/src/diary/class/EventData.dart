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
  
  //初始化
  EventData(String name, String startTime, String finishTime, String description, String type){
    this.name=name;
    this.description=description;
    this.type=type;

    List temp=startTime.split(":");
    this.startTime=new Time(int.parse(temp[0]),int.parse(temp[1]));

    temp=finishTime.split(":");
    this.finishTime=new Time(int.parse(temp[0]),int.parse(temp[1]));

  }

  //直接赋予id
  void setID(int id){
    this.id=id;
  }
  
  //数据库增加事件
  Future<void> InsertDatabase(MySqlConnection conn) async{
  List<int> Items;
  //在数据库中查找已有的所有id
  Results results = await conn.execute('select id from events');
   results.forEach(
     (Row row) {
     Items.add(int.parse('id:${row[0]}'));
     }
   );
   //赋予未使用过的id
   if(Items.length<1000){
      List<int> numList=new List(1001);
      for(int i=1;i<=1000;i++) numList[1]=0;
      for(int i=0;i<Items.length;i++) numList[Items[1]]++;
      for(int i=1;i<1001;i++)
        if(numList[i]==0){
          this.id=i;
          break;
        }
   }
  print("Inserting rows ...");

  //在数据库中增加事件
  List<Results> r1 =
      await conn.preparedMulti("INSERT INTO events (id,name,description,startTime,finishTime,type) VALUES (?,?,?,?,?,?)", 
      [
        [this.id,this.name,this.description,this.startTime.getTime(),this.finishTime.getTime(),this.type]
      ]);
  print("Rows inserted!");
}    
  
//在数据库中删除这一事件
Future<void> DeleteDatabase(MySqlConnection conn) async{
  print("Deleting rows ...");
  List<Results> r1 =
      await conn.preparedMulti("DELETE FROM events (id,name,description,startTime,finishTime,type) WHERE id='?'", 
      [
        [this.id]
      ]);
  print("Rows deleted!");
  }
}