import 'package:flutter/material.dart';

class W3classBody extends StatefulWidget {
  const W3classBody({super.key});

  @override
  State<W3classBody> createState() => _W3classBodyState();
}

class _W3classBodyState extends State<W3classBody> {
  bool showUI=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:
          Center(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("My first App",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
               SizedBox(height:50),
                const Text("I'm", style: TextStyle(fontSize: 18),),
                SizedBox(height: 10,),
                const Text("Le Tuan Khang",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                SizedBox(height: 50,),
                ElevatedButton(onPressed: (){
                  setState(() {
                    showUI=!showUI;
                  });
                },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(300,50),
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      )
                    ),

                    child:Text("Say Hi!",
                      style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.bold),
                    ) ),
                  const SizedBox(height: 20,),
                  if(showUI)
                    Container(
                      width: 200,
                      height: 50,

                      decoration:BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: const Center(
                        child: Text("Tuan Khang Hello"))
                    )


              ],
            )
          )
      )

    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
