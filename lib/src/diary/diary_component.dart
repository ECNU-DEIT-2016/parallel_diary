import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:stagexl/stagexl.dart';
import 'dart:html';

import '../base_event_details.dart';
import '../base_event.dart';
import '../base_event_service.dart';
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
  static List<eventBar> eventBars;
  static Map EvToEb=new Map();
  static Events selectedEvent;
  static var canvas=querySelector('#stage');
  static var stage=new Stage(canvas);
  static var renderLoop = new RenderLoop();

  final EventService _eventService;

  BaseEventComponent(this._eventService);

  void ngOnInit() async {
    renderLoop.addStage(stage);
    eventBars=new List<eventBar>();
    events = await _eventService.getAll();
    for(var i=0;i<events.length;i++){
      var eb=new eventBar(events[i]);
      eventBars.add(eb);
      EvToEb[events[i]]=eb;
      stage.addChild(eb);
    }
  }

  static void deleteEvent(Events e){
    stage.removeChild(EvToEb[e]);
    events.remove(e);
    eventBars.remove(EvToEb[e]);
    EvToEb.remove(e);
    selectedEvent=null;
  }
  static void updateType(Events e){
    stage.removeChild(EvToEb[e]);
    eventBars.remove(EvToEb[e]);
    var eb=new eventBar(e);
    eventBars.add(eb);
    EvToEb[e]=eb;
    stage.addChild(EvToEb[e]);
  }

  void addEvent(){
    Events e=new Events("New", "Description", 0, 15, 15, "game");
    events.add(e);
    var eb=new eventBar(e);
    eventBars.add(eb);
    EvToEb[e]=eb;
    stage.addChild(eb);
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
