import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

enum Mensen {ampark, petersteinweg, elsterbecken, academica, medizin, botanischergarten, tierkliniken, schoenauer, dittrichring}

class MySettings {
  static Map<String, String> config = {
    "location": "106",
    "name": "Mensa am Park"
  };

}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
      ),
      home: const MyHomePage(title: 'Speiseplan Mensa Leipzig'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  Mensen? _mensen = Mensen.ampark;


  String getMensaName () {
    if (_mensen == Mensen.ampark) {
      return "Mensa am Park";
    } else if (_mensen == Mensen.academica) {
      return "Mensa Academica";
    } else if (_mensen == Mensen.botanischergarten) {
      return "Mensaria am Botanischen Garten";
    } else if (_mensen == Mensen.elsterbecken) {
      return "Mensa am Elsterbecken";
    } else if (_mensen == Mensen.dittrichring) {
      return "Cafeteria Dittrichring";
    } else if (_mensen == Mensen.medizin) {
      return "Mensa am Medizincampus";
    } else if (_mensen == Mensen.petersteinweg) {
      return "Mensa am Petersteinweg";
    } else if (_mensen == Mensen.schoenauer) {
      return "Mensa Schönauer Straße";
    } else if (_mensen == Mensen.tierkliniken) {
      return "Mensa an den Tierkliniken";
    } else {return "Kein Name gegeben";}
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 0,
        length: 6,
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              const Text("Speiseplan Leipzig "),
              Flexible(child: Text(getMensaName(), style: const TextStyle(fontSize: 10),))
            ],),
            actions: [IconButton(
                onPressed: () {
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context)
                    {
                      return SizedBox(
                        height: 400,
                        child: SingleChildScrollView(child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                          Column(
                          children: <Widget>[
                        RadioListTile<Mensen>(
                          title: const Text('Mensa am Park'),
                            value: Mensen.ampark,
                            groupValue: _mensen,
                              onChanged: (Mensen? value) {
                                MySettings.config["location"] = "106";
                                setState(() {
                                  _mensen = value;
                                });}
                          ),
                            RadioListTile<Mensen>(
                              title: const Text('Mensa Peterssteinweg'),
                                value: Mensen.petersteinweg,
                                groupValue: _mensen,
                                  onChanged: (Mensen? value) {
                                    MySettings.config["location"] = "111";
                                    setState(() {
                                      _mensen = value;
                                    });}
                              ),
                            RadioListTile<Mensen>(
                              title: const Text('Mensa am Elsterbecken'),
                                value: Mensen.elsterbecken,
                                groupValue: _mensen,
                                  onChanged: (Mensen? value) {
                                    MySettings.config["location"] = "115";
                                    setState(() {
                                      _mensen = value;
                                    });}
                            ),
                            RadioListTile<Mensen>(
                              title: const Text('Mensa Academica'),
                                value: Mensen.academica,
                                groupValue: _mensen,
                                  onChanged: (Mensen? value) {
                                    MySettings.config["location"] = "118";
                                    setState(() {
                                      _mensen = value;
                                    });}
                            ),
                            RadioListTile<Mensen>(
                              title: const Text('Mensa am Medizincampus'),
                                value: Mensen.medizin,
                                groupValue: _mensen,
                                  onChanged: (Mensen? value) {
                                    MySettings.config["location"] = "162";
                                    setState(() {
                                      _mensen = value;
                                    });}
                            ),
                            RadioListTile<Mensen>(
                              title: const Text('Mensa am Botanischen Garten'),
                                value: Mensen.botanischergarten,
                                groupValue: _mensen,
                                  onChanged: (Mensen? value) {
                                    MySettings.config["location"] = "127";
                                    setState(() {
                                      _mensen = value;
                                    });}
                            ),
                            RadioListTile<Mensen>(
                              title: const Text('Mensa an den Tierkliniken'),
                                value: Mensen.tierkliniken,
                                groupValue: _mensen,
                                  onChanged: (Mensen? value) {
                                    MySettings.config["location"] = "170";
                                    setState(() {
                                      _mensen = value;
                                    });}
                              ),
                            RadioListTile(
                              title: const Text('Mensa Schönauer Straße'),
                                value: Mensen.schoenauer,
                                groupValue: _mensen,
                                  onChanged: (Mensen? value) {
                                    MySettings.config["location"] = "140";
                                    setState(() {
                                      _mensen = value;
                                    });}
                              ),
                            RadioListTile(
                              title: const Text('Cafeteria Dittrichring'),
                                value: Mensen.dittrichring,
                                groupValue: _mensen,
                                onChanged: (Mensen? value) {
                                  MySettings.config["location"] = "153";
                                  setState(() {
                                  _mensen = value;
                                  });}
                              ),

                        ],

                          )],
                          ),
                        ),
                      ));
                    });
                },
                icon: const Icon(Icons.location_on_outlined),
            )],
            bottom: TabBar(
              isScrollable: true,
                tabs: <Widget>[
                  const Tab(
                    text: "Heute"
                  ),
                  const Tab(
                      text: "Morgen"
                  ),
                  Tab(
                      text: DateFormat('dd.MM.').format(DateTime.now().add(const Duration(days: 2)))
                  ),
                  Tab(
                      text: DateFormat('dd.MM.').format(DateTime.now().add(const Duration(days: 3)))
                  ),
                  Tab(
                      text: DateFormat('dd.MM.').format(DateTime.now().add(const Duration(days: 4)))
                  ),
                  Tab(
                      text: DateFormat('dd.MM.').format(DateTime.now().add(const Duration(days: 5)))
                  ),
                ]
            ),
          ),
          body: TabBarView(
            children: [
              MealList(parsedate: DateFormat('yyyy-MM-dd').format(DateTime.now())),
              MealList(parsedate: DateFormat('yyyy-MM-dd').format(DateTime.now().add(const Duration(days: 1)))),
              MealList(parsedate: DateFormat('yyyy-MM-dd').format(DateTime.now().add(const Duration(days: 2)))),
              MealList(parsedate: DateFormat('yyyy-MM-dd').format(DateTime.now().add(const Duration(days: 3)))),
              MealList(parsedate: DateFormat('yyyy-MM-dd').format(DateTime.now().add(const Duration(days: 4)))),
              MealList(parsedate: DateFormat('yyyy-MM-dd').format(DateTime.now().add(const Duration(days: 5)))),
            ],

          ),
        ),
    );

  }
}




