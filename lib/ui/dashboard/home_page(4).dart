import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: IconButton(onPressed: () {}, icon: Icon(Icons.window)),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
          ),
        ],
        automaticallyImplyLeading: false,
      ),

      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: "Search",
                    filled: true,
                    fillColor: Colors.black12,

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Card(
                  child: Container(
                    height: 220,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      image: DecorationImage(image: AssetImage("assets/images/bloutooth_banar.png"),fit: BoxFit.cover),

                      borderRadius: BorderRadius.all(Radius.circular(11)),

                    ),

                  ),
                ),

                SizedBox(height: 15,),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Column(
                              children: [
                                Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    image: DecorationImage(image: AssetImage("assets/images/shoes.png")),
                                  ),
                                ),
                                Text("Shoes",style: TextStyle(fontSize: 18),)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Column(
                              children: [
                                Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    image: DecorationImage(image: AssetImage("assets/images/beauty.png")),
                                  ),
                                ),
                                Text("Beauty",style: TextStyle(fontSize: 18),)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Column(
                              children: [
                                Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    image: DecorationImage(image: AssetImage("assets/images/woman_fashon.png")),
                                  ),
                                ),
                                Text("Woman Fashon",style: TextStyle(fontSize: 18),)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Column(
                              children: [
                                Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    image: DecorationImage(image: AssetImage("assets/images/bloutooth.png")),
                                  ),
                                ),
                                Text("Bloutooth",style: TextStyle(fontSize: 18),)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Column(
                              children: [
                                Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    image: DecorationImage(image: AssetImage("assets/images/shoes.png")),
                                  ),
                                ),
                                Text("Shoes",style: TextStyle(fontSize: 18),)
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Column(
                              children: [
                                Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    image: DecorationImage(image: AssetImage("assets/images/shoes.png")),
                                  ),
                                ),
                                Text("Shoes",style: TextStyle(fontSize: 18),)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Column(
                              children: [
                                Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    image: DecorationImage(image: AssetImage("assets/images/shoes.png")),
                                  ),
                                ),
                                Text("Shoes",style: TextStyle(fontSize: 18),)
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                SizedBox(height: 20,),
                
                Row(
                  children: [
                    Text("Special For You",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),

                    Spacer(),
                    Text("See All",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
                  ],
                ),

                GridView.builder(
                    itemCount: 8,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: (
                    SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,)
                    ),
                    itemBuilder: (context,index){
                      return Card(
                        child: Container(
                          width: 150,
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(11),
                            image: DecorationImage(image: AssetImage("assets/images/shoes.png"),fit: BoxFit.cover),
                          ),
                        ),
                      );
                    })

              ],
            )

          ),
        ),
      ),
    );
  }
}
