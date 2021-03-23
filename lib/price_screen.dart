import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'coin_data.dart';
import 'contants.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';
  String valueInUSD;

  List<DropdownMenuItem> getDropDownItem() {
    List<DropdownMenuItem<String>> dropDropMenu = [];
    for (int i = 0; i < currenciesList.length; i++) {
      String currency = currenciesList[i];
      var dropDownItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropDropMenu.add(dropDownItem);
    }
    return dropDropMenu;
  }

  void getData() async {
    double data = await CoinData().getCoinData();
    setState(() {
      valueInUSD = data.toStringAsFixed(1);
    });
  }

  @override
  void initState() {
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Coin Ticker',
        ),
      ),
      body: valueInUSD != null
          ? Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                    padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                    child: Card(
                      color: kThemeColor,
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 28.0),
                          child: Text(
                            '1 BTC = $valueInUSD USD',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Color(0xFFFFFFFF),
                            ),
                          )),
                    )),
                Container(
                  height: 150,
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(bottom: 30.0),
                  color: kThemeColor,
                  child: DropdownButton<String>(
                    value: selectedCurrency,
                    items: getDropDownItem(),
                    onChanged: (value) {
                      setState(() {
                        selectedCurrency = value;
                      });
                      print(value);
                    },
                  ),
                )
              ],
            )
          : Center(
              child: SizedBox(
                height: 100,
                width: 100,
                child: CircularProgressIndicator(
                  value: null,
                ),
              ),
            ),
    );
  }
}
