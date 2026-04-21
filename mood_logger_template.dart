/// Week 3 Individual Assignment -- CLI Mood Logger (TEMPLATE)
///
/// Build a command-line mood tracking application.
/// Implement all the TODO sections below.
///
/// Run with: dart run mood_logger_template.dart
///
/// Requirements:
///   - MoodEntry class to represent a single mood log
///   - MoodLogger class to manage a collection of entries
///   - Interactive CLI with a menu loop
///
/// Do NOT use AI tools. Write all code yourself.

import 'dart:io';

// ============================================================================
// MoodEntry Class
// ============================================================================

/// Represents a single mood log entry.
///
/// Fields:
///   - DateTime timestamp  -- when the entry was create
///   - int score           -- mood score from 1 (very bad) to 10 (excellent)
///   - String note         -- a short description of the mood
class MoodEntry {
  DateTime timestamp;
  int score;
  String note;
  // TODO: declare fields (timestamp, score, note)

  // TODO: create a constructor that takes score and note,
  //       and sets timestamp to DateTime.now()
  MoodEntry(this.score, this.note) : timestamp = DateTime.now();

  /// Returns a formatted string representation of this entry.
  /// Format: "[YYYY-MM-DD HH:MM] Score: <score>/10 - <note>"
  ///
  /// Example: "[2026-02-22 14:30] Score: 7/10 - Productive day at the lab"
  @override
  String toString() {
    // TODO: implement
    String year = timestamp.year.toString();
    String month = timestamp.month.toString().padLeft(2, '0');
    String day = timestamp.day.toString().padLeft(2, '0');
    String hour = timestamp.hour.toString().padLeft(2, '0');
    String minute = timestamp.minute.toString().padLeft(2, '0');
    // Hint: use timestamp.year, .month, .day, .hour, .minute
    //       and .toString().padLeft(2, '0') to format with leading zeros
    return '[$year-$month-$day $hour:$minute] Score: $score/10 - $note';
  }
}

// ============================================================================
// MoodLogger Class
// ============================================================================

/// Manages a collection of MoodEntry objects.
class MoodLogger {
  // TODO: declare a private list to store MoodEntry objects
  final List<MoodEntry> _entries = [];
  // Hint: final List<MoodEntry> _entries = [];

  /// Adds a new mood entry with the given score and note.
  ///
  /// Validates that score is between 1 and 10 (inclusive).
  /// If invalid, prints an error message and does NOT add the entry.
  void addEntry(int score, String note) {
    // TODO: validate score (1-10), create MoodEntry, add to list
    if( score < 1 || score > 10) {
      print('Error: Score should be between 1 and 10');
      return;
    }
    _entries.add(MoodEntry(score, note));
    print('Entry added');
  }

  /// Returns a copy of all entries.
  List<MoodEntry> getAllEntries() {
    // TODO: return a copy of the entries list
    // Hint: return List.from(_entries);
    return List.from(_entries); 
  }

  /// Calculates and returns the average mood score.
  ///
  /// Returns 0.0 if there are no entries.
  double getAverageScore() {
    if(_entries.isEmpty) {
      return 0.0;
    }
    int count = _entries.length;
     double average = _entries.fold(0.0, (sum, entry) => sum + entry.score) / count;
     return average;
    // TODO: implement
    // Hint: use fold() to sum scores, then divide by length
  }

  /// Returns all entries with a score greater than or equal to [threshold].
  List<MoodEntry> getEntriesAbove(int threshold) {
    // TODO: implement using .where()
    return _entries.where((entry) => entry.score >= threshold).toList();
  }

  /// Returns the total number of entries.
  int get entryCount {
    // TODO: implement
    return _entries.length;
  }
}

// ============================================================================
// Main -- Interactive CLI
// ============================================================================

void main() {
  final logger = MoodLogger();

  print('=== Mood Logger ===');
  print('Track your daily mood on a scale of 1-10.\n');

  // TODO: implement a loop that displays a menu and handles user input.
  //
  // Menu options:
  //   1. Add mood entry
  //   2. View all entries
  //   3. View average mood
  //   4. Filter by minimum score
  //   5. Quit
  //
  // Use stdin.readLineSync() to read user input.
  // Use int.tryParse() to safely convert string input to int.
  //
  // Skeleton:
  //
  // bool running = true;
  bool running = true;
  // while (running) {
  while (running) {
  //   print('1. Add mood entry');
  print('1. Add mood entry');
  //   print('2. View all entries');
  print('2. View all entries');
  //   print('3. View average mood');
  print('3. View average mood');
  //   print('4. Filter by minimum score');
  print('4. Filter by minimum score');
  //   print('5. Quit');
  print('5. Quit');
  //   stdout.write('\nChoose an option: ');
  stdout.write('\nChoose an option: ');
  //
  //   String? input = stdin.readLineSync();
  String? input = stdin.readLineSync();
  //   int? choice = int.tryParse(input ?? '');
  int? choice = int.tryParse(input ?? '');
  //
  //   switch (choice) {
  switch (choice) {
  //     case 1:
  case 1:
  stdout.write('Enter mood score (1-10): ');
  String? scoreInput = stdin.readLineSync();
  int? score = int.tryParse(scoreInput ?? '');
  if(score == null) {
    print('Error: Score have to be number between 1 and 10');
    break;
  }
  stdout.write('Enter a note: ');
  String note = stdin.readLineSync() ?? '';
  logger.addEntry(score, note);
  break;
  //       // TODO: prompt for score and note, call logger.addEntry()
  //       break;
  //     case 2:
  case 2:
  var entries = logger.getAllEntries();
  if(entries.isEmpty) {
    print('No entries yet');
  } else {
    print('All entries:');
    for(var entry in entries) {
      print(entry);
    }
  }
  break;
  //       // TODO: get all entries, print each one (or "No entries yet.")
  //       break;
  //     case 3:
  case 3:
  double average = logger.getAverageScore();
  print('Average mood score: $average');
  break;
  //       // TODO: print the average score (or message if no entries)
  //       break;
  //     case 4:
  case 4:
  //       // TODO: prompt for threshold, get filtered entries, print them
  stdout.write('Enter minimum score threshold: ');
  String? thresholdInput = stdin.readLineSync();
  int? threshold = int.tryParse(thresholdInput ?? '');
  if(threshold == null) {
    print('Error: Threshold have to be number between 1 and 10');
    break;
  }
  var filtered = logger.getEntriesAbove(threshold);
  if(filtered.isEmpty) {
    print('No entries with score >= $threshold');
  } else {
    print('Entries with score >= $threshold:');
    for(var entry in filtered) {
      print(entry);
    }
  }
  break;
  //       break;
  //     case 5:
  case 5:
  running = false;
  print('Goodbye!');
  break;
  //       running = false;
  //       print('Goodbye!');
  //       break;
  //     default:
  default:
  print('Error: Invalid option. Please choose 1-5.');
  break;
  //       print('Invalid option. Please choose 1-5.');
  //   }
  //   print('');
  print('');
  }
