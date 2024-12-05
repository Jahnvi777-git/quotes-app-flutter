import 'package:flutter/material.dart';
import 'notes_screen.dart';
import '../models/quote_model.dart';

class NotesTab extends StatefulWidget {
  @override
  _NotesTabState createState() => _NotesTabState();
}

class _NotesTabState extends State<NotesTab> {
  List<String> notes = []; // Store the notes here
  List<DateTime> noteDates = []; // Store the dates here
  List<Quote> noteQuotes = []; // Store the quotes here

  void addNote(String note, DateTime date, Quote quote) {
    setState(() {
      notes.add(note);
      noteDates.add(date);
      noteQuotes.add(quote);
    });
  }

  void deleteNote(int index) {
    setState(() {
      notes.removeAt(index);
      noteDates.removeAt(index);
      noteQuotes.removeAt(index);
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
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotesScreen(),
                  ),
                );
                if (result != null) {
                  addNote(result['note'], result['date'], result['quote']);
                }
              },
              child: Text('Add Note'),
            ),
          ),
          Expanded(
            child: notes.isEmpty
                ? Center(
                    child: Text(
                      'No notes yet!',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  )
                : ListView.builder(
                    itemCount: notes.length,
                    itemBuilder: (context, index) => Card(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: ListTile(
                        title: Text(notes[index]),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Quote: ${noteQuotes[index].text}'),
                            Text(
                                'Date: ${noteDates[index].toLocal().toString().split(' ')[0]}'),
                          ],
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () => deleteNote(index),
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
