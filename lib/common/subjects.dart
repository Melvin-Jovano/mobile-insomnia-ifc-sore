import 'package:insomnia/pages/minggu1.dart';
import 'package:insomnia/pages/minggu11.dart';
import 'package:insomnia/pages/minggu12.dart';
import 'package:insomnia/pages/minggu13.dart';
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
  DateTime createdAt;

  Subject({
    this.cb,
    required this.week,
    required this.title,
    required this.createdAt
  });
}

final List<Subject> subjects = [
  Subject(
    cb: () => const MingguSatu(),
    week: 'Minggu 1',
    title: 'Instalasi, Flutter widget (statefull, stateless), scaffold, text, icon, image',
    createdAt: DateTime(2023, DateTime.march, 7)
  ),
  Subject(
    cb: () => const MingguDua(),
    week: 'Minggu 2',
    createdAt: DateTime(2023, DateTime.march, 14),
    title: 'Grid, Column, Row, Container dan Navigator'
  ),
  Subject(
    week: 'Minggu 3',
    createdAt: DateTime(2023, DateTime.march, 21),
    title: 'Button & Textfield'
  ),
  Subject(
    cb: () => const MingguEmpat(),
    week: 'Minggu 4',
    createdAt: DateTime(2023, DateTime.march, 28),
    title: 'setState vs Provider'
  ),
  Subject(
    week: 'Minggu 5',
    createdAt: DateTime(2023, DateTime.april, 4),
    title: 'CheckBox, RadioButtons, Chips'
  ),
  Subject(
    cb: () => const MingguEnam(),
    week: 'Minggu 6',
    createdAt: DateTime(2023, DateTime.april, 11),
    title: 'Switches dan Dropdown Buttons'
  ),
  Subject(
    cb: () => const MingguTujuh(),
    week: 'Minggu 7',
    createdAt: DateTime(2023, DateTime.may, 2),
    title: 'AppBars, FAB dan ButtonNavigation'
  ),
  Subject(
    cb: () => const MingguSembilan(),
    week: 'Minggu 9', 
    createdAt: DateTime(2023, DateTime.may, 23),
    title: 'Navigation Drawer, Tabs bar, Sheets:Button'
  ),
  Subject(
    cb: () => const MingguSepuluh(),
    week: 'Minggu 10', 
    createdAt: DateTime(2023, DateTime.may, 30),
    title: 'Banners, Dialog, dan Snackbars'
  ),
  Subject(
    cb: () => const MingguSebelas(),
    week: 'Minggu 11', 
    createdAt: DateTime(2023, DateTime.june, 6),
    title: 'Menus, Lists and Dividers'
  ),
  Subject(
    cb: () => const MingguDuabelas(),
    week: 'Minggu 12', 
    createdAt: DateTime(2023, DateTime.june, 13),
    title: 'Card dan ListTile'
  ),
  Subject(
    cb: () => const MingguTigaBelas(),
    week: 'Minggu 13', 
    createdAt: DateTime(2023, DateTime.june, 20),
    title: 'Slider, Tooltips, dan Progress Indicator'
  )
];

sorting(bool val){
  if(val == true){
    //Ascending
    subjects.sort((a,b)=> a.createdAt.compareTo(b.createdAt));
  }
  else if(val == false){
    //Descending
    subjects.sort((b,a)=> a.createdAt.compareTo(b.createdAt));
  }
}