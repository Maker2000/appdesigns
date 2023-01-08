extension EnumExtn on Enum {
  String get toRoute => '/$name';
  String get titleCase => name.titleCase;
  String get reverseTitleCase => name.reverseTitleCase;
}

extension StringExtn on String? {
  String get titleCase {
    if (this == null) return '';
    return '${this![0].toUpperCase()}${this!.substring(1).toLowerCase()}';
  }

  String get reverseTitleCase {
    if (this == null) return '';
    return '${this!.substring(0, this!.length - 1).toUpperCase()}${this![this!.length - 1].toLowerCase()}';
  }
}

extension MathExtn on num? {
  num remap(num fromMin, num fromMax, num toMin, num toMax) {
    if (this == null) return 0;
    return (this! - fromMin) / (fromMax - fromMin) * (toMax - toMin) + toMin;
  }
}

extension NumListExtn<T> on Iterable<T>? {
  num sum(num Function(T element) evaluate) {
    if (this == null) return 0;
    return this!
        .fold(0, (previousValue, element) => previousValue + evaluate(element));
  }

  num average(num Function(T element) evaluate) {
    if (this == null) return 0;
    if (this!.isEmpty) {
      throw Exception('Cannot perform average function on an empty list.');
    }
    return sum(evaluate) / this!.length;
  }

  num max(num Function(T element) evaluate) {
    if (this == null) return 0;
    return this!.fold(
        0,
        (previousValue, element) => evaluate(element) > previousValue
            ? evaluate(element)
            : previousValue);
  }
}
