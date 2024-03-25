import 'package:flutter/material.dart';

import '../data/user_list.dart';
import '../models/user_model.dart';

class LearnScrolling extends StatefulWidget {
  const LearnScrolling({super.key});

  @override
  State<LearnScrolling> createState() => _LearnScrollingState();
}

class _LearnScrollingState extends State<LearnScrolling> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(

        /// ListViewNamedConstructor
        // child: ListView.builder(
        //   itemBuilder: (context, index){
        //     return customUserList(
        //         userList[index]
        //     );
        //   },
        //   itemCount: userList.length,
        // ),

        child: ListView.separated(
          itemBuilder: (context, index){
            return customUserList(userList[index]);
          },
          separatorBuilder: (context, index){


            if(index % 7 == 0){
              return Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.blueGrey,
                ),
                child: const Center(
                  child: Text("Reklama", style: TextStyle(
                      fontSize: 35,
                      color: Colors.white
                  ),),
                ),
              );
            }else{
              return const SizedBox.shrink();
            }

            // return const Divider(
            //   thickness: 3,
            //   color: Colors.red,
            // );
          },
          itemCount: userList.length,
        ),


        /// ListView
        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     SizedBox(
        //       height: 300,
        //       width: 300,
        //       child: ListView(
        //         padding: EdgeInsets.zero,
        //         // shrinkWrap: true,
        //         scrollDirection: Axis.vertical,
        //         children: [
        //           customContainer(color: Colors.red),
        //           customContainer(color: Colors.yellow),
        //           customContainer(color: Colors.blue),
        //           customContainer(color: Colors.green),
        //           customContainer(color: Colors.black),
        //         ],
        //       ),
        //     ),
        //     const SizedBox(height: 30,),
        //     SizedBox(
        //       height: 300,
        //       width: 300,
        //       child: ListView(
        //         padding: EdgeInsets.zero,
        //         // shrinkWrap: true,
        //         scrollDirection: Axis.vertical,
        //         children: [
        //           customContainer(color: Colors.red),
        //           customContainer(color: Colors.yellow),
        //           customContainer(color: Colors.blue),
        //           customContainer(color: Colors.green),
        //           customContainer(color: Colors.black),
        //         ],
        //       ),
        //     ),
        //   ],
        // ),

        /// SingleChildScrollView
        // child: SingleChildScrollView(
        //   scrollDirection: Axis.vertical,
        //   reverse: true,
        //   // primary: true,
        //   // padding: const EdgeInsets.symmetric(horizontal: 30),
        //   physics: const BouncingScrollPhysics(),
        //   dragStartBehavior: DragStartBehavior.down,
        //   child: Column(
        //     children: [
        //       // Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a gallery of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum,It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",)
        //       customContainer(color: Colors.red),
        //       customContainer(color: Colors.yellow),
        //       customContainer(color: Colors.blue),
        //       customContainer(color: Colors.green),
        //       customContainer(color: Colors.black),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}

Widget customContainer({required Color color}){
  return Container(
    // margin: const EdgeInsets.symmetric(horizontal: 20),
    height: 170,
    width: 170,
    color: color
  );
}


Widget customUserList(User user){
  return Card(
    child: ListTile(
      title: Text(user.name),
      subtitle: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(user.gender),
          Text(user.age.toString()),
          const Spacer(),
          Text(user.phoneNumber),
        ],
      ),
    ),
  );
}



