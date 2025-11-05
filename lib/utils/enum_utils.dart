T stringToEnum<T>(Iterable<T> values, String stringType) => values.firstWhere(
      (f) =>
          f.toString().substring(f.toString().indexOf('.') + 1).toString() ==
          stringType,
      orElse: () => null as T,
    );

T stringToEnumLower<T>(Iterable<T> values, String stringType) =>
    stringToEnum<T>(
      values,
      stringType.toUpperCase(),
    );

String enumToString<T>(T o) => o.toString().split('.').last;

String enumToStringLower<T>(T o) => enumToString<T>(o).toLowerCase();
