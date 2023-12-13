import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    "https://png.pngtree.com/png-vector/20210526/ourmid/pngtree-banana-diet-health-tropics-png-image_3356842.jpg",
    "https://i.pinimg.com/736x/de/ca/26/deca2637085532fbc14782acaa78619a.jpg",
    "https://media.istockphoto.com/id/177132231/photo/bundle-of-blue-grapes-with-a-leaf-against-white-background.jpg?s=612x612&w=0&k=20&c=jHOekMn5aQf2hgVGrTLrTyjhXeo2SKH-rFeCdT0zih8=",
    "https://i.pinimg.com/originals/72/aa/7e/72aa7ebae6acd3dd03f2e991b73ef439.png",
    "data:image/jpeg;base64,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",
    "https://png.pngtree.com/png-vector/20210713/ourmid/pngtree-green-organic-guava-png-image_3591749.jpg",
    "https://www.shutterstock.com/image-photo/peach-fruit-isolated-on-white-260nw-2347620037.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6Vn2EbpeoSkgNXamzr1j9fXBWR3XC1L5QV9pD3MYZRw&s",
    "https://thumbs.dreamstime.com/b/lemon-whole-half-cut-fruits-isolated-white-transparent-png-additional-format-lemon-whole-half-cut-fruits-isolated-279257426.jpg",
    "https://articles-1mg.gumlet.io/articles/wp-content/uploads/2017/10/rsz_shutterstock_656937502.jpg?compress=true&quality=80&w=640&dpr=2.6"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[100],
        title: const Text(
          'MStore Products',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const SizedBox(
              height: 7,
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: "Search",
                  border: const OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.purple),
                      borderRadius: BorderRadius.circular(20))),
            ),
            const SizedBox(
              height: 7,
            ),
            Expanded(
              child: GridView.builder(
                  itemCount: images.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 14,
                      crossAxisSpacing: 5),
                  itemBuilder: (context, index) {
                    return Card(
                        color: Colors.white,
                        child: Expanded(
                          child: Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              Expanded(
                                child: Image(
                                    fit: BoxFit.cover,
                                    image:
                                        NetworkImage(images[index].toString())),
                              ),
                              Text(
                                fruitNames[index].toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.w800, fontSize: 20),
                              ),
                              const Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    'KG PKR: 90',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w900),
                                  )),
                              Align(
                                  alignment: Alignment.bottomRight,
                                  child: Container(
                                    height: 30,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.black,
                                            blurRadius: 5,
                                          )
                                        ],
                                        color: Colors.deepPurple,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: const Center(
                                      child: Text(
                                        'Add',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        ));
                  }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const badges.Badge(
          badgeContent: Text(
            '0',
            style: TextStyle(color: Colors.white),
          ),
          child: Icon(Icons.shopping_basket_outlined),
        ),
      ),
    );
  }
}
