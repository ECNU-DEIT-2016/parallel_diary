import 'dart:async';

import 'backend_service.dart';
import 'base_event.dart';

class EventService{
  final BackendService _backendService;
  List<Events>events;

  EventService(this._backendService);
  Future<List<Events>> getAll() async {
    events = await _backendService.getAll(Events);
    return events;
  }
}