import 'dart:async';

import 'base_event.dart';

class BackendService {
  static final _mockEvents = [
    Event('coding','i like coding',9,18,12),
    Event('sleep', 'i hate sleep',10,6,2),
    Event('learn', 'Learning makes me happy!',10,8,3),
  ];

  Future<List> getAll(type) async => type == Event
      ? _mockEvents
      : throw Exception('Cannot get object of this type');
}