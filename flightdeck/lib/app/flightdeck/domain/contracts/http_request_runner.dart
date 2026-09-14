import 'package:flightdeck/app/flightdeck/domain/entities/http_document.dart';
import 'package:flightdeck/app/flightdeck/domain/entities/http_response_result.dart';
import 'package:flightdeck/app/flightdeck/domain/exceptions/http_request_error.dart';
import 'package:flightdeck/app/core/domain/result.dart';

/// Executa um request de um arquivo `.http`. Motor único da aba e da CLI
/// (`flightdeck http run`), como o `DbQueryService` é para o `.dbq`.
abstract class HttpRequestRunner {
  /// Dispara [spec] **já interpolado**. [baseDir] é a pasta do arquivo `.http`,
  /// usada para resolver `< ./body.json`.
  Future<Result<HttpResponseResult, HttpRequestError>> send(
    HttpRequestSpec spec, {
    required String baseDir,
    Duration timeout,
    bool followRedirects,
  });
}
