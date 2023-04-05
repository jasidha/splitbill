import 'package:flutter/material.dart';
import 'package:listviewbuilderpay/pay2.dart';
class Pay extends StatefulWidget {


  double slider;
  double ti;
  String total;
  String  tax2;
  Pay(this.slider,this.ti,this.total,this.tax2);

  @override
  State<Pay> createState() => _PayState();
}
class _PayState extends State<Pay> {
  double finalamount=0;
  @override
  void initState() {

    super.initState();
    calculation();
  }
  void calculation(){
    double taxamount=(double.parse(widget.total)*double.parse(widget.tax2))/100;
    double finalbill=(double.parse(widget.total)+taxamount+widget.ti)/widget.slider;
    setState(() {
      finalamount=finalbill;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(alignment: Alignment.topLeft,
              child: Text("Result",style: TextStyle(
                fontSize: 55,
                fontWeight: FontWeight.bold,
                color: Colors.black,

              ),),
            ),
            SizedBox(height:12,),
            Card(
              color: Colors.blueGrey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Egually Devided",style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),),

                          Text("\$$finalamount",style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),),
                        ],
                      ),
                    ),
                    SizedBox(width: 40,),
                    Row(
                      children: [
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Friends",style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),),
                            SizedBox(height: 5,),
                            Text("Tax",style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),),
                            SizedBox(height: 5,),
                            Text("Tip",style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),),
                          ],),
                        SizedBox(width: 40,),
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                              Text("${widget.slider.toStringAsFixed(2)}",style: TextStyle(
                                fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),),
                            SizedBox(height: 5,),
                            Text("${widget.tax2}",style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),),
                            SizedBox(height: 5,),
                            Text("\$${widget.ti}",style: TextStyle(
                              fontSize: 14,
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
            SizedBox(height:20 ,),
            Text("Everybody Should Pay \$$finalamount",style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),),
            SizedBox(height: 20,),

            SizedBox(width: double.infinity,
              height: 70,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Caluculation()));

                },style:ButtonStyle (
                  backgroundColor: MaterialStateProperty.all(Colors.blueGrey),

                ), child: Text("Calculate Again?",style: TextStyle(
                  fontSize: 35,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,

                ),)),
              ),
            ),

          ],),
      ),
    );
  }


}

