import 'package:angular/angular.dart';

@Component(
  selector: 'rectangle',
  templateUrl:'rectangle.html',
)

class Rectangle{//interface of canvas
  int left,
  top,
  width;
  static const int height=50;
  Rectangle(this.left,this.top,this.width);
}