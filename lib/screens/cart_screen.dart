import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/model/cart_provider.dart';
import 'package:shopping_cart/model/db_helper.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  DBhelper dBhelper = DBhelper();
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selected Products'),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: cart.getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image(
                                  width: 100,
                                  height: 100,
                                  image: NetworkImage(
                                      snapshot.data![index].image.toString())),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        snapshot.data![index].productName
                                            .toString(),
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w900),
                                      ),
                                      InkWell(
                                          onTap: () {
                                            dBhelper.delete(
                                                snapshot.data![index].id!);
                                            cart.removeCounter();
                                            cart.removeTotalPrice(double.parse(
                                                snapshot
                                                    .data![index].productPrice
                                                    .toString()));
                                          },
                                          child: const Icon(Icons.delete))
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        snapshot.data![index].unitTag
                                            .toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w700),
                                      ),
                                      const SizedBox(
                                        width: 3,
                                      ),
                                      Text(
                                        "PKR " +
                                            snapshot.data![index].productPrice
                                                .toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w700),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              const Spacer(),
                              InkWell(
                                onTap: () {},
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
                          ),
                        ],
                      ),
                    );
                  });
            }
            return Consumer<CartProvider>(builder: (context, value, child) {
              return Visibility(
                visible: value.getTotalPrice().toStringAsFixed(2) == '0.00'
                    ? false
                    : true,
                child: Column(
                  children: [
                    detailRow(
                        title: 'Sub Total',
                        value: value.getTotalPrice().toStringAsFixed(2))
                  ],
                ),
              );
            });
          }),
    );
  }
}

class detailRow extends StatelessWidget {
  String title = '', value = '';
  detailRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(title), Text(value)],
          ),
        ),
      ),
    );
  }
}
