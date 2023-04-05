
import 'package:flutter/material.dart';
import 'package:listviewbuilderpay/RESULT.dart';
class Caluculation extends StatefulWidget {
  const Caluculation({Key? key}) : super(key: key);

  @override
  State<Caluculation> createState() => _CaluculationState();
}

class _CaluculationState extends State<Caluculation> {
  double slidervalue=0;
  double Tip=0;
  String t1="";
  String tax="";

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(alignment: Alignment.bottomLeft,
                child: Text("Split Bill",style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),),
              ),
          Card(

            color: Colors.blueGrey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Total",style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),),

                      Text("\$$t1",style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),),
                    ],
                  ),
                  SizedBox(width: 40,),
                  Row(
                    children: [
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Friends",style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),),
                          SizedBox(height: 5,),
                          Text("Tax",style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),),
                          SizedBox(height: 5,),
                          Text("Tip",style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),),
                        ],),
                      SizedBox(width: 40,),
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${slidervalue.round()}",style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),),
                          SizedBox(height: 5,),
                          Text("$tax",style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),),
                          SizedBox(height: 5,),
                          Text("\$$Tip",style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),),
                        ],),
                    ],
                  ),
                ],
              ),
            ),
          ),
              Text("How Many Friends ?",style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: Colors.black,
              ),),
              Slider(
                  min: 0,max: 100,
                  // divisions: 10,
                  value: slidervalue,
                  inactiveColor: Colors.orangeAccent,
                  activeColor: Colors.black,


                  onChanged:(newValue){
                setState(() {
                  slidervalue=newValue;
                });
              }),
              Row(
                children: [
                  Expanded(flex: 5,
                    child: Card(
                      color: Colors.brown,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FloatingActionButton.small(onPressed: (){
                              setState(() {
                                Tip--;

                              });
                            },child:Icon(Icons.remove),backgroundColor: Colors.orangeAccent,),
                            Column(children: [
                              Text("Tip",style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),),
                              SizedBox(height: 12,),
                              Text("\$$Tip",style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),),
                            ],),
                            FloatingActionButton.small(onPressed: (){
                              setState(() {
                                Tip++;
                              });
                            },child: Icon(Icons.add),backgroundColor: Colors.orangeAccent,),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Expanded(flex: 3,
                    child: Card(
                      color: Colors.brown,
                      child: TextField(
                        decoration: InputDecoration(

                          labelText: "Tax in %",
                          contentPadding: EdgeInsets.symmetric(vertical: 35),
                          border: OutlineInputBorder(),

                        ),
                       onChanged: (value){
                          setState(() {
                            tax=value;
                          });
                       },

                      ),

                    ),
                  ),
                ],
              ),
SizedBox(height: 20,),
Row(children: [

  app("1"),

  app("2"),

  app("3"),

],),
  Row(children: [
        app("4"),
        app("5"),
        app("6"),
  ],),
     Row(children: [
         app("7"),
         app("8"),
         app("9"),
     ],) ,

        Row(
          children: [
            app("."),
            app("0"),
            app("-"),
          ],
        ),
           SizedBox(height: 20,),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: SizedBox(
               width: double.infinity,
               height: 70,
               child: ElevatedButton(onPressed: (){


                 Navigator.push(context, MaterialPageRoute(builder: (context)=>Pay(slidervalue,Tip,t1,tax)));
               },style: ButtonStyle(
                 backgroundColor: MaterialStateProperty.all(Colors.black38),
               ), child: Text("SplitBill",style: TextStyle(
                 fontSize: 35,
                 fontWeight: FontWeight.bold,
               ),)),
             ),
           ),
  ],  ),
        ),
      ),
    );
  }
  Expanded app(String d){
    return
        Expanded(child: ButtonTheme(height: 100,
          child: SizedBox(height: 100,
            width: 15,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlinedButton(onPressed: (){
                setState(() {
                  t1+=d;

                });

              }, style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
              ),child: Text(d,style: TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),),),
            ),
          ),
        ));
  }
}

