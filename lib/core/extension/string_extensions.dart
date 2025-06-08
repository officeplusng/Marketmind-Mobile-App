const basePng = 'assets/pngs/';
const baseJpg = 'assets/jpeg/';
const baseSvg = 'assets/svgs/';

extension StringExtensions on String {
  String get png => '$basePng$this.png';

  String get jpg => '$baseJpg$this.jpg';

  String get svg => '$baseSvg$this.svg';
}
