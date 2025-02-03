void main() {
  print("21k-4578 Syeda Samaha Batool Rizvi \nLab 1\n");
  
  // this one is without filing because i couldn't run dart on my system locally.
  Solution obj = Solution();
  obj.analyzeLines();
  obj.calculateLineWithHighestFrequency();
  obj.printHighestWordFrequencyAcrossLines();
}


// solution class
class Solution {
  List<String> lines = [
    "This is a really really really cool experiment really",
    "Cute little experiment",
    "Will it work maybe it will work do you think it will it will"
  ];

  Map<int, Map<String, int>> lineWordFrequencies = {}; // word counts
  Map<int, List<String>> highestWordsPerLine = {}; // Highest frequency words
  Map<int, int> highestFrequencyPerLine = {}; // Highest frequency 
  int maxFrequency = 0; // Max frequency

  void analyzeLines() {
    for (int lineNum = 0; lineNum < lines.length; lineNum++) {
      String line = lines[lineNum].toLowerCase(); // Convert to lowercase 
      List<String> words = _splitWords(line); // Split into words

      if (words.isEmpty) continue; // Skip empty lines

      Map<String, int> wordCount = _countWordFrequency(words); 
      lineWordFrequencies[lineNum + 1] = wordCount; 

      int highestFrequency = _findMaxFrequency(wordCount); 
      List<String> highestWords = _findHighestWords(wordCount, highestFrequency);

      highestWordsPerLine[lineNum + 1] = highestWords;
      highestFrequencyPerLine[lineNum + 1] = highestFrequency;
      if (highestFrequency > maxFrequency) {
        maxFrequency = highestFrequency;
      }
    }
  }

  void calculateLineWithHighestFrequency() {
    // Finds the max frequency among all lines
    maxFrequency = 0;
    for (var frequency in highestFrequencyPerLine.values) {
      if (frequency > maxFrequency) {
        maxFrequency = frequency;
      }
    }
  }

  void printHighestWordFrequencyAcrossLines() {
    print("The following words have the highest word frequency per line:");
    highestWordsPerLine.forEach((lineNum, words) {
      print("$words (appears in line $lineNum)");
    });

    print("\nLines with the greatest highest frequency words:");
    highestFrequencyPerLine.forEach((lineNum, frequency) {
      if (frequency == maxFrequency) {
        print("Line $lineNum (Highest frequency: $maxFrequency)");
      }
    });
  }

  //split words
  List<String> _splitWords(String line) {
    List<String> words = [];
    String word = "";
    for (int i = 0; i < line.length; i++) {
      if (_isLetter(line[i])) {
        word += line[i];
      } else if (word.isNotEmpty) {
        words.add(word);
        word = "";
      }
    }
    if (word.isNotEmpty) words.add(word); // Add last word
    return words;
  }

  bool _isLetter(String char) {
    return (char.codeUnitAt(0) >= 97 && char.codeUnitAt(0) <= 122); // a-z ASCII
  }
// count word frequecy
  Map<String, int> _countWordFrequency(List<String> words) {
    Map<String, int> wordCount = {};
    for (String word in words) {
      if (!wordCount.containsKey(word)) {
        wordCount[word] = 1;
      } else {
        wordCount[word] = wordCount[word]! + 1;
      }
    }
    return wordCount;
  }
// find max frequncy
  int _findMaxFrequency(Map<String, int> wordCount) {
    int maxFreq = 0;
    for (int count in wordCount.values) {
      if (count > maxFreq) {
        maxFreq = count;
      }
    }
    return maxFreq;
  }
// highest frequency words
  List<String> _findHighestWords(Map<String, int> wordCount, int maxFreq) {
    List<String> highestWords = [];
    for (var entry in wordCount.entries) {
      if (entry.value == maxFreq) {
        highestWords.add(entry.key);
      }
    }
    return highestWords;
  }
}
