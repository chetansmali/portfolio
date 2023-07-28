import 'dart:async';

abstract class Controller<T extends Controller<T>> {
  final StreamController<T> _state = StreamController.broadcast();
  Stream<T> get state => _state.stream;

  void setState();

  void updateStream<S extends T>(S newState) {
    _state.add(newState);
  }

  StreamSubscription<T> listen(
    void Function(T event)? onData, {
    Function? onError,
    void Function()? onDone,
    bool? cancelOnError,
  }) {
    return state.listen(
      onData,
      onError: onError,
      onDone: onDone,
      cancelOnError: cancelOnError,
    );
  }
}
