import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_forms/angular_forms.dart';
import 'dart:html';

import '../base_event_details.dart';
import '../base_event.dart';
import '../base_event_service.dart';

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

    EventDetailComponent

  ],
  providers: [ClassProvider(EventService)],
)
class BaseEventComponent implements OnInit {
  List<Event> events;
  Event selectedEvent;
  final EventService _eventService;

  BaseEventComponent(this._eventService);

  //HeroListComponent(this._heroService);

  void ngOnInit() async {
    events = await _eventService.getAll();
  }

  void selectEvent(Event event) {
    selectedEvent = event;
  }
}
