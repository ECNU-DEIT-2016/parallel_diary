import 'dart:async';
import 'package:sqljocky5/sqljocky.dart';
import 'diary/class/EventData.dart';
import 'base_event.dart';

class BackendService {

  final _mockEvents = [
    Events('coding','i like coding',2,18,36,"game"),
    Events('sleep', 'i hate sleep',3,6,24,"rest"),
    Events('learn', 'Learning makes me happy!',4,8,32,"learn"),
  ];

  List<Events>events;

    Future<List<Events>> transform() async {
      var data = await TraverseAllData();
      for(EventData ed in data){
        Events newE=new Events(ed.name, ed.description, (ed.startTime.hour/24).floor(),
            (ed.startTime.hour%24)*4+(ed.startTime.minute/15).floor(),
            ((ed.finishTime.hour-ed.startTime.hour)*4).floor()+((ed.finishTime.minute-ed.startTime.minute)/15).floor(),
            ed.type);
        events.add(newE);
      }
      return events;
    }


  Future<List<Events>> getAll(type) async {
      TraverseAllData();

      return transform();
    return _mockEvents;
  }



  //从数据库中读取所有的事件数据，并返回EvenData列表
  Future<List<EventData>> TraverseAllData() async{
    var s = ConnectionSettings(
      user: "deit2016",
      password: "deit2016@ecnu",
      host: "www.muedu.org",
      port: 3306,
      db: "deit2016db_10164507136",
    );
    print("Opening connection ...");
    var conn = await MySqlConnection.connect(s);
    print("正在从数据库中调取数据。。");
    List<EventData> list;
    EventData temp;

    Results results = await conn.execute('select * from events');
    results.forEach(
            (Row row) {
          //Items.add(int.parse('id:${row[0]}'));
          String time1='startTime:${row[4]}',time2='finishTime:${row[5]}';
          temp=new EventData('name:${row[1]}',time1,time2,'description:${row[3]}','type:${row[6]}');
          temp.setID(int.parse('id:${row[0]}'));
          list.add(temp);
        }
    );

    print("事件读取完毕！");
    return list;
  }
}