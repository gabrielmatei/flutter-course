import 'package:flutter/material.dart';
import 'package:flutter_course/helpers.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Course',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey _formKey = GlobalKey<FormState>();

  int _number;

  String _numberShape(int number) {
    final bool isSquare = MathHelper.isSquare(number);
    final bool isTriangular = MathHelper.isTriangular(number);

    if (isSquare && isTriangular)
      return 'Number $number is both SQUARE and TRIANGULAR.';
    if (isSquare) //
      return 'Number $number is SQUARE.';
    if (isTriangular) //
      return 'Number $number is TRIANGULAR.';
    return 'Number $number is neither TRIANGULAR or SQUARE.';
  }

  void _submitForm() {
    final FormState form = _formKey.currentState;
    if (form.validate()) {
      form.save();

      showDialog<Widget>(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Number: $_number'),
          content: Text(_numberShape(_number)),
        ),
      ).then((_) => form.reset());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Number Shapes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Please input a number to see it it is square or triangular.',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Number..',
                ),
                validator: (String value) {
                  final int parsedValue = int.tryParse(value);
                  return parsedValue == null ? 'Please enter a number' : null;
                },
                onSaved: (String value) {
                  setState(() => _number = int.parse(value));
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.check),
        onPressed: _submitForm,
      ),
    );
  }
}
