import 'package:campus_gateway/models/news_model.dart';
import 'package:campus_gateway/news_service.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';


class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  late Future<List<NewsArticle>> _newsArticles;
  List<bool> likedArticles = [];

  @override
  void initState() {
    super.initState();
    _newsArticles = NewsService().fetchTopHeadlines();
    _newsArticles.then((articles) {
      likedArticles = List<bool>.filled(articles.length, false);
    });
  }

  void toggleLike(int index) {
    setState(() {
      likedArticles[index] = !likedArticles[index];
    });
  }

  void shareArticle(String title, String url) {
    Share.share('Check out this news: $title\n$url');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News')
      ),
      body: FutureBuilder<List<NewsArticle>>(
        future: _newsArticles,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No news available'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final article = snapshot.data![index];
                return NewsItem(
                  image: article.urlToImage ?? '',
                  title: article.title ?? 'No Title',
                  description: article.description ?? 'No Description',
                  url: article.url ?? '',
                  isLiked: likedArticles[index],
                  onLike: () => toggleLike(index),
                  onShare: () => shareArticle(
                      article.title ?? 'No Title', article.url ?? ''),
                );
              },
            );
          }
        },
      ),
    );
  }
}

class NewsItem extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final String url;
  final bool isLiked;
  final VoidCallback onLike;
  final VoidCallback onShare;

  NewsItem({
    required this.image,
    required this.title,
    required this.description,
    required this.url,
    required this.isLiked,
    required this.onLike,
    required this.onShare,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          image.isNotEmpty
              ? Image.network(image)
              : Container(
                  height: 200,
                  color: Colors.grey[200],
                  child: Center(child: Text('No Image')),
                ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(description),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ElevatedButton.icon(
                onPressed: onLike,
                icon: Icon(isLiked ? Icons.thumb_up : Icons.thumb_up_off_alt),
                label: Text('Like'),
              ),
              ElevatedButton.icon(
                onPressed: onShare,
                icon: Icon(Icons.share),
                label: Text('Share'),
              ),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}
