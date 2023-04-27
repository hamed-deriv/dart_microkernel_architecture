import 'package:dart_microkernel_architecture/microkernel_architecture.dart';

import 'counter/counter_service.dart';
import 'counter/messages.dart';

void main(List<String> arguments) {
  final MicroKernel microKernel = MicroKernel();
  final BaseService counterService = CounterService();

  microKernel.register<int>(counterService);

  final IncrementMessage incrementMessage = IncrementMessage(5);
  final DecrementMessage decrementMessage = DecrementMessage(2);
  final ResetMessage resetMessage = ResetMessage(0);

  microKernel
    ..send<int>(incrementMessage)
    ..send<int>(decrementMessage)
    ..send<int>(resetMessage);
}
