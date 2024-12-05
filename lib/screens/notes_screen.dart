import 'package:flutter/material.dart';
import '../data/quotes_data.dart';
import '../models/quote_model.dart';

class NotesScreen extends StatefulWidget {
  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final TextEditingController _noteController = TextEditingController();
  DateTime _currentDate = DateTime.now();
  DateTime? _selectedDate;
  Quote? _selectedQuote;
  List<Quote> _allQuotes = [];

  @override
  void initState() {
    super.initState();
    _allQuotes = [
      ...QuoteData.getQuotesByCategory('Motivational'),
      ...QuoteData.getQuotesByCategory('Life'),
      ...QuoteData.getQuotesByCategory('Happiness'),
    ];
  }

  void _pickDate() async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: _currentDate.add(Duration(days: 1)), // Start from tomorrow
      firstDate:
          _currentDate.add(Duration(days: 1)), // Only allow dates after today
      lastDate: DateTime(2100),
    );
    if (selectedDate != null) {
      setState(() {
        _selectedDate = selectedDate;
      });
    }
  }

  void _saveNote() {
    if (_noteController.text.isNotEmpty &&
        _selectedQuote != null &&
        _selectedDate != null) {
      Navigator.pop(context, {
        'note': _noteController.text,
        'date': _selectedDate!,
        'quote': _selectedQuote!,
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all fields before saving.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Note for Quote'),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Quote:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: DropdownButton<Quote>(
                    value: _selectedQuote,
                    hint: Text('Select a quote'),
                    onChanged: (Quote? newValue) {
                      setState(() {
                        _selectedQuote = newValue;
                      });
                    },
                    items:
                        _allQuotes.map<DropdownMenuItem<Quote>>((Quote quote) {
                      return DropdownMenuItem<Quote>(
                        value: quote,
                        child: Text(quote.text),
                      );
                    }).toList(),
                    isExpanded:
                        true, // Ensure the dropdown takes up available space
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Current Date: ${_currentDate.toLocal().toString().split(' ')[0]}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Select Date:',
              style: TextStyle(fontSize: 16),
            ),
            ElevatedButton(
              onPressed: _pickDate,
              child: Text('Pick Date'),
            ),
            if (_selectedDate != null)
              Text(
                'Selected Date: ${_selectedDate!.toLocal().toString().split(' ')[0]}',
                style: TextStyle(fontSize: 16),
              ),
            SizedBox(height: 20),
            TextField(
              controller: _noteController,
              maxLines: 5,
              decoration: InputDecoration(
                labelText: 'Your Note',
                border: OutlineInputBorder(),
                hintText: 'Write your thoughts here...',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveNote,
              child: Text('Save Note'),
            ),
          ],
        ),
      ),
    );
  }
}
