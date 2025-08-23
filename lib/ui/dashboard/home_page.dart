
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/constants/app_constants.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> cats = [
  {
    "imgUrl":"assets/images/shoes.jpg",
    "catName":"Shoes"
  },
  {
    "imgUrl":"assets/images/jwellery.jpg",
    "catName":"Jewellary"
  },
  {
    "imgUrl":"assets/images/womes_fashion.jpg",
    "catName":"Womens Fashion"
  },
  {
    "imgUrl":"assets/images/beauty_products.webp",
    "catName":"Beauty Products"
  },
    {
      "imgUrl":"assets/images/mens_fashion.jpg",
      "catName":"Mens Fashion"
    },
  ];

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Container(
        margin: EdgeInsets.only(top: 25),
        padding:  EdgeInsets.all(9.0),
        child: Expanded(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.density_small_rounded),
                  IconButton(onPressed: () async{
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    prefs.setString(AppConstants.PREF_KEY_USER_TOKEN, "");
                  }, icon: Icon(Icons.logout))
                ],
              ),
              SizedBox(
                height: 15,
              ),
              SearchBar(
                controller: searchController,
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 0.2,
                decoration: BoxDecoration(
                  color: Colors.deepOrange
                ),
                child: Center(child: Text("Slider")),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.15,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: cats.length,
                    itemBuilder:(_,index)
                        {
                          Map<String, dynamic> category = cats[index];
                          return Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                height:MediaQuery.sizeOf(context).height * 0.1,
                                width:MediaQuery.of(context).size.width * 0.3,
                                decoration: BoxDecoration(
                                 shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(category['imgUrl']),
                                      fit: BoxFit.fill
                                  ),
          
                                ),
          
                              ),
                              Text( category['catName'], style: TextStyle(
                                fontWeight: FontWeight.w300
                              ),)
                            ],
                          );
                        }
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Special for you",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
                  Text("see all")
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        height: MediaQuery.sizeOf(context).height * 0.2,
                        //margin: EdgeInsets.only(right: 9),
                        width: (MediaQuery.sizeOf(context).width - 25) * 0.48,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/headphones.jpg"),
                              fit: BoxFit.fill
                          ),
                            color: Colors.grey.shade200,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(7),topLeft: Radius.circular(7))
                        ) ,
                      ),
                      Container(
                        padding: EdgeInsets.all(9),
                        //margin: EdgeInsets.only(right: 9),
                        width: (MediaQuery.sizeOf(context).width - 25) * 0.48,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(7),bottomLeft: Radius.circular(7))
                        ),
                        child: Column(
                          children: [
                            Text("Wireless Headphones",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold
                                )),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("\$120.00",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold
                                ),),
                                Row(
          
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 2),
                                      height: 10,
                                      width: 10,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.green
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 2),
                                      height: 10,
                                      width: 10,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.grey
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 2),
                                      height: 10,
                                      width: 10,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.purple
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 2),
                                      height: 10,
                                      width: 10,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.yellow
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )
          
                          ],
                        ),
                      ),
                    ],
                  ),
          
                  Column(
                    children: [
                      Container(
                        height: MediaQuery.sizeOf(context).height * 0.2,
                        //margin: EdgeInsets.only(right: 9),
                        width: (MediaQuery.sizeOf(context).width - 25) * 0.48,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/jacket.jpg"),
                                fit: BoxFit.fill
                            ),
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.only(topRight: Radius.circular(7),topLeft: Radius.circular(7))
                        ) ,
                      ),
                      Container(
                        padding: EdgeInsets.all(9),
                        //margin: EdgeInsets.only(right: 9),
                        width: (MediaQuery.sizeOf(context).width - 25) * 0.48,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(7),bottomLeft: Radius.circular(7))
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text("Womens Jacket",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold
                                    )),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("\$120.00",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold
                                  ),),
                                Row(
          
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 2),
                                      height: 10,
                                      width: 10,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.green
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 2),
                                      height: 10,
                                      width: 10,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.grey
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 2),
                                      height: 10,
                                      width: 10,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.purple
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 2),
                                      height: 10,
                                      width: 10,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.yellow
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )
          
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      

    );
  }
}