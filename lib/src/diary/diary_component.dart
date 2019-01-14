import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_forms/angular_forms.dart';
import 'dart:html';
import 'dart:async';
import 'package:sqljocky5/sqljocky.dart';

import '../base_event_details.dart';
import '../base_event.dart';
import '../base_event_service.dart';
import 'class/EventData.dart';
import 'class/Time.dart';

@Component(
  selector: 'diary',
  styleUrls: ['diary_component.css'],
  templateUrl: 'diary_component.html',
  directives: [
    MaterialCheckboxComponent,
    MaterialFabComponent,
    MaterialIconComponent,
    materialInputDirectives,
    NgFor,
    NgIf,
    coreDirectives,
    formDirectives,

    MaterialSliderComponent,
    EventDetailComponent,

  ],
  providers: [ClassProvider(EventService),
  ],

)

class BaseEventComponent implements OnInit {
  static List<Event> events;
  Event selectedEvent;
  final EventService _eventService;

  BaseEventComponent(this._eventService);

  void ngOnInit() async {
    events = await _eventService.getAll();
  }


  void selectEvent(Event event
    //  ,MaterialCheckboxComponent cb
      ) {
    //if(cb.checked){
    //  selectedEvent=null;
  //  }
//      else

    selectedEvent = event;
  }

  //从数据库中读取所有的事件数据，并返回EvenData列表
   Future<List<EventData>> TraverseAllData(MySqlConnection conn) async{
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
