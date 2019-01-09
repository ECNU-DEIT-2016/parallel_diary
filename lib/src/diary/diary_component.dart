import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'dart:html';

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
  ],
)

class DiaryComponent {
  
  //构造函数
  DiaryComponent(){
    
  }

  
}