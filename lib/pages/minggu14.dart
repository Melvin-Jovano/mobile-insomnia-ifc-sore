import 'package:flutter/material.dart';

class MingguEmpatBelas extends StatefulWidget {
  const MingguEmpatBelas({super.key});

  @override
  State<MingguEmpatBelas> createState() => _MingguEmpatBelasState();
}

class _MingguEmpatBelasState extends State<MingguEmpatBelas> {
  DateTime date = DateTime.now();
  TextEditingController time = TextEditingController();
  TextEditingController dateRange = TextEditingController();
  List<String> dates = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('M 14'),
          backgroundColor: const Color(0xff001f2e),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () => {
              Navigator.pop(context)
            },
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/img/wallpaper.png"),
              fit: BoxFit.cover
            )
          ),
          child: Card(
            color: Colors.white30,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 20
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      const Text('Tanggal'),
                      const SizedBox(width: 10,),
                      Expanded(
                        child: InputDatePickerFormField(
                          initialDate: date,
                          firstDate: DateTime(1990), 
                          lastDate: DateTime(2250),
                          onDateSubmitted: (d) {
                            setState(() {
                              date = d;
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 10,),
                      IconButton(
                        onPressed: () async {
                          var res = await showDatePicker(
                            context: context, 
                            initialDate: date, 
                            firstDate: DateTime(2000), 
                            lastDate: DateTime(2500)
                          );
                      
                          if(res != null) {
                            setState(() {
                              date = res;
                            });
                          }
                        },
                        icon: const Icon(Icons.calendar_month)
                      )
                    ],
                  ),
                  const SizedBox(height: 20,),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Tanggal terpilih'),
                    subtitle: Text(date.toString()),
                  ),
                  const Divider(),
                  Row(
                    children: [
                      const Text('Jam'),
                      const SizedBox(width: 20,),
                      Expanded(
                        child: TextFormField(
                          controller: time,
                        )
                      ),
                      const SizedBox(width: 20,),
                      IconButton(
                        onPressed: () async {
                          var res = await showTimePicker(
                            initialTime: TimeOfDay.now(),
                            context: context, 
                          );
                      
                          if(res != null) {
                            setState(() {
                              time.text = res.format(context);
                            });
                          }
                        },
                        icon: const Icon(Icons.timelapse)
                      ),
                    ],
                  ),
                  const Divider(height: 20,),
                  Row(
                    children: [
                      const Text('Date Range'),
                      const SizedBox(width: 20,),
                      Expanded(
                        child: TextFormField(
                          controller: dateRange,
                        )
                      ),
                      const SizedBox(width: 20,),
                      IconButton(
                        onPressed: () async {
                          var res = await showDateRangePicker(
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2250),
                            context: context, 
                          );
                      
                          if(res != null) {
                            setState(() {
                              dateRange.text = res.toString();
                              dates.clear();
                              dates.addAll([res.start.toString(), res.end.toString()]);
                            });
                          }
                        },
                        icon: const Icon(Icons.date_range)
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for(int i = 0; i < dates.length; i++)
                      Expanded(
                        child: ListTile(
                          title: Text(i == 0 ? 'Start Date' : 'End Date'),
                          subtitle: Text(dates[i]),
                        )
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}