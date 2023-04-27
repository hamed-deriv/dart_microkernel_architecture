import 'package:dart_microkernel_architecture/microkernel_architecture.dart';

abstract class BaseService {
  Future<void> handle<T>(BaseMessage<T> message);
}
