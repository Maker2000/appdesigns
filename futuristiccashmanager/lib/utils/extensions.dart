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
    return '${this!.substring(0, this!.length - 2).toUpperCase()}${this![this!.length - 1].toLowerCase()}';
  }
}
