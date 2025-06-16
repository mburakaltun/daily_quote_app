import 'package:daily_quote_app/common/service/api_service.dart';
import '../model/endpoint/quote_endpoints.dart';
import '../model/request/request_get_all_quotes.dart';
import '../model/response/response_get_all_quotes.dart';

class QuoteService {
  final _apiService = ApiService();

  Future<ResponseGetAllQuotes> getAllQuotes(RequestGetAllQuotes request) async {
    final params = {
      'page': request.page,
      'size': request.size,
    };

    final responseData = await _apiService.get(
      endpoint: QuoteEndpoints.getAllQuotes,
      params: params,
    );

    return ResponseGetAllQuotes.fromJson(responseData!);
  }
}