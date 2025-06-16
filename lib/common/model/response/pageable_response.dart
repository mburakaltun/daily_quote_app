class PageableResponse {
  final int? totalElements;
  final int? totalPages;
  final bool? isLast;

  PageableResponse({
    this.totalElements,
    this.totalPages,
    this.isLast,
  });

  factory PageableResponse.fromJson(Map<String, dynamic> json) {
    return PageableResponse(
      totalElements: json['totalElements'] as int?,
      totalPages: json['totalPages'] as int?,
      isLast: json['isLast'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'totalElements': totalElements,
      'totalPages': totalPages,
      'isLast': isLast,
    };
  }
}