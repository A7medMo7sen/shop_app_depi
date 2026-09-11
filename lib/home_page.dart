import 'package:flutter/material.dart';
import 'details_page.dart';
import 'data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Color _blue = const Color.fromRGBO(2, 33, 170, 1.0);
  bool isGrid = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_rounded),
        ),
        title: const Text(
          'Product Catalog',
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
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search Products...',
                        hintStyle: const TextStyle(
                          color: Color.fromRGBO(149, 149, 149, 1.0),
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: const Color.fromRGBO(149, 149, 149, 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: const Color.fromRGBO(214, 213, 213, 1.0),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: const Color.fromRGBO(195, 195, 195, 1.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      minimumSize: Size(100, 56),
                      backgroundColor: _blue,
                    ),

                    child: Text(
                      'Search',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Showing all ${items.length} items'),
                  Text('Catalog Active', style: TextStyle(color: _blue)),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 5,
                        height: 20,
                        decoration: BoxDecoration(
                          color: _blue,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'Products',
                        style: TextStyle(fontWeight: FontWeight(700)),
                      ),
                    ],
                  ),

                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isGrid = !isGrid;
                      });
                    },
                    child: Icon(isGrid ? Icons.grid_view : Icons.table_rows),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.builder(
                  itemCount: items.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: isGrid ? 1 : 2,
                    mainAxisExtent: 280,
                  ),
                  itemBuilder: (context, index) {
                    final item = items[index];
                    final price = item['price'] as int;
                    final sale = (item['sale']  as int?) ?? 0;
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(60),
                                  decoration: BoxDecoration(
                                    color: const Color.fromRGBO(
                                      145,
                                      145,
                                      145,
                                      1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),

                                Positioned(
                                  right: 10,
                                  top: 10,

                                  child: Container(
                                    padding: EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(5),
                                      color: const Color.fromRGBO(
                                        193,
                                        192,
                                        192,
                                        1.0,
                                      ),
                                    ),
                                    child: Text(
                                      '#${(index + 1).toString().padLeft(2, '0')}',
                                    ),
                                  ),
                                ),
                                Positioned.fill(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Icon(
                                      size: 40,
                                      item['icon'] as IconData,
                                      color: _blue,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text(
                              item['name'] as String,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight(600),
                              ),
                            ),
                            Text('\$${price * (1 - sale  / 100)}',
                              style: TextStyle(
                                color: _blue,
                                fontSize: 20,
                                fontWeight: FontWeight(700),
                              ),
                            ),
                            ElevatedButton.icon(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        DetailsPage(item: item),
                                  ),
                                );
                              },
                              label: Text(
                                'Details',
                                style: TextStyle(color: Colors.white),
                              ),
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: _blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    8,
                                  ),
                                ),
                                minimumSize: Size(double.infinity, 40),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
