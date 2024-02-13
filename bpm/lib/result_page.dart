import 'package:flutter/material.dart';
// import 'package:get/get.dart';

class ResultPage extends StatelessWidget {
  final String result;

  const ResultPage({Key? key, required this.result}) : super(key: key);

  String _getResultText(String result) {
    switch (result) {
      case 's1':
        return 'Normal';
      case 's2':
        return 'Elevated';
      case 's3':
        return 'Hypertension Stage 1';
      case 's4':
        return 'Hypertension Stage 2';
      case 's5':
        return 'Hypertensive Crisis \nRequires medical attention';
      default:
        return 'Unknown';
    }
  }

  Color _getResultColor(String result) {
    switch (result) {
      case 's1':
        return Colors.green;
      case 's2':
        return Colors.yellow;
      case 's3':
        return Colors.orange;
      case 's4':
        return Colors.red;
      case 's5':
        return Colors.deepPurple;
      default:
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 99, 101, 102),
        title: const Text(
          'Blood Pressure Monitor Results',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const BloodPressureTable(),
                const SizedBox(height: 20),
                const Text(
                  'Your Blood Pressure Result',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: Text(
                    _getResultText(result),
                    style: TextStyle(
                      fontSize: 16,
                      color: _getResultColor(result),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(19.0),
                      child: SizedBox(
                        width: 200,
                        child: Image.asset(
                          "assets/images/1.png",
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BloodPressureTable extends StatelessWidget {
  const BloodPressureTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: DataTable(
          columnSpacing: 16.0,
          columns: const <DataColumn>[
            DataColumn(
              label: SizedBox(
                width: 100,
                child: Text('Blood Pressure \nCategory'),
              ),
            ),
            DataColumn(
              label: SizedBox(
                width: 100,
                child: Text(
                  'Systolic \n(mm Hg)',
                ),
              ),
            ),
            DataColumn(
              label: SizedBox(
                width: 100,
                child: Text('Diastolic \n(mm Hg)'),
              ),
            ),
          ],
          rows: const <DataRow>[
            DataRow(cells: <DataCell>[
              DataCell(SizedBox(
                width: 100,
                child: Text('Normal'),
              )),
              DataCell(SizedBox(
                width: 100,
                child: Text('Less than 120'),
              )),
              DataCell(SizedBox(
                width: 100,
                child: Text('Less than 80'),
              )),
            ]),
            DataRow(cells: <DataCell>[
              DataCell(SizedBox(
                width: 100,
                child: Text('Elevated'),
              )),
              DataCell(SizedBox(
                width: 100,
                child: Text('120 – 129'),
              )),
              DataCell(SizedBox(
                width: 100,
                child: Text('Less than 80'),
              )),
            ]),
            DataRow(cells: <DataCell>[
              DataCell(SizedBox(
                width: 100,
                child: Text('High BP \n(Stage 1)'),
              )),
              DataCell(SizedBox(
                width: 100,
                child: Text('130 – 139'),
              )),
              DataCell(SizedBox(
                width: 100,
                child: Text('80 – 89'),
              )),
            ]),
            DataRow(cells: <DataCell>[
              DataCell(SizedBox(
                width: 100,
                child: Text('High BP \n(Stage 2)'),
              )),
              DataCell(SizedBox(
                width: 100,
                child: Text('140 or higher'),
              )),
              DataCell(SizedBox(
                width: 100,
                child: Text('90 or higher'),
              )),
            ]),
            DataRow(cells: <DataCell>[
              DataCell(SizedBox(
                width: 100,
                child: Text('Hypertensive \ncrisis'),
              )),
              DataCell(SizedBox(
                width: 100,
                child: Text('Higher than 180'),
              )),
              DataCell(SizedBox(
                width: 100,
                child: Text('Higher than 120'),
              )),
            ]),
          ],
        ),
      ),
    );
  }
}
