checkBody({
  required List<String> keys,
  required Map body,
}) {
  final List<String> notFountKeys = [];
  for (var key in keys) {
    if (!body.containsKey(key)) {
      notFountKeys.add(key);
    }
  }
  if (notFountKeys.isNotEmpty) {
    throw FormatException("Body Should contain $notFountKeys");
  }
}