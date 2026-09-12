import 'package:flutter/material.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final Color _blue = const Color.fromRGBO(2, 33, 170, 1.0);
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final GlobalKey<FormState> validatorKey = GlobalKey<FormState>();
  final categoryList = ['Electronics', 'Accessories', 'Footwear'];
  int selectedCategory = -1;
  bool priceError = false;
  bool nameError = false;

  @override
  Widget build(BuildContext context) {

    final errorBorder=OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Colors.red),
    );
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
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: validatorKey,
            child: ListView(
              children: [
                Text(
                  'Product Name',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight(700)),
                ),
                SizedBox(height: 5),
                TextFormField(
                  onChanged: (value){
                    setState(() {
                      nameError=nameController.text.trim().isEmpty;
                      if (validatorKey.currentState!.validate()){

                      }
                    });
                  },
                  controller: nameController,
                  decoration: InputDecoration(
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
                    errorBorder: errorBorder,
                    focusedErrorBorder: errorBorder,
                    prefixIcon: Icon(
                      Icons.attach_money,
                      color: nameError
                          ? Colors.red
                          : const Color.fromRGBO(149, 149, 149, 1.0),
                    ),

                    suffixIcon: nameError
                        ? Icon(Icons.error_outline, color: Colors.red)
                        : null,
                    hintText: 'e.g Studio Monitor Headphones',
                    hintStyle: const TextStyle(
                      color: Color.fromRGBO(149, 149, 149, 1.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '! Product name is required ';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Price(\$)',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight(700),
                      ),
                    ),
                    Text(
                      'USD',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromRGBO(149, 149, 149, 1.0),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                TextFormField(
                  onChanged: (value){
                    setState(() {
                      priceError=priceController.text.trim().isEmpty;
                      if (validatorKey.currentState!.validate()){

                      }
                    });
                  },
                  controller: priceController,
                  decoration: InputDecoration(
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
                    errorBorder: errorBorder,
                    focusedErrorBorder: errorBorder,
                    hintText: '0.00',
                    hintStyle: const TextStyle(
                      color: Color.fromRGBO(149, 149, 149, 1.0),
                    ),
                    prefixIcon: Icon(
                      Icons.attach_money,
                      color: priceError
                          ? Colors.red
                          : const Color.fromRGBO(149, 149, 149, 1.0),
                    ),
                    suffixIcon: priceError
                        ? Icon(Icons.error_outline, color: Colors.red)
                        : null,
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (priceError) {
                      return '! Price is required ';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Description',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight(700),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text('optional'),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                TextField(
                  controller: descController,
                  decoration: InputDecoration(
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
                    hintText: 'Enter Product features,specs,and details...',
                    hintStyle: const TextStyle(
                      color: Color.fromRGBO(149, 149, 149, 1.0),
                    ),
                  ),
                  maxLines: 3,
                ),
                Text(
                  'Optional additional details about the item',
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(height: 30),
                Text(
                  'Category',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight(700)),
                ),
                SizedBox(height: 5),
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categoryList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCategory = index;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            color: selectedCategory == index
                                ? _blue
                                : Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.black),
                          ),
                          child: Row(
                            children: [
                              if (selectedCategory == index)
                                Icon(Icons.check, color: Colors.white),
                              Text(
                                categoryList[index],
                                style: TextStyle(
                                  color: selectedCategory == index
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      nameError = nameController.text.trim().isEmpty;
                      priceError=priceController.text.trim().isEmpty;
                    });
                    if (validatorKey.currentState!.validate()) {}
                  },
                  label: Text(
                    'Add Product',
                    style: TextStyle(color: Colors.white),
                  ),
                  icon: Icon(Icons.add, color: Colors.white),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 15),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
