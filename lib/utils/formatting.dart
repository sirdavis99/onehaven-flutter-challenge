Map<String, dynamic> filterNonNullAndNonZero(Map<String, dynamic>? params) {
  // Remove entries where the value is null or 0
  if (params == null) return {};

  return Map.fromEntries(
    params.entries.where((entry) => entry.value != null && entry.value != 0),
  );
}
