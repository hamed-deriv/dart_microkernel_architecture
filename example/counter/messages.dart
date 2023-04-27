import 'package:dart_microkernel_architecture/microkernel_architecture.dart';

class IncrementMessage implements BaseMessage<int> {
  IncrementMessage(this.counter);

  final int counter;
}

class DecrementMessage implements BaseMessage<int> {
  DecrementMessage(this.counter);

  final int counter;
}

class ResetMessage implements BaseMessage<int> {
  ResetMessage(this.counter);

  final int counter;
}
