import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_forms/angular_forms.dart';
import 'diary/diary_component.dart';
import 'base_event.dart';

@Component(
  selector:'event-detail',
  templateUrl:'base_event_details.html',
  directives:[coreDirectives, formDirectives,MaterialInputComponent,
  MaterialFabComponent,
  MaterialIconComponent,
  MaterialSelectBase,
  MaterialSelectComponent,
  MaterialSelectItemComponent],
)
    class EventDetailComponent {
    @Input()
    Events event;
    var events=BaseEventComponent.events;
    String proto;

    void deleteEvent(){
      BaseEventComponent.deleteEvent(event);
      event=new Events("None", "Nothing", 0, 0, 0, "learn");
    }

    void typeChange(String p){
      event.type=p;
      BaseEventComponent.updateType(event);
    }

    }
