import 'package:angular/angular.dart';


import 'src/diary/diary_component.dart';
import 'src/calendar/calendar_component.dart';
import 'src/backend_service.dart';
import 'src/base_event_service.dart';
import 'src/base_event.dart';

import 'dart:html';



// AngularDart info: https://webdev.dartlang.org/angular
// Components info: https://webdev.dartlang.org/components

@Component(
  selector: 'my-app',
  styleUrls: ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: [BaseEventComponent,CalendarComponent],
  providers: [
    ClassProvider(BackendService),
    ClassProvider(EventService),
  ]
)
class AppComponent implements OnInit{
  CanvasElement canvas;
  CanvasRenderingContext2D ctx;
  List<Event> e;

  @override
  void ngOnInit() {
    // TODO: implement ngOnInit
    canvas=querySelector('#canvas');
    ctx=canvas.getContext('2d');
    e=BaseEventComponent.events;
   // drawRect();
  }

  void drawRect(){
    for(var i=0;i<3;i++){
      ctx..fillStyle = "blue"
        ..strokeStyle = "white";

      final int x = e[i].x;
      final int y = e[i].y;



      ctx..fillRect(x, y, e[i].lasting_time, 50)
        ..strokeRect(x, y, e[i].width, 50);
    }
  }
}
