import 'package:daily_quote_app/common/model/request/pageable_request.dart';

class RequestGetAllQuotes extends PageableRequest {
  RequestGetAllQuotes({
    required super.page,
    required super.size,
  });

  factory RequestGetAllQuotes.fromJson(Map<String, dynamic> json) {
    return RequestGetAllQuotes(
      page: json['page'],
      size: json['size'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'size': size,
    };
  }
}