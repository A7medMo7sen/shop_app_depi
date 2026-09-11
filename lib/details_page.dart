import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key, required this.item});
  final Map<String, dynamic> item;
  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final Color _blue = const Color.fromRGBO(2, 33, 170, 1.0);
  bool isFav = false;
  late double rate = widget.item['rate'] as double;
  late int price = widget.item['price'] as int;
  late int sale = (widget.item['sale'] as int?) ?? 0;
  final colorList = [
    Color.fromRGBO(2, 33, 170, 1.0),
    Colors.white,
    Colors.lightBlueAccent,
  ];
  int selectedColor = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_rounded),
        ),
        title: const Text(
          'Product Details',
          style: TextStyle(fontWeight: FontWeight(700)),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          const SizedBox(width: 15),
          Container(
            decoration: BoxDecoration(
              color: _blue,
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.person_outlined, color: Colors.white),
            ),
          ),
          SizedBox(width: 15),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            children: [
              SizedBox(height: 30,),
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 250,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(223, 223, 223, 1.0),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      widget.item['icon'] as IconData,
                      size: 80,
                      color: colorList[selectedColor],
                    ),
                  ),
                  if (widget.item['sale'] != null)
                    FractionalTranslation(
                      translation: Offset(.15, -1),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(150, 1, 1, 1),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.local_fire_department_outlined,
                              color: Colors.white,
                            ),
                            Text(
                              'SALE ${widget.item['sale'] as int}%',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight(500),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                  Positioned(
                    bottom: 15,
                    right: 0,
                    left: 0,
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: SizedBox(
                          width: 90,
                          height: 30,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: colorList.length,
                            itemBuilder: (context, index) {
                              final Color color = colorList[index];

                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedColor = index;
                                  });
                                },
                                child: colorContainer(
                                  color,
                                  selectedColor,
                                  index,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.item['name'] as String,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight(700),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromRGBO(223, 223, 223, 1.0),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isFav = !isFav;
                                });
                              },
                              child: isFav
                                  ? Icon(Icons.favorite, color: Colors.red)
                                  : Icon(Icons.favorite_border),
                            ),
                          ),
                        ],
                      ),

                      Text(
                        'ACOUSTIC PRO SERIES X',
                        style: TextStyle(fontSize: 13),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          for (int i = 0; i < 5; i++)
                            if ((rate - i) >= 1)
                              Icon(Icons.star, color: Colors.amberAccent)
                            else if ((rate - i) < 1 && (rate - i) > 0)
                              Icon(Icons.star_half, color: Colors.amberAccent)
                            else
                              Icon(
                                Icons.star_border_outlined,
                                color: Colors.amberAccent,
                              ),
                          Text('(${widget.item['review'] as int} reviews)'),
                        ],
                      ),
                      SizedBox(height: 20),
                      RichText(
                        text: TextSpan(
                          text: '\$${price * (1 - (sale / 100))} ',
                          style: TextStyle(
                            color: _blue,
                            fontSize: 30,
                            fontWeight: FontWeight(900),
                          ),
                          children: [
                            if (sale != 0)
                              TextSpan(
                                text: '\$$price',
                                style: TextStyle(
                                  fontSize: 15,
                                  decoration: TextDecoration.lineThrough,
                                  decorationThickness: 2,
                                  color: Colors.grey,
                                ),
                              ),

                            if (sale != 0)
                              WidgetSpan(
                                child: Container(
                                  margin: EdgeInsets.only(left: 10),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 5,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.cyanAccent,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    'Save ${price - (price * (1 - (sale / 100)))}',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),

                      SizedBox(height: 20),
                      Text(
                        'Description',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight(600),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'High-fidelity wireless sound with active noise cancellation and up to 30 hours of battery life.\nLightweight, ergonomic cushioned earcups designed for all-day comfort and seamless Bluetooth 5.2 connectivity.',
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Specification',
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                      SizedBox(height: 10),

                      Row(
                        children: [
                          specifyContainer(
                            icon: Icons.bluetooth,
                            text: 'Bluetooth 5.2',
                          ),
                          SizedBox(width: 10),
                          specifyContainer(
                            icon: Icons.battery_charging_full,
                            text: '30h Battery',
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      specifyContainer(
                        icon: Icons.electric_bolt_sharp,
                        text: 'USB-C Fast Charge',
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton.icon(
                onPressed: () {},
                label: Text(
                  'Add To Cart',
                  style: TextStyle(color: Colors.white),
                ),
                icon: Icon(Icons.shopping_cart_outlined, color: Colors.white),
                style: ElevatedButton.styleFrom(
                    backgroundColor: _blue,
                    shape:RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)

                    )
                    ,padding: EdgeInsets.symmetric(vertical: 15)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget colorContainer(Color color, int selectedColor, int index) {
  return Container(
    padding: EdgeInsets.all(2),

    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: selectedColor == index ? Colors.black : null,
    ),
    child: Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(
        border: selectedColor == index ? Border.all(color: Colors.white) : null,
        shape: BoxShape.circle,
        color: color,
      ),
    ),
  );
}

Widget specifyContainer({required String text, required IconData icon}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    decoration: BoxDecoration(
      color: const Color.fromRGBO(223, 223, 223, 1.0),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: const Color.fromRGBO(2, 33, 170, 1.0)),
        Text(text),
      ],
    ),
  );
}
