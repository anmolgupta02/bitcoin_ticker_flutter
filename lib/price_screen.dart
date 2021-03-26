import 'dart:io' show Platform;

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
  String valueInBTC;
  String valueInETH;
  String valueInLTH;

  List<DropdownMenuItem> getDropDownItem() {
    List<DropdownMenuItem> dropDropMenu = [];
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

  List<Text> getPicketItems() {
    List<Text> currencyFromList = [];
    for (String currency in currenciesList) {
      currencyFromList.add(Text(currency));
    }

    // for (int i = 0; i < currenciesList.length; i++) {
    //   String currentCurrency = currenciesList[i];
    //
    //   currencyFromList.add(Text(currentCurrency));
    // }
    return currencyFromList;
  }

  void getData() async {
    double dataInBTC = await CoinData().getCoinDataInBTC(selectedCurrency);
    double dataInETH = await CoinData().getCoinDataInETH(selectedCurrency);
    //double dataInLTH = await CoinData().getCoinDataInLTH(selectedCurrency);
    setState(() {
      valueInBTC = dataInBTC.toStringAsFixed(1);
      valueInETH = dataInETH.toStringAsFixed(2);
      //valueInLTH = dataInLTH.toStringAsFixed(2);
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
      body: valueInBTC != null
          ? Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                    padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                    child: Column(
                      children: [
                        Card(
                          color: kThemeColor,
                          elevation: 5.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 28.0),
                              child: Text(
                                '1 BTC = $valueInBTC $selectedCurrency',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Color(0xFFFFFFFF),
                                ),
                              )),
                        ),
                        Card(
                          color: kThemeColor,
                          elevation: 5.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 28.0),
                              child: Text(
                                '1 ETH = $valueInETH $selectedCurrency',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Color(0xFFFFFFFF),
                                ),
                              )),
                        ),
                        Card(
                          color: kThemeColor,
                          elevation: 5.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 28.0),
                              child: Text(
                                '1 LTH = $valueInETH $selectedCurrency',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Color(0xFFFFFFFF),
                                ),
                              )),
                        ),
                      ],
                    )),
                Container(
                  height: 150,
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(bottom: 30.0),
                  color: kThemeColor,
                  child: Platform.isIOS
                      ? CupertinoPicker(
                          backgroundColor: kThemeColor,
                          itemExtent: 32,
                          onSelectedItemChanged: (selectedIndex) {
                            print(selectedIndex);
                          },
                          children: getPicketItems(),
                        )
                      : DropdownButton<dynamic>(
                          value: selectedCurrency,
                          items: getDropDownItem(),
                          onChanged: (value) {
                            setState(() {
                              selectedCurrency = value;
                              getData();
                            });
                            print(value);
                          },
                        ),
                ),
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
