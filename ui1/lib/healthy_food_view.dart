import 'package:flutter/material.dart';

class HealthyFoodView extends StatefulWidget {
  const HealthyFoodView({Key? key}) : super(key: key);

  @override
  State<HealthyFoodView> createState() => _HealthyFoodViewState();
}

class _HealthyFoodViewState extends State<HealthyFoodView> {
  int count = 0;
  List<String> categories = ["Kahvaltı", "Sulu Yemekler", "İçecekler", "Tatılılar"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: a1(),
      body: b2(),
      bottomNavigationBar: bars(),
    );
  }

  AppBar a1() => AppBar(
        title: text(),
        actions: [iconButton()],
        backgroundColor: Colors.transparent,
        elevation: 0,
      );

  IconButton iconButton() {
    return IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.search,
          color: Colors.black,
        ));
  }

  Text text() {
    return Text(
      "Selam",
      style: Theme.of(context).textTheme.headline6,
    );
  }

  Column b2() {
    return Column(children: [b1, cards, sizedBoxEmpty, categoryTitle, sizedBoxEmpty, sizedBoxCategories]);
  }

  SizedBox get sizedBoxCategories {
    return SizedBox(
      height: 100,
      child: listViewCategories(),
    );
  }

  ListView listViewCategories() {
    return ListView.builder(
      itemCount: categories.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => sizedBoxCategory(index),
    );
  }

  SizedBox sizedBoxCategory(int index) {
    return SizedBox(
      width: 100,
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey[200],
            child: const Icon(Icons.breakfast_dining_outlined),
          ),
          Text(categories[index]),
        ],
      ),
    );
  }

  SizedBox get sizedBoxEmpty => const SizedBox(height: 20);

  Text get categoryTitle {
    return Text(
      "Kategoriler",
      style: Theme.of(context).textTheme.headline5,
    );
  }

  Row get b1 {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [elevatedButton("1"), elevatedButton("2"), elevatedButton("3")],
    );
  }

  SizedBox get cards {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      child: cardListView(),
    );
  }

  ElevatedButton elevatedButton(String data) {
    return ElevatedButton(onPressed: () {}, child: Text(data), style: selectButton);
  }

  ButtonStyle get selectButton {
    return ElevatedButton.styleFrom(primary: Colors.transparent, shape: const StadiumBorder());
  }

  ListView cardListView() {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) =>
          Card(margin: const EdgeInsets.symmetric(horizontal: 20), child: containerCard(context)),
    );
  }

  Container containerCard(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width * 0.6,
        child: Column(
          children: [expandedCard(), expandedCardDetail(), rowCardBottom()],
        ));
  }

  Expanded expandedCard() => const Expanded(flex: 6, child: Placeholder());

  Expanded expandedCardDetail() {
    return const Expanded(
        flex: 3,
        child: ListTile(
          title: Text("data"),
          trailing: CircleAvatar(
            child: Text(
              " 0 TL",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.orange,
          ),
          subtitle: Text("data"),
        ));
  }

  Row rowCardBottom() {
    return Row(
      children: const [
        Icon(Icons.star_border_outlined),
        Text("0.0"),
        Spacer(),
        Icon(Icons.place_outlined),
        Text("0.0 km")
      ],
    );
  }

  BottomNavigationBar bars() {
    return BottomNavigationBar(items: const [
      BottomNavigationBarItem(icon: Icon(Icons.accessibility), label: "data"),
      BottomNavigationBarItem(icon: Icon(Icons.accessibility), label: "data")
    ]);
  }
}
