import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:spreadsheet_decoder/spreadsheet_decoder.dart';
import 'package:projeto_valid/main.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      brightness: Brightness.light, 
    ),
    home: ExcelDataViewer(),
  ));
}

class ExcelDataViewer extends StatefulWidget {
  @override
  _ExcelDataViewerState createState() => _ExcelDataViewerState();
}

class _ExcelDataViewerState extends State<ExcelDataViewer> {
  List<DataRow> rows = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final data = await rootBundle.load("assets/example.xlsx");
    var decoder = SpreadsheetDecoder.decodeBytes(data.buffer.asUint8List());
    var table = decoder.tables['Planilha1'];

    if (table != null) {
      rows = table.rows.map((row) {
        return DataRow(cells: row.map((cell) => DataCell(Text(cell != null ? "$cell" : "Vazio"))).toList());
      }).toList();
    } else {
      // Trate o caso em que a tabela é nula.
      print('Tabela não encontrada');
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: degradeVerde(),
        title: const Text('Excel Data Viewer'),
      ),
      body: isLoading ? CircularProgressIndicator() : SingleChildScrollView(
        child: DataTable(
          columns: const <DataColumn>[
            DataColumn(label: Text('Coluna A')),
            DataColumn(label: Text('Coluna B')),
            // Adicione mais DataColumn para cada coluna adicional.
          ],
          rows: rows,
        ),
      ),
    );
  }
}
