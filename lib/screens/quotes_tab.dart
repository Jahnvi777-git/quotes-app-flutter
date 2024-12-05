import 'package:flutter/material.dart';
import '../data/quotes_data.dart';
import '../models/quote_model.dart';
import '../widgets/quote_card.dart';

class QuotesTab extends StatefulWidget {
  final String category;
  final bool isFavoritesTab;

  QuotesTab({required this.category, this.isFavoritesTab = false});

  @override
  _QuotesTabState createState() => _QuotesTabState();
}

class _QuotesTabState extends State<QuotesTab> {
  late List<Quote> displayedQuotes;

  @override
  void initState() {
    super.initState();
    // Display the correct quotes based on the tab
    displayedQuotes = widget.isFavoritesTab
        ? QuoteData.favorites
        : QuoteData.getQuotesByCategory(widget.category);
  }

  void toggleFavorite(Quote quote) {
    setState(() {
      if (QuoteData.favorites.contains(quote)) {
        QuoteData.favorites.remove(quote);
      } else {
        QuoteData.favorites.add(quote);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.purple[100]!, Colors.purple[300]!],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: displayedQuotes.isEmpty
          ? Center(
              child: Text(
                widget.isFavoritesTab
                    ? "No favorites yet!"
                    : "No quotes available!",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            )
          : ListView.builder(
              itemCount: displayedQuotes.length,
              itemBuilder: (context, index) {
                return QuoteCard(
                  quote: displayedQuotes[index],
                  onFavoriteToggle: () =>
                      toggleFavorite(displayedQuotes[index]),
                  isFavorite:
                      QuoteData.favorites.contains(displayedQuotes[index]),
                );
              },
            ),
    );
  }
}
