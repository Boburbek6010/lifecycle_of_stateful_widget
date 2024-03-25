import 'package:flutter/material.dart';

import '../data/product_list.dart';
import '../models/product_model.dart';

class UzumPage extends StatefulWidget {
  const UzumPage({super.key});

  @override
  State<UzumPage> createState() => _UzumPageState();
}

class _UzumPageState extends State<UzumPage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          /// Banner 30%
          Expanded(
            flex: 3,
            child: Column(
              children: [
                const SizedBox(height: 30,),
                Row(
                  children: [
                    Container(
                      color: Colors.grey,
                      height: 50,
                      width: MediaQuery.of(context).size.width*0.85,
                    ),
                    IconButton(
                      onPressed: (){},
                      icon: const Icon(Icons.favorite_border),
                    )
                  ],
                ),
                const SizedBox(height: 10,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      banner("Reklama", context),
                      banner("Reklama", context),
                      banner("Reklama", context),
                    ],
                  ),
                )
              ],
            )
          ),



          /// Products 70%
          Expanded(
            flex: 7,
            child: ListView.builder(
              itemBuilder: (_, index){
                return SizedBox(
                  height: 300,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      product(productList[index], context),
                      product(productList[index], context),
                    ],
                  ),
                );
              },
              itemCount: productList.length,
            )
          )
        ],
      ),
    );
  }
}


Widget banner (String name, BuildContext context){
  return Container(
    height: 130,
    alignment: Alignment.center,
    width: MediaQuery.of(context).size.width*0.9,
    color: Colors.blueGrey,
    margin: const EdgeInsets.symmetric(horizontal: 30),
    child: Text(name, style: const TextStyle(
      fontSize: 34,
    ),),
  );
}


Widget product(Product product, BuildContext context){
  return Column(
    children: [

      /// 80 image
      Expanded(
        flex: 8,
        child: Container(
          height: double.infinity,
          width: MediaQuery.of(context).size.width*0.48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey,
          ),
          child: Image.network(product.image),
        ),
      ),

      /// 20 text
      Expanded(
        flex: 2,
        child: Text(product.info)
      ),
    ],
  );
}
