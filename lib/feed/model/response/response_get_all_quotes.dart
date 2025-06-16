import 'package:daily_quote_app/common/model/response/pageable_response.dart';
import 'package:daily_quote_app/feed/model/dto/quote_dto.dart';

class ResponseGetAllQuotes extends PageableResponse {
  final List<QuoteDto> quoteDtoList;

  ResponseGetAllQuotes({
    super.totalElements,
    super.totalPages,
    super.isLast,
    required this.quoteDtoList,
  });

  factory ResponseGetAllQuotes.fromJson(Map<String, dynamic> json) {
    final pageableResponse = PageableResponse.fromJson(json);

    return ResponseGetAllQuotes(
      totalElements: pageableResponse.totalElements,
      totalPages: pageableResponse.totalPages,
      isLast: pageableResponse.isLast,
      quoteDtoList: (json['quoteDtoList'] as List)
          .map((itemJson) => QuoteDto.fromJson(itemJson as Map<String, dynamic>))
          .toList(),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = super.toJson();
    json['quoteDtoList'] = quoteDtoList.map((item) => item.toJson()).toList();
    return json;
  }
}