import 'package:test/test.dart';

import 'package:dart_microkernel_architecture/microkernel_architecture.dart';

class TestMessage extends BaseMessage<String> {
  TestMessage(this.payload);

  String payload;
}

class TestService extends BaseService {
  String? lastMessagePayload;

  @override
  Future<void> handle<String>(BaseMessage<String> message) async {
    if (message is TestMessage) {
      lastMessagePayload = (message as TestMessage).payload;
    }
  }
}

void main() {
  group('Microkernel test =>', () {
    test('registers and sends messages to a service.', () async {
      const String messagePayload = 'Test message';

      final Microkernel kernel = Microkernel();
      final TestService service = TestService();

      await kernel.register<String>(service);

      final TestMessage message = TestMessage(messagePayload);

      await kernel.send<String>(message);

      expect(service.lastMessagePayload, equals(messagePayload));
    });

    test('throws exception when service not found.', () async {
      final Microkernel kernel = Microkernel();
      final TestMessage message = TestMessage('Test message');

      expect(() => kernel.send<String>(message), throwsException);
    });

    test('throws exception when service already registered.', () async {
      final Microkernel kernel = Microkernel();
      final TestService service = TestService();

      await kernel.register<String>(service);

      expect(() => kernel.register<String>(service), throwsException);
    });
  });
}
