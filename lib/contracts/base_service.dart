import 'package:dart_microkernel_architecture/microkernel_architecture.dart';

abstract class BaseService<T> {
  Future<void> handle(BaseMessage<T> message);
}
