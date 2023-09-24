List<String> exceptions = [
  'a',
  'about',
  'an',
  'as',
  'at',
  'but',
  'by',
  'for',
  'from',
  'in',
  'into',
  'of',
  'off',
  'on',
  'onto',
  'out',
  'per',
  'than',
  'to',
  'under',
  'until',
  'unto',
  'up',
  'upon',
  'via',
  'vice',
  'with',
  'the',
  'and',
  'nor',
  'or',
  'yet',
  'so'
];

extension TitleCase on String {
  String toTitleCase() {
    return toLowerCase().replaceAllMapped(
        RegExp(
            r'[A-Z]{2,}(?=[A-Z][a-z]+[0-9]*|\b)|[A-Z]?[a-z]+[0-9]*|[A-Z]|[0-9]+'),
        (Match match) {
      if (exceptions.contains(match[0])) {
        return match[0]!;
      }
      return "${match[0]![0].toUpperCase()}${match[0]!.substring(1).toLowerCase()}";
    }).replaceAll(RegExp(r'(_|-)+'), ' ');
  }
}
