import 'package:flutter/foundation.dart';
import 'package:url_shortener/services/url_shortener_service.dart';

class UrlProvider with ChangeNotifier {
  final UrlShortenerService _urlShortenerService = UrlShortenerService();

  String? _shortUrl;
  bool _isLoading = false;

  String? get shortUrl => _shortUrl;
  bool get isLoading => _isLoading;

  Future<void> shortenUrl(String longUrl) async {
    _isLoading = true;
    notifyListeners();

    _shortUrl = await _urlShortenerService.shortenUrl(longUrl);

    _isLoading = false;
    notifyListeners();
  }
}
