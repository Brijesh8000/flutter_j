import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'YOUR BMI CALCULATOR'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var wtController= TextEditingController();
  var ftController= TextEditingController();
  var inController= TextEditingController();
  var result="";
  var bg_color;
  var msg=" ";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body:Container(
        color: bg_color,
        child: Center(
          child: Container(

            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('BMI',style: TextStyle(
                  fontSize: 34,  fontWeight: FontWeight.w700
                ),),
                TextField(
                  controller: wtController ,
                  decoration: InputDecoration(
                    label: Text('Enter your Weight '),
                    prefixIcon: Icon(Icons.line_weight)

                  ),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: ftController ,
                  decoration: InputDecoration(
                      label: Text('Enter your Height in feet '),
                      prefixIcon: Icon(Icons.height)

                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 21,),
                TextField(
                  controller: inController ,
                  decoration: InputDecoration(
                      label: Text('Enter your age '),
                      prefixIcon: Icon(Icons.line_weight)

                  ),
                  keyboardType: TextInputType.number,
                ),
                ElevatedButton(onPressed:() {
                  var wt=wtController.text.toString();
                  var ft= ftController.text.toString();
                  var inch=inController.text.toString();
                  if(wt!="" && ft!="" && inch!=""){
                    //BMI Calculate
                    var iwt=int.parse(wt);
                    var ift=int.parse(ft);
                    var iInch=int.parse(inch);

                    var tinch=(ift*12)*iInch;
                    var tCm=tinch*2.54;
                    var tM= tCm/100;
                    var bmi=iwt/(tM*tM);



                    if(bmi>25){
                      var msg ="Your are over weight ";
                      bg_color=Colors.orange.shade200;



                    }else if (bmi<18){
                      var msg ="Your are  Underweight ";

                      bg_color=Colors.red.shade200;

                    }else{
                      var msg ="Your are Healthy ";
                      bg_color=Colors.green.shade200;

                    }


                    setState(() {
                      result=" $msg  \n you BMI Is ${bmi.toStringAsExponential(2)}";
                    });


                  } else{
                    setState(() {
                      result="plz fill the all reqarement ";
                    });

                  }
                }, child: Text('Calculate')),
                SizedBox(height: 19,),
                Text(result,style: TextStyle(fontSize: 19),)

              ],
            ),
          ),
        ),
      )
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
