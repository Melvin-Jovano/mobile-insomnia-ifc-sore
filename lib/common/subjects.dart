import 'package:insomnia/pages/minggu1.dart';
import 'package:insomnia/pages/minggu11.dart';
import 'package:insomnia/pages/minggu12.dart';
import 'package:insomnia/pages/minggu2.dart';
import 'package:insomnia/pages/minggu4.dart';
import 'package:insomnia/pages/minggu6.dart';
import 'package:insomnia/pages/minggu7.dart';
import 'package:insomnia/pages/minggu9.dart';
import 'package:insomnia/pages/minggu10.dart';

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
    cb: () => const MingguSatu(),
    week: 'Minggu 1',
    title: 'Instalasi, Flutter widget (statefull, stateless), scaffold, text, icon, image'
  ),
  Subject(
    cb: () => const MingguDua(),
    week: 'Minggu 2',
    title: 'Grid, Column, Row, Container dan Navigator'
  ),
  Subject(
    week: 'Minggu 3',
    title: 'Button & Textfield'
  ),
  Subject(
    cb: () => const MingguEmpat(),
    week: 'Minggu 4',
    title: 'setState vs Provider'
  ),
  Subject(
    week: 'Minggu 5',
    title: 'CheckBox, RadioButtons, Chips'
  ),
  Subject(
    cb: () => const MingguEnam(),
    week: 'Minggu 6',
    title: 'Switches dan Dropdown Buttons'
  ),
  Subject(
    cb: () => const MingguTujuh(),
    week: 'Minggu 7',
    title: 'AppBars, FAB dan ButtonNavigation'
  ),
  Subject(
    cb: () => const MingguSembilan(),
    week: 'Minggu 9', 
    title: 'Navigation Drawer, Tabs bar, Sheets:Button'
  ),
  Subject(
    cb: () => const MingguSepuluh(),
    week: 'Minggu 10', 
    title: 'Banners, Dialog, dan Snackbars'
  ),
  Subject(
    cb: () => const MingguSebelas(),
    week: 'Minggu 11', 
    title: 'Menus, Lists and Dividers'
  ),
  Subject(
    cb: () => const MingguDuabelas(),
    week: 'Minggu 12', 
    title: 'Card dan ListTile'
  )
];