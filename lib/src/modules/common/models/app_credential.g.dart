// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_credential.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppCredential _$AppCredentialFromJson(Map<String, dynamic> json) {
  return AppCredential(
    modelConfig: (json['modelConfig'] as List?)
        ?.map((e) => ModelConfig.fromJson(e as Map<String, dynamic>))
        .toList(),
    appConfig: json['appConfig'] == null
        ? null
        : AppConfig.fromJson(json['appConfig'] as Map<String, dynamic>?),
    domainConfig: (json['domainConfig'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, DomainConfig.fromJson(e as Map<String, dynamic>)),
    ),
  );
}

Map<String, dynamic> _$AppCredentialToJson(AppCredential instance) =>
    <String, dynamic>{
      'modelConfig': instance.modelConfig,
      'appConfig': instance.appConfig,
      'domainConfig': instance.domainConfig,
    };

ModelConfig _$ModelConfigFromJson(Map<String, dynamic> json) {
  return ModelConfig(
    name: json['name'] as String?,
    code: json['code'] as int?,
    supportedMlModels: (json['supportedMlModels'] as List?)
        ?.map((e) => SupportedMlModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ModelConfigToJson(ModelConfig instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
      'supportedMlModels': instance.supportedMlModels,
    };

SupportedMlModel _$SupportedMlModelFromJson(Map<String, dynamic> json) {
  return SupportedMlModel(
    json['name'] as String?,
    json['destination_path'] as String?,
    json['model_type'] as String?,
    (json['versions'] as List?)
        ?.map((e) => ModelInfo.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$SupportedMlModelToJson(SupportedMlModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'destination_path': instance.destinationPath,
      'model_type': instance.modelType,
      'versions': instance.versions,
    };

ModelInfo _$ModelInfoFromJson(Map<String, dynamic> json) {
  return ModelInfo(
    json['version'] as int?,
    json['url'] as String?,
  );
}

Map<String, dynamic> _$ModelInfoToJson(ModelInfo instance) => <String, dynamic>{
      'version': instance.version,
      'url': instance.url,
    };

AppConfig _$AppConfigFromJson(Map<String, dynamic>? json) {
  return AppConfig();
}

Map<String, dynamic> _$AppConfigToJson(AppConfig instance) =>
    <String, dynamic>{};

DomainConfig _$DomainConfigFromJson(Map<String, dynamic> json) {
  return DomainConfig(
    credentials: json['credentials'] as Map<String, dynamic>?,
    enabled: json['enabled'] as bool?,
    name: json['name'] as String?,
  );
}

Map<String, dynamic> _$DomainConfigToJson(DomainConfig instance) =>
    <String, dynamic>{
      'credentials': instance.credentials,
      'enabled': instance.enabled,
      'name': instance.name,
    };

Credentials _$CredentialsFromJson(Map<String, dynamic> json) {
  return Credentials(
    name: json['name'] as String?,
    value: json['value'] as String?,
  );
}

Map<String, dynamic> _$CredentialsToJson(Credentials instance) =>
    <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
    };
