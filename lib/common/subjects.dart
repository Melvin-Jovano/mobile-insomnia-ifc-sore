class Subject {
  void Function()? cb;
  String week;
  String title;

  Subject({
    this.cb,
    required this.week,
    required this.title,
  });
}

final List<Subject> subjects = [
  Subject(
    week: 'Minggu 1',
    title: 'Instalasi, Flutter widget (statefull, stateless), scaffold, text, icon, image'
  ),
  Subject(
    week: 'Minggu 2',
    title: 'Grid, Column, Row, Container dan Navigator'
  ),
  Subject(
    week: 'Minggu 3',
    title: 'Button & Textfield'
  ),
  Subject(
    week: 'Minggu 4',
    title: 'setState vs Provider'
  ),
  Subject(
    week: 'Minggu 5',
    title: 'CheckBox, RadioButtons, Chips'
  ),
  Subject(
    week: 'Minggu 6',
    title: 'Switches dan Dropdown Buttons'
  ),
  Subject(
    week: 'Minggu 7',
    title: 'AppBars, FAB dan ButtonNavigation'
  ),
];