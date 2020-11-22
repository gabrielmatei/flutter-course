import 'package:flutter/material.dart';

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
  final double _currencyRate = 4.5;
  final GlobalKey _formKey = GlobalKey<FormState>();

  double amountEur;
  double amountRon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Currency converter'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Image.network(
                  'https://freepngimg.com/thumb/money/63478-converter-exchange-symbol-foreign-currency-rate-market.png',
                  height: 200,
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter the amount',
                    icon: Icon(Icons.euro),
                  ),
                  validator: (String value) {
                    final double parsedValue = double.tryParse(value);
                    return parsedValue == null ? 'Please enter a number' : null;
                  },
                  onSaved: (String value) {
                    setState(() => amountEur = double.parse(value));
                  },
                ),
                const SizedBox(height: 20.0),
                RaisedButton(
                  child: const Text(
                    'Convert',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                  color: Colors.blue,
                  onPressed: _submitForm,
                ),
                const SizedBox(height: 20.0),
                if (amountRon != null)
                  Center(
                    child: Text(
                      '${amountRon.toStringAsFixed(2)} RON',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    final FormState form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      setState(() => amountRon = _currencyRate * amountEur);
    } else {
      setState(() => amountRon = null);
    }
  }
}
