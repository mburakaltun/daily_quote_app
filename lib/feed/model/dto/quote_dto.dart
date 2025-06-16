class QuoteDto {
  final int id;
  final DateTime createdDate;
  final DateTime updatedDate;
  final bool isActive;
  final String content;
  final String contentTr;
  final String note;
  final String authorName;
  final String quoteCategoryName;
  final String quoteTypeName;
  final String bookTitle;
  final String source;
  final List<String> tagList;

  QuoteDto({
    required this.id,
    required this.createdDate,
    required this.updatedDate,
    required this.isActive,
    required this.content,
    required this.contentTr,
    required this.note,
    required this.authorName,
    required this.quoteCategoryName,
    required this.quoteTypeName,
    required this.bookTitle,
    required this.source,
    required this.tagList,
  });

  factory QuoteDto.fromJson(Map<String, dynamic> json) {
    return QuoteDto(
      id: json['id'],
      createdDate: DateTime.parse(json['createdDate']),
      updatedDate: json['updatedDate'] != null ? DateTime.parse(json['updatedDate']) : DateTime.now(),
      isActive: json['active'],
      content: json['content'] ?? '',
      contentTr: json['contentTr'] ?? '',
      note: json['note'] ?? '',
      authorName: json['authorName'] ?? '',
      quoteCategoryName: json['quoteCategoryName'] ?? '',
      quoteTypeName: json['quoteTypeName'] ?? '',
      bookTitle: json['bookTitle'] ?? '',
      source: json['source'] ?? '',
      tagList: List<String>.from(json['tagList'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdDate': createdDate.toIso8601String(),
      'updatedDate': updatedDate?.toIso8601String() ?? DateTime.now().toIso8601String(),
      'isActive': isActive,
      'content': content,
      'contentTr': contentTr,
      'note': note,
      'authorName': authorName,
      'quoteCategoryName': quoteCategoryName,
      'quoteTypeName': quoteTypeName,
      'bookTitle': bookTitle,
      'source': source,
      'tagList': tagList,
    };
  }
}