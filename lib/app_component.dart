
import 'package:angular/angular.dart';


import 'src/diary/diary_component.dart';
import 'src/calendar/calendar_component.dart';
import 'src/backend_service.dart';
import 'src/base_event_service.dart';

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
  @override
  void ngOnInit() {

  }


}