class Meal {
  final String title;
  final String subheadline;
  final String price1;
  final String price2;
  final String price3;
  final String type;
  final Icon icon;
  final List<Variations> variations;

  const Meal({
    required this.title,
    required this.subheadline,
    required this.price1,
    required this.price2,
    required this.price3,
    required this.type,
    required this.icon,
    required this.variations,
  });
}

class Variations {
  final String name;

  const Variations ({
    required this.name,
  });
}


class MealList extends StatelessWidget {
  final String parsedate;
  const MealList({super.key, required this.parsedate});


  Future<String> getDocument(String url) async {
    final response = await http
        .get(Uri.parse(url));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return response.body;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Future<List<Meal>> getMeals(DateTime date) async {
    List<Meal> meals = [];
    var location = MySettings.config["location"];
    var document = parse(await getDocument(
        "https://www.studentenwerk-leipzig.de/mensen-cafeterien/speiseplan/?location=$location&date=$parsedate"));
    var mealshtml = document.getElementsByClassName("card type--meal");
    for (final meal in mealshtml) {
      String type = meal.children[0].children[0].text;
      String name = meal.children[1].text;
      var components = meal.getElementsByClassName("meal-components");
      var prices = meal.getElementsByClassName("meal-prices");
      String price = "";
      for (final priceElem in prices) {
        price = price + priceElem.text;
      }
      String subheadline = "";
      for (final component in components) {
        subheadline = subheadline + component.text;
      }
      IconData chosenicon = Icons.local_dining;
      if (type == "Fleischgericht") {
        chosenicon = Icons.kebab_dining;
      } else if (type == "Fischgericht") {
        chosenicon = Icons.phishing;
      } else if (type == "Vegetarisches Gericht") {
        chosenicon = Icons.egg;
      } else if (type == "Veganes Gericht") {
        chosenicon = Icons.eco;
      } else if (type == "Pastateller") {
        chosenicon = Icons.ramen_dining;
        subheadline = "";
      } else if (type == "Sättigungsbeilage" || type == "Gemüsebeilage") {
        subheadline = "Beilage";
      }

        var variations = meal.getElementsByClassName("meal-subitem");
        List<Variations> varia = [];
        for (final variation in variations) {
          varia.add(Variations(name: variation.children[0].text));
        }

        if (subheadline == "") {
          for (final variation in variations) {
            subheadline = "$subheadline${variation.children[0].text}\n";
          }
        }
        meals.add(Meal(title: name,
            subheadline: subheadline,
            price1: price,
            price2: "2,66",
            price3: "3,99",
            type: type,
            variations: varia,
            icon: Icon(chosenicon)));
      }
    return meals;
  }

  Future<List<Widget>> getCards() async {
      List<Card> cards = [];
      for (final meal in await getMeals(DateTime.now())) {
        cards.add(
            Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                        leading: meal.icon,
                        title: Text(meal.title),
                        subtitle: Text(meal.subheadline),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(meal.price1),
                        const SizedBox(width: 8),
                      ],
                    )
                  ],
                )
            ));
      }
      return cards;
  }

  @override
  Widget build(BuildContext context) {
    DateTime date = DateFormat("yyyy-MM-dd").parse(parsedate);
    bool isItSunday = date.day == DateTime.sunday;
    if (isItSunday == true) {
      return const Center(child: Text("Sonntags gibt's kein Essen!"));
    }

    return SingleChildScrollView(
    child: Column(
      children: [
        FutureBuilder(
            future: getCards(),
            builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return const Center(child: Text("error"));
                  } else if (snapshot.hasData) {
                    final data = snapshot.data as List<Widget>;
                    return Column(children: data);
                  }
                }
                return const Center(
                  child: CircularProgressIndicator()
                );
            })
      ],
    ));

  }
}
