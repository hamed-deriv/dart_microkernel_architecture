import 'package:dart_microkernel_architecture/microkernel_architecture.dart';

class MicroKernel implements BaseMicrokernel {
  final Map<Type, BaseService> _services = <Type, BaseService>{};

  @override
  Future<void> register<T>(BaseService service) async {
    if (_services.containsKey(T)) {
      throw Exception('Service $T already registered.');
    }

    _services[T] = service;
  }

  @override
  Future<void> send<T>(BaseMessage<T> message) async {
    final BaseService? service = _services[T];

    if (service == null) {
      throw Exception('Service $T not found.');
    }

    await service.handle(message);
  }
}
