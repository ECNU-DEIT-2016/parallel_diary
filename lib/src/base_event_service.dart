import 'dart:async';

import 'backend_service.dart';
import 'base_event.dart';

class EventService{
  final BackendService _backendService;
  List<Event>events;

  EventService(this._backendService);
  Future<List<Event>> getAll() async {
    events = await _backendService.getAll(Event);
    return events;
  }
}