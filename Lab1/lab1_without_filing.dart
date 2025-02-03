void main() {
  print("21k-4578 Syeda Samaha Batool Rizvi \nLab 1\n");
 // i couldn't run dart in my system locally so instead of filing created a string array
  Solution obj = Solution();
  obj.analyzeLines();
  obj.calculateLineWithHighestFrequency();
  obj.printHighestWordFrequencyAcrossLines();
}

class Solution {
  
  // string array
  List<String> lines = [
    "This is a really really really cool experiment really",
    "Cute little experiment",
    "Will it work maybe it will work do you think it will it will"
  ];

  Map<int, Map<String, int>> lineWordFrequencies = {};
  Map<int, List<String>> highestWordsPerLine = {};
  Map<int, int> highestFrequencyPerLine = {};
  int maxFrequency = 0;

  void analyzeLines() {
    for (int i = 0; i < lines.length; i++) {
      String line = lines[i].toLowerCase(); // to lower case
      List<String> words = line.split(" ");// split sentences into words

      if (words.isEmpty) continue;

      Map<String, int> wordCount = {};
      for (String word in words) {
        wordCount[word] = (wordCount[word] ?? 0) + 1; // make key value pairs of words in dict
      }
      lineWordFrequencies[i + 1] = wordCount;

      // int highestFrequency = wordCount.values.reduce((a, b) => a > b ? a : b);
      int highestFrequency = 0;
      for (int frequency in wordCount.values) {
        if (frequency > highestFrequency) {
          highestFrequency = frequency;
        }
      }
      List<String> highestWords = wordCount.entries
          .where((entry) => entry.value == highestFrequency)
          .map((entry) => entry.key)
          .toList();

      highestWordsPerLine[i + 1] = highestWords;
      highestFrequencyPerLine[i + 1] = highestFrequency;
      if (highestFrequency > maxFrequency) {
        maxFrequency = highestFrequency;
      }
    }
  }

  void calculateLineWithHighestFrequency() {
    maxFrequency = 0;
    for (int frequency in highestFrequencyPerLine.values) {
      if (frequency > maxFrequency) {
      maxFrequency = frequency;
      }
    }
  }

  void printHighestWordFrequencyAcrossLines() {
    print("The following words have the highest word frequency per line:");
    highestWordsPerLine.forEach((i, words) {
      int frequency = highestFrequencyPerLine[i]!;
      print("$words (appears in line #$i -----> frequency $frequency)");
    });

    print("\nLines with the greatest highest frequency words:");
    highestFrequencyPerLine.forEach((i, frequency) {
      if (frequency == maxFrequency) {
        print("Line #$i (Highest frequency: $maxFrequency)");
      }
    });
  }
}
