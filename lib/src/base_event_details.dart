import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';

import 'base_event.dart';

@Component(
  selector:'event-detail',
  templateUrl:'base_event_details.html',
  directives:[coreDirectives, formDirectives],
)
    class EventDetailComponent {
    @Input()
    Event event;
    }
