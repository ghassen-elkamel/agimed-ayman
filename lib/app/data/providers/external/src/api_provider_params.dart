part of '../api_provider.dart';

class HttpParamsPostPut extends HttpParams {
  final Map<String, dynamic> body;

  HttpParamsPostPut({
    required super.endpoint,
    super.externalHost,
    super.headers,
    super.queryParam,
    super.isUnderAPI,
    super.authorization,
    super.withLoadingAlert,
    required this.body,
    super.encodeBody,
    super.isFormData,
    super.files,
    super.transformData,
  });
}

class HttpParamsGetDelete extends HttpParams {
  HttpParamsGetDelete({
    required super.endpoint,
    super.externalHost,
    super.headers,
    super.queryParam,
    super.isUnderAPI,
    super.authorization,
    super.withLoadingAlert,
    super.isRefresh,
    super.transformData,
  });
}

class HttpParams {
  final String endpoint;
  final String? externalHost;
  final Map<String, String> headers;
  final Map<String, String?>? queryParam;
  final bool encodeBody;
  final bool isFormData;
  final List<FileInfo> files;

  final String? authorization;
  final bool isUnderAPI;
  final bool withLoadingAlert;
  final bool isRefresh;
  final bool transformData;

  HttpParams({
    required this.endpoint,
    required this.externalHost,
    this.headers = const {},
    required this.queryParam,
    this.isUnderAPI = true,
    this.authorization,
    this.withLoadingAlert = true,
    this.encodeBody = true,
    this.isFormData = false,
    this.files = const [],
    this.isRefresh = false,
    this.transformData = true,
  });
}
