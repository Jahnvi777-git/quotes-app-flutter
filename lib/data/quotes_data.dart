import '../models/quote_model.dart';

class QuoteData {
  static List<Quote> favorites = [];

  // Returns a list of Quote objects by category
  static List<Quote> getQuotesByCategory(String category) {
    final quotes = _quotes[category] ?? [];
    return quotes
        .map((q) => Quote(text: q['text']!, author: q['author']!))
        .toList();
  }

  // Map containing quotes categorized by themes
  static final Map<String, List<Map<String, String>>> _quotes = {
    'Motivational': [
      {
        'text': 'Success is not final; failure is not fatal.',
        'author': 'Winston Churchill'
      },
      {
        'text': 'Believe you can and you’re halfway there.',
        'author': 'Theodore Roosevelt'
      },
      {'text': 'Dream big and dare to fail.', 'author': 'Norman Vaughan'},
      {
        'text':
            'Hardships often prepare ordinary people for an extraordinary destiny.',
        'author': 'C.S. Lewis'
      },
      {
        'text': 'Don’t watch the clock; do what it does. Keep going.',
        'author': 'Sam Levenson'
      },
      {
        'text': 'Action is the foundational key to all success.',
        'author': 'Pablo Picasso'
      },
      {
        'text':
            'You are never too old to set another goal or to dream a new dream.',
        'author': 'C.S. Lewis'
      },
      {
        'text':
            'The only limit to our realization of tomorrow is our doubts of today.',
        'author': 'Franklin D. Roosevelt'
      },
      {
        'text': 'Do what you can, with what you have, where you are.',
        'author': 'Theodore Roosevelt'
      },
      {
        'text': 'Act as if what you do makes a difference. It does.',
        'author': 'William James'
      },
      {
        'text':
            'Success usually comes to those who are too busy to be looking for it.',
        'author': 'Henry David Thoreau'
      },
      {
        'text': 'The best way to predict your future is to create it.',
        'author': 'Abraham Lincoln'
      },
      {
        'text': 'Opportunities don’t happen. You create them.',
        'author': 'Chris Grosser'
      },
      {'text': 'Don’t stop until you’re proud.', 'author': 'Anonymous'},
      {
        'text': 'Your limitation—it’s only your imagination.',
        'author': 'Anonymous'
      },
    ],
    'Life': [
      {
        'text': 'Life is what happens when you’re busy making other plans.',
        'author': 'John Lennon'
      },
      {'text': 'Get busy living or get busy dying.', 'author': 'Stephen King'},
      {
        'text': 'You only live once, but if you do it right, once is enough.',
        'author': 'Mae West'
      },
      {
        'text':
            'Life is really simple, but we insist on making it complicated.',
        'author': 'Confucius'
      },
      {
        'text': 'In the middle of every difficulty lies opportunity.',
        'author': 'Albert Einstein'
      },
      {
        'text':
            'Do not dwell in the past, do not dream of the future, concentrate the mind on the present moment.',
        'author': 'Buddha'
      },
      {
        'text': 'The purpose of life is not to be happy. It is to be useful.',
        'author': 'Ralph Waldo Emerson'
      },
      {'text': 'Turn your wounds into wisdom.', 'author': 'Oprah Winfrey'},
      {
        'text': 'The only impossible journey is the one you never begin.',
        'author': 'Tony Robbins'
      },
      {
        'text':
            'Good friends, good books, and a sleepy conscience: this is the ideal life.',
        'author': 'Mark Twain'
      },
      {
        'text':
            'Life isn’t about finding yourself. It’s about creating yourself.',
        'author': 'George Bernard Shaw'
      },
      {
        'text':
            'The biggest adventure you can take is to live the life of your dreams.',
        'author': 'Oprah Winfrey'
      },
      {
        'text':
            'What lies behind us and what lies before us are tiny matters compared to what lies within us.',
        'author': 'Ralph Waldo Emerson'
      },
      {
        'text':
            'Life is a succession of lessons which must be lived to be understood.',
        'author': 'Ralph Waldo Emerson'
      },
      {'text': 'Keep calm and carry on.', 'author': 'Winston Churchill'},
    ],
    'Happiness': [
      {
        'text': 'Happiness is not something ready made.',
        'author': 'Dalai Lama'
      },
      {
        'text':
            'For every minute you are angry you lose 60 seconds of happiness.',
        'author': 'Ralph Waldo Emerson'
      },
      {'text': 'Happiness depends upon ourselves.', 'author': 'Aristotle'},
      {
        'text':
            'The most important thing is to enjoy your life—to be happy—it’s all that matters.',
        'author': 'Audrey Hepburn'
      },
      {
        'text':
            'Happiness is when what you think, what you say, and what you do are in harmony.',
        'author': 'Mahatma Gandhi'
      },
      {
        'text': 'Happiness is not by chance, but by choice.',
        'author': 'Jim Rohn'
      },
      {
        'text':
            'The secret of happiness is not in doing what one likes, but in liking what one does.',
        'author': 'James M. Barrie'
      },
      {
        'text':
            'The best way to cheer yourself is to try to cheer someone else up.',
        'author': 'Mark Twain'
      },
      {
        'text': 'Happiness is only real when shared.',
        'author': 'Christopher McCandless'
      },
      {
        'text':
            'Success is getting what you want. Happiness is wanting what you get.',
        'author': 'Dale Carnegie'
      },
      {
        'text':
            'Happiness lies in the joy of achievement and the thrill of creative effort.',
        'author': 'Franklin D. Roosevelt'
      },
      {
        'text':
            'Happiness often sneaks in through a door you didn’t know you left open.',
        'author': 'John Barrymore'
      },
      {
        'text': 'Happiness is a direction, not a place.',
        'author': 'Sydney J. Harris'
      },
      {
        'text':
            'There is only one happiness in this life, to love and be loved.',
        'author': 'George Sand'
      },
      {
        'text':
            'Count your age by friends, not years. Count your life by smiles, not tears.',
        'author': 'John Lennon'
      },
    ],
  };
}
