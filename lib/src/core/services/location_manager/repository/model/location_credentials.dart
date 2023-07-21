class LocationCredentials {
  String? apiKey;
  String? defaultApi;

  LocationCredentials({
    this.apiKey,
    this.defaultApi,
  });

  factory LocationCredentials.fromJson(Map<String, dynamic> srcJson) =>
      LocationCredentials(
        apiKey: srcJson['apiKey'] as String?,
        defaultApi: srcJson['defaultApi'] as String?,
      );

  Map<String, dynamic> toJson() {
    return {
      'apiKey': apiKey,
      'defaultApi': defaultApi,
    };
  }
}
