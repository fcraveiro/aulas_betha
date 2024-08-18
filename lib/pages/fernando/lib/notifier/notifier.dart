import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:collection';

/// A generic notifier class to manage reactive state.
class Notifier<T> {
  late final NotifierMonitor<T> _notifierMonitor = NotifierMonitor(_notifier);
  late ValueNotifier<T> _notifier;
  final List<void Function(T)> _callbacks = [];
  final List<Notifier<T>> _connectors = [];
  final List<NotifierTicker> _tickers = [];
  bool _disposed = false;

  /// Gets the current value.
  T get value => _notifier.value;

  /// Sets the value and notifies listeners.
  set value(T value) {
    if (_disposed) {
      _notifier = ValueNotifier(value);
      _disposed = false;
    }
    if (_notifier.value != value) {
      _notifier.value = value;
      _notifyListeners();
    }
  }

  Notifier(T value) {
    _notifier = ValueNotifier(value);
  }

  /// Displays the current value using a builder function.
  Widget show(Function(T) builder) {
    return _notifierMonitor.show(builder);
  }

  /// Adds a callback to listen for value changes.
  void listen(void Function(T) callback) {
    _callbacks.add(callback);
  }

  /// Removes a callback.
  void unlisten(void Function(T) callback) {
    _callbacks.remove(callback);
  }

  /// Connects another Notifier for synchronization.
  void connect(Notifier<T> connector) {
    if (!_connectors.contains(connector)) {
      _connectors.add(connector);
    }
  }

  /// Disconnects a connected Notifier.
  void disconnect(Notifier<T> connector) {
    _connectors.remove(connector);
  }

  /// Disconnects all connected Notifiers.
  void disconnectAll() {
    _connectors.clear();
  }

  /// Connects a NotifierTicker for synchronization.
  void connectTicker(NotifierTicker ticker) {
    _tickers.add(ticker);
  }

  /// Disconnects a connected NotifierTicker.
  void disconnectTicker(NotifierTicker ticker) {
    _tickers.remove(ticker);
  }

  /// Disconnects all connected NotifierTickers.
  void disconnectAllTickers() {
    _tickers.clear();
  }

  /// Disposes the Notifier and clears resources.
  void dispose() {
    _callbacks.clear();
    _connectors.clear();
    _notifier.dispose();
    _disposed = true;
  }

  /// Notifies all listeners, connectors, and tickers.
  void _notifyListeners() {
    for (var callback in _callbacks) {
      callback(_notifier.value);
    }
    for (var connector in _connectors) {
      connector.value = _notifier.value;
    }
    for (var ticker in _tickers) {
      ticker.tick();
    }
  }
}

/// A specialized Notifier class for managing lists.
class NotifierList<T> extends Notifier<UnmodifiableListView<T>> {
  NotifierList([List<T>? initialList])
      : super(UnmodifiableListView(initialList ?? []));

  /// Gets the length of the list.
  int get length => value.length;

  /// Adds an object to the list.
  void add(T item) {
    _modifyList((list) => list..add(item));
  }

  /// Adds multiple objects to the list.
  void addAll(Iterable<T> items) {
    _modifyList((list) => list..addAll(items));
  }

  /// Inserts an object at the specified index.
  void insert(int index, T item) {
    _modifyList((list) => list..insert(index, item));
  }

  /// Removes an object from the list.
  bool remove(T item) {
    bool removed = false;
    _modifyList((list) {
      removed = list.remove(item);
      return list;
    });
    return removed;
  }

  /// Removes the object at the specified index.
  void removeAt(int index) {
    _modifyList((list) => list..removeAt(index));
  }

  /// Removes objects that match the test.
  void removeWhere(bool Function(T) test) {
    _modifyList((list) => list..removeWhere(test));
  }

  /// Clears the list.
  void clear() {
    _modifyList((list) => list..clear());
  }

  /// Sorts the list.
  void sort([int Function(T, T)? compare]) {
    _modifyList((list) {
      list.sort(compare);
      return list;
    });
  }

  /// Shuffles the list.
  void shuffle([Random? random]) {
    _modifyList((list) {
      list.shuffle(random);
      return list;
    });
  }

  /// Updates the list value and notifies listeners.
  void _modifyList(List<T> Function(List<T>) modifier) {
    final newList = modifier(List.from(value));
    if (!listEquals(value, newList)) {
      value = UnmodifiableListView(newList);
    }
  }
}

/// A ticker class for managing periodic ticks.
class NotifierTicker {
  late final NotifierMonitor<bool> _notifierMonitor =
      NotifierMonitor(_notifier);
  final ValueNotifier<bool> _notifier = ValueNotifier(false);
  final List<void Function()> _callbacks = [];
  final List<NotifierTicker> _connectors = [];

  /// Toggles the tick value and notifies listeners.
  void tick() {
    _notifier.value = !_notifier.value;
    for (var callback in _callbacks) {
      callback();
    }
    for (var connector in _connectors) {
      connector.tick();
    }
  }

  /// Adds a callback to listen for ticks.
  void listen(void Function() callback) {
    _callbacks.add(callback);
  }

  /// Connects another NotifierTicker for synchronization.
  void connect(NotifierTicker connector) {
    if (!_connectors.contains(connector)) {
      _connectors.add(connector);
    }
  }

  /// Displays the current tick value using a builder function.
  Widget show(Function builder) {
    return _notifierMonitor.show((value) => builder());
  }

  /// Disposes the NotifierTicker and clears resources.
  void dispose() {
    _callbacks.clear();
    _notifier.dispose();
  }
}

/// A monitor class for managing value listeners.
class NotifierMonitor<T> {
  final ValueNotifier<T> _notifier;

  NotifierMonitor(this._notifier);

  /// Displays the current value using a builder function.
  Widget show(Function(T) builder) {
    return ValueListenableBuilder<T>(
      valueListenable: _notifier,
      builder: (context, value, child) {
        return builder(value);
      },
    );
  }
}
