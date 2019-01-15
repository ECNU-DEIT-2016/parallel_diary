import 'package:stagexl/stagexl.dart';
import 'base_event.dart';
import 'diary/diary_component.dart';
import 'dart:html';
import 'dart:async';
class eventBar extends DisplayObjectContainer {
  Map<String, int> _colors={"learn":Color.Gray,"game":Color.Yellow,"rest":Color.Blue,"meal":Color.Pink};
  Map<String, int> col={"learn":1,"game":2,"rest":3,"meal":4};
  int _colorIndex = 0;
  TextField _textField;
  static const int h=60;
  static eventBar selector;
  static double tempMouseX,tempBarX;
  Events myevent;
  static int mouseKey;


  eventBar(Events event) {
    print(event.name);
    myevent=event;
    _colorIndex=_colors[event.type];
    _textField = new TextField();
    _textField.defaultTextFormat = new TextFormat("Verdana", 14, Color.Black);
    _textField.width = event.width;
    _textField.height = h;
    _textField.alpha=0.7;
    _textField.x=event.x;
    _textField.y=col[event.type]*80;
    _textField.background = true;
    _textField.backgroundColor = _colorIndex;
    _textField.text = event.name;
    addChild(_textField);

    this.onEnterFrame.listen(_onEnterFrame);
    this.onMouseClick.listen(_onMouseClick);
    this.onMouseDown.listen(_onMouseDown);
    this.onMouseUp.listen(_onMouseUp);
    this.onKeyDown.listen(_anyKeyDown);
    this.onMouseMove.listen(_onMouseMove);
    this.onMouseRightDown.listen(_onMouseRightDown);
    this.onMouseRightUp.listen(_onMouseRightUp);

  }

  _anyKeyDown(KeyboardEvent){
    _textField.text = myevent.name;
  }

  _onEnterFrame(EnterFrameEvent e) {

  }

  _onMouseRightUp(MouseEvent e) {
    selector=null;
    myevent.UpdateEventTime(_textField.x.floor(), _textField.width.floor());
    BaseEventComponent.selectedEvent=myevent;
    mouseKey=0;

  }

  _onMouseRightDown(MouseEvent e) {
    selector=this;
    tempMouseX=mousePosition.x;
    tempBarX=this._textField.width;
    print(selector.name);
    BaseEventComponent.selectedEvent=myevent;
    mouseKey=2;

  }

  _onMouseUp(MouseEvent e){
    selector=null;
    myevent.UpdateEventTime(_textField.x.floor(), _textField.width.floor());
    BaseEventComponent.selectedEvent=myevent;
    mouseKey=0;
  }

  _onMouseClick(MouseEvent e) {

  }

  _onMouseDown(MouseEvent e){
    selector=this;
    tempMouseX=mousePosition.x;
    tempBarX=this._textField.x;
    print(selector.name);
    BaseEventComponent.selectedEvent=myevent;
    mouseKey=1;
  }



  _onMouseMove(MouseEvent e){
    if(selector==this)
      if(mouseKey==1)
    selector._textField.x=tempBarX+mousePosition.x-tempMouseX;
      if(mouseKey==2){
        selector._textField.width=tempBarX+mousePosition.x-tempMouseX;
      }
  }



}




