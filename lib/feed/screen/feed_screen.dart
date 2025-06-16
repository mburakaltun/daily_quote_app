import 'package:daily_quote_app/common/extension/localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../common/utility/language_utility.dart';
import '../model/dto/quote_dto.dart';
import '../model/request/request_get_all_quotes.dart';
import '../service/quote_service.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  final _quoteService = QuoteService();
  final PageController _pageController = PageController();
  final List<QuoteDto> _quotes = [];

  bool _isLoading = false;
  bool _hasError = false;
  bool _hasReachedEnd = false;
  String _currentLanguage = 'en';

  int _currentPage = 0;

  static const int _prefetchThreshold = 3;
  static const int _initialPageSize = 10;
  static const int _pageSize = 5;

  @override
  void initState() {
    super.initState();
    _initLanguage();
    _loadInitialQuotes();
  }

  Future<void> _initLanguage() async {
    _currentLanguage = await LanguageHelper.getLanguage();
  }

  Future<void> _loadInitialQuotes() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
      _hasError = false;
    });

    try {
      final request = RequestGetAllQuotes(page: 0, size: _initialPageSize);
      final response = await _quoteService.getAllQuotes(request);

      setState(() {
        _quotes.addAll(response.quoteDtoList);
        _hasReachedEnd = response.isLast!;
        _isLoading = false;
        _currentPage = 1;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _hasError = true;
      });
    }
  }

  Future<void> _loadMoreQuotes() async {
    if (_isLoading || _hasReachedEnd) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final request = RequestGetAllQuotes(page: _currentPage, size: _pageSize);
      final response = await _quoteService.getAllQuotes(request);

      setState(() {
        _quotes.addAll(response.quoteDtoList);
        _hasReachedEnd = response.isLast!;
        _isLoading = false;
        _currentPage++;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _onPageChanged(int index) {
    if (index >= _quotes.length - _prefetchThreshold && !_hasReachedEnd && !_isLoading) {
      _loadMoreQuotes();
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_hasError && _quotes.isEmpty) {
      return _buildErrorState();
    }

    if (_isLoading && _quotes.isEmpty) {
      return _buildLoadingState();
    }

    return PageView.builder(
      scrollDirection: Axis.vertical,
      controller: _pageController,
      onPageChanged: _onPageChanged,
      itemCount: _quotes.length,
      itemBuilder: (context, index) {
        return _buildQuoteCard(_quotes[index], index < _quotes.length - 1);
      },
    );
  }

  Widget _buildQuoteCard(QuoteDto quote, bool showDivider) {
    final String displayText = _currentLanguage == 'tr' && quote.contentTr.isNotEmpty
        ? quote.contentTr
        : quote.content;

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.format_quote,
                    color: Theme.of(context).primaryColor.withOpacity(0.7),
                    size: 40,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    displayText,
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      height: 1.4,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    "- ${quote.authorName}",
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodyMedium?.color,
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            left: 0,
            right: 0,
            bottom: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildActionButton(Icons.favorite_border, context.message.feedLike),
                const SizedBox(width: 24),
                _buildActionButton(Icons.bookmark_border, context.message.feedSave),
                const SizedBox(width: 24),
                _buildActionButton(Icons.share, context.message.feedShare),
              ],
            ),
          ),

          if (showDivider)
            Positioned(
              left: 32,
              right: 32,
              bottom: 10,
              child: Container(
                height: 1,
                decoration: BoxDecoration(
                  color: Theme.of(context).dividerColor.withOpacity(0.3),
                ),
              ),
            ),

          Positioned(
            left: 0,
            right: 0,
            bottom: 100,
            child: Center(
              child: Icon(
                Icons.keyboard_arrow_down,
                color: Theme.of(context).hintColor.withOpacity(0.7),
                size: 36,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return InkWell(
      onTap: () {
        // Implement actions later
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: Theme.of(context).primaryColor,
            size: 28,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyMedium?.color,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(color: Theme.of(context).primaryColor),
          const SizedBox(height: 24),
          Text(
            context.message.feedLoading,
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 64, color: Colors.redAccent.withOpacity(0.8)),
          const SizedBox(height: 16),
          Text(
            context.message.feedLoadError,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: _loadInitialQuotes,
            icon: const Icon(Icons.refresh),
            label: Text(context.message.generalTryAgain),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ],
      ),
    );
  }
}