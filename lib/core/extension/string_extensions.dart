const basePng = 'assets/pngs/';
const baseJpg = 'assets/jpeg/';
const baseSvg = 'assets/svgs/';

extension StringExtensions on String {
  String get png => '$basePng$this.png';

  String get jpg => '$baseJpg$this.jpg';
  String capitalizeFirstWord() {
    if (trim().isEmpty) return this;

    final words = split(' ');
    if (words.isEmpty) return this;

    final firstWord = words.first;
    final capitalizedFirstWord =
        '${firstWord[0].toUpperCase()}${firstWord.substring(1)}';

    return [capitalizedFirstWord, ...words.skip(1)].join(' ');
  }
  String get svg => '$baseSvg$this.svg';
}
