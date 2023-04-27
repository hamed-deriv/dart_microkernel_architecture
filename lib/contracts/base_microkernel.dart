import 'package:dart_microkernel_architecture/microkernel_architecture.dart';

abstract class BaseMicrokernel {
  Future<void> register<T>(BaseService service);
  Future<void> send<T>(BaseMessage<T> message);
}
