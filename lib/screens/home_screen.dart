import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_shortener/providers/url_provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final urlProvider = Provider.of<UrlProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('URL Shortener'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter long URL',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            urlProvider.isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () {
                      if (_controller.text.isNotEmpty) {
                        urlProvider.shortenUrl(_controller.text);
                      }
                    },
                    child: Text('Shorten URL'),
                  ),
            SizedBox(height: 16),
            if (urlProvider.shortUrl != null)
              Column(
                children: [
                  Text('Short URL:'),
                  SizedBox(height: 8),
                  SelectableText(
                    urlProvider.shortUrl!,
                    style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
