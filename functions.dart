/**
 * soal 1 - fibonacci
 */
List<int> myFibo(int number) {
  if (number <= 0) return [0];
  int a = 0;
  int b = 1;
  List<int> result = [a, b];
  for (int i = 0; i < number - 1; i++) {
    int c = a + b;
    a = b;
    b = c;
    result.add(c);
  }
  return result;
}

/**
 * soal 2 - palindrom
 */
bool isPolindrom(String text) {
  String validatedText = text.replaceAll(RegExp(r'\W'), '').toLowerCase();
  return validatedText.split('').reversed.join('') == validatedText;
}

/**
 * soal 3 - asc sorting
 */
List<int> ascSort(List<int> nums) {
  nums.sort();
  return nums;
}

/**
 * soal 4 - anagram
 */
Map<String, List<String>> myAnagram(List<String> words) {
  Map<String, List<String>> anagram = {};
  for (int i = 0; i < words.length; i++) {
    String word = words[i];
    List<String> splitWord = word.split('');
    splitWord.sort();
    String sortedWord = splitWord.join('');

    if (anagram[sortedWord] != null) {
      anagram[sortedWord]!.add(word);
    } else {
      anagram[sortedWord] = [word];
    }
  }

  return anagram;
}
