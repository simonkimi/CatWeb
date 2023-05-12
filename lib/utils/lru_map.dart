class LruEntity<T> {
  LruEntity({
    required this.value,
    required this.size,
  });

  final T value;
  final int size;
}

class LruMap<T> {
  _Link? _head;
  _Link? _tail;

  final entries = <String, _Link<T>>{};

  int _currentSize = 0;
  final int maxSize;
  final int maxEntrySize;

  LruMap({required this.maxSize, required this.maxEntrySize}) {
    assert(maxEntrySize != maxSize);
    assert(maxEntrySize * 5 <= maxSize);
  }

  T? operator [](String key) {
    final entry = entries[key];
    if (entry == null) return null;

    _moveToHead(entry);
    return entry.value;
  }

  void operator []=(String key, LruEntity<T> entity) {
    final entrySize = entity.size;
    if (entrySize > maxEntrySize) return;

    final entry = _Link(key, entity.value, entrySize);

    entries[key] = entry;
    _currentSize += entry.size;
    _moveToHead(entry);

    while (_currentSize > maxSize) {
      assert(_tail != null);
      remove(_tail!.key);
    }
  }

  void clear() {
    entries.clear();

    _head = null;
    _tail = null;
    _currentSize = 0;
  }

  T? remove(String key) {
    final entry = entries[key];
    if (entry == null) return null;

    _currentSize -= entry.size;
    entries.remove(key);

    if (entry == _tail) {
      _tail = entry.next;
      _tail?.previous = null;
    }
    if (entry == _head) {
      _head = entry.previous;
      _head?.next = null;
    }

    return entry.value;
  }

  void _moveToHead(_Link link) {
    if (link == _head) return;

    if (link == _tail) {
      _tail = link.next;
    }

    if (link.previous != null) {
      link.previous!.next = link.next;
    }
    if (link.next != null) {
      link.next!.previous = link.previous;
    }

    _head?.next = link;
    link.previous = _head;
    _head = link;
    _tail ??= link;
    link.next = null;
  }
}

class _Link<T> {
  _Link? next;
  _Link? previous;

  final int size;

  final String key;

  final T value;

  _Link(this.key, this.value, this.size);
}
