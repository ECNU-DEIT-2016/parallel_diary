import 'package:angular/angular.dart';

import 'src/todo_list/todo_list_component.dart';
import 'src/diary/diary_component.dart';
import 'src/calendar/calendar_component.dart';

// AngularDart info: https://webdev.dartlang.org/angular
// Components info: https://webdev.dartlang.org/components

@Component(
  selector: 'my-app',
  styleUrls: ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: [TodoListComponent,DiaryComponent,CalendarComponent],
)
class AppComponent {
  // Nothing here yet. All logic is in TodoListComponent.
}
