import 'package:insomnia/pages/minggu1.dart';

class Subject {
  dynamic link;
  String week;
  String title;

  Subject({
    required this.link,
    required this.week,
    required this.title,
  });
}

final List<Subject> subjects = [
  Subject(
    link: MingguSatu(),
    week: 'Minggu 1',
    title: 'Materi 1'
  ),
  Subject(
    link: '',
    week: 'Minggu 2',
    title: 'Materi 2'
  ),
  Subject(
    link: '',
    week: 'Minggu 3',
    title: 'Materi 3'
  ),
  Subject(
    link: '',
    week: 'Minggu 4',
    title: 'Materi 4'
  ),
  Subject(
    link: '',
    week: 'Minggu 5',
    title: 'Materi 5'
  ),
  Subject(
    link: '',
    week: 'Minggu 6',
    title: 'Materi 6'
  ),
];