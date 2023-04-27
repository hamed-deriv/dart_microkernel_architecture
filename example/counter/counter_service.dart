import 'package:dart_microkernel_architecture/microkernel_architecture.dart';

import 'messages.dart';

class CounterService implements BaseService {
  int _counter = 0;

  @override
  Future<void> handle<T>(BaseMessage<T> message) async {
    if (message is IncrementMessage) {
      _counter = (message as IncrementMessage).counter;
      print('CounterService: $_counter');
    } else if (message is DecrementMessage) {
      _counter = (message as DecrementMessage).counter;
      print('CounterService: $_counter');
    } else if (message is ResetMessage) {
      _counter = (message as ResetMessage).counter;
      print('CounterService: $_counter');
    } else {
      throw Exception('Message $message not supported.');
    }
  }
}
