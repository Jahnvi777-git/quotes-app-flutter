import 'package:flutter/material.dart';
import '../models/quote_model.dart';

class QuoteCard extends StatelessWidget {
  final Quote quote;
  final VoidCallback onFavoriteToggle;
  final bool isFavorite;

  QuoteCard({
    required this.quote,
    required this.onFavoriteToggle,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Text(
          quote.text,
          style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
        ),
        subtitle: Text('- ${quote.author}', style: TextStyle(fontSize: 16)),
        trailing: IconButton(
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? Colors.red : Colors.grey,
          ),
          onPressed: onFavoriteToggle,
        ),
      ),
    );
  }
}
