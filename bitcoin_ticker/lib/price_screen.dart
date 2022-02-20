import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'config.dart';
class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String ratefromBitcoin = '? USD';
  String ratefromEtherium = '? USD';
  Future<String> fetchdata(String from, String to) async {
    http.Response response = await http.get(
        Uri.parse("https://rest.coinapi.io/v1/exchangerate/$from/$to?apikey=$apikey"));
    if (response.statusCode == 200) {
      dynamic data = response.body;
      String freshData = jsonDecode(data)["rate"].toInt().toString() + " " + to;
      return freshData;
    } else {
      return 'error';
    }
  }

  void getData(String from, String to) async {
    setState(() {});
  }

  String selectedCurrency = "USD";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CoinCard(txt: "1 BTC = $ratefromBitcoin"),
              CoinCard(txt: "1 ETH = $ratefromEtherium"),
            ],
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: CupertinoPicker(
                itemExtent: 32.0,
                onSelectedItemChanged: (selectedItemIndex) async {
                  ratefromBitcoin =
                      await fetchdata("BTC", currenciesList[selectedItemIndex]);
                  ratefromEtherium =
                      await fetchdata("ETH", currenciesList[selectedItemIndex]);
                  setState(() {});
                },
                children: [for (String Item in currenciesList) Text(Item)]),
          )
        ],
      ),
    );
  }
}

class CoinCard extends StatelessWidget {
  String txt;
  CoinCard({
    required this.txt,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            txt,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
