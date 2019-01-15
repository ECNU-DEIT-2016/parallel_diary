import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:stagexl/stagexl.dart';

import 'dart:html';

import '../base_event_details.dart';
import '../base_event.dart';
import '../base_event_service.dart';
import '../clock.dart';
import '../displayEvent.dart';
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
  static List<Events> events;
  static Events selectedEvent;
  static List<eventBar>eb;
  static  Map EbToEv;
  final EventService _eventService;
  static var canvas;
  static var stage;

  BaseEventComponent(this._eventService);


  void ngOnInit() async {// TODO: implement ngOnInit
    // setup the Stage and RenderLoop
    canvas = querySelector('#stage');
    stage = new Stage(canvas);

    var renderLoop = new RenderLoop();
    renderLoop.addStage(stage);

    events = await _eventService.getAll();
    eb=new List<eventBar>();
    EbToEv=new Map();
    for(var i=0;i<events.length;i++) {
      var eBar=new eventBar(events[i]);
      stage.addChild(eBar);
      eb.add(eBar);
      EbToEv[events[i]]=eb[i];
    }


    Clock c=new Clock();
    stage.addChild(c);
    stage.removeChild(c);



  }



  void addEvent(){
    Events newEvent=new Events("name","desc",0,10,10,"learn");
    selectEvent(newEvent);
    events.add(newEvent);
    eventBar eb = new eventBar(events[events.length-1]);
    EbToEv[events[events.length-1]]=eb;
    stage.addChild(eb);
  }

 static void deleteEvent(Events e){
    stage.removeChild(EbToEv[e]);
    events.remove(e);
    eb.remove(EbToEv[e]);
    EbToEv.remove(e);
    selectedEvent=null;
  }


  void selectEvent(Events event
    //  ,MaterialCheckboxComponent cb
      ) {
    //if(cb.checked){
    //  selectedEvent=null;
  //  }
//      else

    selectedEvent = event;
  }
}
