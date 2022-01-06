import 'package:ecommerce/data/categories.dart';
import 'package:ecommerce/data/products.dart';
import 'package:ecommerce/styles/defauls.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late double height;
  late double width;
  int selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: height * .05,
          ),
          // * Menu Icon and Search Bar
          SizedBox(
            width: width,
            height: height * .07,
            child: Row(
              children: [
                SizedBox(
                  width: width * .05,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.menu),
                ),
                SizedBox(
                  width: width * .03,
                ),
                Container(
                  height: height * 0.04,
                  width: width * .7,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.only(left: 10),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      hintText: "Search",
                    ),
                  ),
                ),
                SizedBox(
                  width: width * .05,
                ),
              ],
            ),
          ),
          // * To add Space
          SizedBox(
            height: height * .05,
          ),
          // * Text to order online
          SizedBox(
            width: width,
            height: height * .1,
            child: Padding(
              padding: EdgeInsets.only(left: width * .07),
              child: Text(
                "Order Online\ncollect in store",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: height * 0.03,
                ),
              ),
            ),
          ),
          // * To add Space
          SizedBox(
            height: height * .05,
          ),
          // * Vertical Selector
          Container(
            width: width,
            height: height * .03,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(
                left: 80,
              ),
              children: categories.map((category) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = categories.indexOf(category);
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color:
                              (selectedCategory == categories.indexOf(category))
                                  ? defaulColor
                                  : Colors.grey,
                          width:
                              (selectedCategory == categories.indexOf(category))
                                  ? 2
                                  : 0,
                        ),
                      ),
                    ),
                    child: Text(
                      category,
                      style: TextStyle(
                        color:
                            (selectedCategory == categories.indexOf(category))
                                ? defaulColor
                                : Colors.grey,
                        fontSize: 17,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          // * To  add space
          SizedBox(
            height: height * .1,
          ),
          // * Products Display
          Container(
            width: width,
            height: height * 0.35,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(
                left: 80,
                top: height * .05,
              ),
              children: products.map((product) {
                return Padding(
                  padding: EdgeInsets.only(
                    right: width * .1,
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: height * .25,
                        width: width * .4,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 7,
                              blurRadius: 10,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: width * .4,
                              height: height * .1,
                            ),
                            Text(
                              product.name,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 22,
                              ),
                            ),
                            Text(
                              product.description,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "\$ ${product.price.toInt()}",
                              style: TextStyle(
                                color: defaulColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 22,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: -height * 0.05,
                        left: width * .075,
                        child: Image(
                          height: height * .15,
                          width: width * .25,
                          fit: BoxFit.fill,
                          image: AssetImage(
                            product.image,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          // * To add space
          SizedBox(
            height: height * .02,
          ),
          // * See MOre
          Align(
            alignment: Alignment.centerRight,
            child: Container(
                width: width * .3,
                height: height * 0.03,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "see more",
                      style: TextStyle(
                        color: defaulColor,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: defaulColor,
                    )
                  ],
                )),
          ),
          // * To add space
          Spacer(),
          // * Bottom Navigation
          Container(
            width: width,
            height: height * 0.1,
            padding: EdgeInsets.only(
              top: height * .02,
            ),
            child: Align(
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.home,
                    color: defaulColor,
                    size: 30,
                  ),
                  Icon(
                    Icons.favorite_outline,
                    color: defaulColor,
                    size: 30,
                  ),
                  Icon(
                    Icons.person_outline,
                    color: defaulColor,
                    size: 30,
                  ),
                  Icon(
                    Icons.shopping_basket_outlined,
                    color: defaulColor,
                    size: 30,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
