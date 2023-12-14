import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';
import 'package:shopping_cart/model/cart_provider.dart';
import 'package:shopping_cart/model/db_helper.dart';
import 'package:shopping_cart/model/shopping_detail_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> productPrice = [300, 400, 200, 100, 260, 789, 345, 23, 567, 90];
  List<String> productUnit = [
    "Dozen",
    'KG',
    "KG",
    "KG",
    "KG",
    'KG',
    "KG",
    'KG',
    "KG",
    "KG"
  ];
  List<String> fruitNames = [
    'Banana',
    'Mango',
    'Grapes',
    "Peach",
    "Strawberries",
    "Guava",
    "Berry",
    "Other",
    "Lemon",
    "Big Elaichi"
  ];
  List<String> images = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSURrWqajTB4ASyilPwxsQ62fiQ10fsoc28tGJu0Dd7gg&s",
    "https://i.pinimg.com/736x/de/ca/26/deca2637085532fbc14782acaa78619a.jpg",
    "https://media.istockphoto.com/id/177132231/photo/bundle-of-blue-grapes-with-a-leaf-against-white-background.jpg?s=612x612&w=0&k=20&c=jHOekMn5aQf2hgVGrTLrTyjhXeo2SKH-rFeCdT0zih8=",
    "https://i.pinimg.com/originals/72/aa/7e/72aa7ebae6acd3dd03f2e991b73ef439.png",
    "https://www.freepnglogos.com/uploads/strawberry-png/strawberry-solo-transparent-png-stickpng-5.png",
    "https://media.istockphoto.com/id/171575811/photo/guava.jpg?s=612x612&w=0&k=20&c=cjVDpisFrT8JlqFbSEImkfsXgQbtrNCdSTILGAzIj2Q=",
    "https://media.istockphoto.com/id/1404900493/photo/wild-berry-mix.jpg?s=1024x1024&w=is&k=20&c=nJsLQaH_q40Pm4Jy7pmlr0yjgC6p0QeQNQhY4qjSeqk=",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6Vn2EbpeoSkgNXamzr1j9fXBWR3XC1L5QV9pD3MYZRw&s",
    "https://media.istockphoto.com/id/1406047398/photo/lemon-with-leaf-isolated-on-white-background.webp?s=1024x1024&w=is&k=20&c=af2ixZmm9qa4Cd7AYynk2u_6A3k9rNxrSe6RjSmz3aI=",
    "https://articles-1mg.gumlet.io/articles/wp-content/uploads/2017/10/rsz_shutterstock_656937502.jpg?compress=true&quality=80&w=640&dpr=2.6"
  ];
  DBhelper? dBhelper = DBhelper();
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[100],
        title: const Text(
          'MStore Products',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image(
                                width: 100,
                                height: 100,
                                image: NetworkImage(images[index].toString())),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                Text(
                                  fruitNames[index].toString(),
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w900),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      productUnit[index].toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w700),
                                    ),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    Text(
                                      "PKR " + productPrice[index].toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w700),
                                    )
                                  ],
                                )
                              ],
                            ),
                            Spacer(),
                            InkWell(
                              onTap: () {
                                dBhelper!
                                    .insert(CartModel(
                                        index,
                                        index.toString(),
                                        fruitNames[index].toString(),
                                        productPrice[index],
                                        productPrice[index],
                                        1,
                                        productUnit[index].toString(),
                                        images[index].toString()))
                                    .then((value) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text('Your Item Added')));
                                  cart.addTotalPrice(double.parse(
                                      productPrice[index].toString()));
                                  cart.addCounter();
                                }).onError((error, stackTrace) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(error.toString())));
                                });
                              },
                              child: Container(
                                height: 30,
                                width: 80,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(25)),
                                child: const Center(
                                    child: Text(
                                  'Add',
                                  style: TextStyle(color: Colors.white),
                                )),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: badges.Badge(
          badgeContent:
              Consumer<CartProvider>(builder: (context, value, index) {
            return Text(
              value.getCounter().toString(),
              style: const TextStyle(color: Colors.white),
            );
          }),
          child: const Icon(Icons.shopping_basket_outlined),
        ),
      ),
    );
  }
}
