import 'package:daily_quote_app/common/extension/localization_extension.dart';
import 'package:flutter/material.dart';

import '../../common/utility/language_utility.dart';
import '../../main.dart';

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({super.key});

  @override
  State<LanguageSelectionScreen> createState() => _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String _selectedLang = 'en';
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadLanguage();
  }

  Future<void> _loadLanguage() async {
    setState(() => _isLoading = true);
    final lang = await LanguageHelper.getLanguage();
    setState(() {
      _selectedLang = lang;
      _isLoading = false;
    });
  }

  Future<void> _onLanguageSelected(String lang) async {
    setState(() => _isLoading = true);
    await LanguageHelper.setLanguage(lang);
    setState(() {
      _selectedLang = lang;
      _isLoading = false;
    });
    if (context.mounted) {
      DailyQuoteApp.setLocale(context, Locale(lang));
    }
  }

  Widget _buildLanguageOption({required String title, required String languageKey, required String flagEmoji}) {
    final isSelected = _selectedLang == languageKey;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: isSelected ? 2 : 0.5,
      color: isSelected ? Theme.of(context).primaryColor.withOpacity(0.1) : null,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => _onLanguageSelected(languageKey),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Row(
            children: [
              Text(flagEmoji, style: const TextStyle(fontSize: 24)),
              const SizedBox(width: 16),
              Expanded(
                child: Text(title, style: TextStyle(fontSize: 16, fontWeight: isSelected ? FontWeight.bold : FontWeight.normal)),
              ),
              if (isSelected)
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(shape: BoxShape.circle, color: Theme.of(context).secondaryHeaderColor),
                  child: const Icon(Icons.check, color: Colors.white, size: 16),
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Row(
          children: [
            Icon(Icons.language, color: Theme.of(context).primaryColor, size: 24),
            const SizedBox(width: 8),
            Text(
              context.message.languageSelectionTitle,
              style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).textTheme.titleLarge?.color),
            ),
          ],
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Theme.of(context).primaryColor),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    children: [
                      _buildLanguageOption(
                        title: context.message.languageSelectionEnglish,
                        languageKey: context.message.languageSelectionEnglishKey,
                        flagEmoji: context.message.languageSelectionEnglishFlagEmojiKey,
                      ),
                      _buildLanguageOption(
                        title: context.message.languageSelectionTurkish,
                        languageKey: context.message.languageSelectionTurkishKey,
                        flagEmoji: context.message.languageSelectionTurkishFlagEmojiKey,
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
