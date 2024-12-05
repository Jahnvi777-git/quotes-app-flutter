import 'package:flutter/material.dart';
import '../screens/quotes_tab.dart';
import '../screens/notes_tab.dart'; // Path to the NotesTab file

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5, // Update the tab count to 5
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple, Colors.deepPurple],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          title: Text(
            'Daily Inspirational Quotes',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          bottom: TabBar(
            isScrollable: true, // Make the TabBar scrollable
            indicatorColor: Colors.yellow,
            indicatorWeight: 4.0,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            labelColor:
                Colors.black, // Set the selected tab text color to black
            unselectedLabelColor:
                Colors.white, // Set the unselected tab text color to white
            tabs: [
              Tab(text: 'Motivational'),
              Tab(text: 'Life'),
              Tab(text: 'Happiness'),
              Tab(icon: Icon(Icons.favorite), text: 'Favorites'),
              Tab(icon: Icon(Icons.note), text: 'Notes'), // Add Notes tab
            ],
          ),
        ),
        body: TabBarView(
          children: [
            QuotesTab(category: 'Motivational'),
            QuotesTab(category: 'Life'),
            QuotesTab(category: 'Happiness'),
            QuotesTab(category: 'Favorites', isFavoritesTab: true),
            NotesTab(), // Add the Notes tab here
          ],
        ),
      ),
    );
  }
}
