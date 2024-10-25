import 'package:flutter/material.dart';

class BmiHomePage extends StatefulWidget {
  const BmiHomePage({super.key});

  @override
  State<StatefulWidget> createState() => _BmiHomePageState();
}

class _BmiHomePageState extends State<BmiHomePage> {
  final weightController = TextEditingController();
  final footController = TextEditingController();
  final inchController = TextEditingController();

  var result = "";

  var bgColors = Colors.grey.shade200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bmi App'),
        centerTitle: true,
        backgroundColor: bgColors,
      ),
      body: Container(
        color: bgColors,
        child: Center(
          child: Container(
            width: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                    text: TextSpan(
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.cyanAccent),
                        children: <TextSpan>[
                          TextSpan(
                              text: "BMI",
                              style: TextStyle(
                                  fontSize: 48,
                                  fontFamily: 'font1',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red))
                        ],
                        text: "Hello ")),
                SizedBox(
                  height: 48,
                ),
                TextField(
                  controller: weightController,
                  keyboardType: TextInputType.number,
                  maxLines: 1,
                  decoration: InputDecoration(
                      // label: Text('hello'),
                      hintStyle: TextStyle(fontSize: 18),
                      hintText: "Enter your Weight in KG",
                      prefixIcon: Icon(
                        Icons.monitor_weight_rounded,
                        color: Colors.cyan,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      alignLabelWithHint: true,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 4),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      )),
                ),
                SizedBox(
                  height: 12,
                ),
                TextField(
                  controller: footController,
                  keyboardType: TextInputType.number,
                  maxLines: 1,
                  decoration: InputDecoration(
                      // label: Text('hello'),
                      hintStyle: TextStyle(fontSize: 18),
                      hintText: "Enter your Height in Feet",
                      prefixIcon: Icon(
                        Icons.height_rounded,
                        color: Colors.cyan,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      alignLabelWithHint: true,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.green,
                          width: 4,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      )),
                ),
                SizedBox(
                  height: 12,
                ),
                TextField(
                  controller: inchController,
                  keyboardType: TextInputType.number,
                  maxLines: 1,
                  decoration: InputDecoration(
                      // label: Text('hello'),
                      hintStyle: TextStyle(fontSize: 18),
                      hintText: "Enter your Height in Feet",
                      prefixIcon: Icon(
                        Icons.height_rounded,
                        color: Colors.cyan,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      alignLabelWithHint: true,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 4),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      )),
                ),
                SizedBox(
                  height: 24,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        shadowColor: Colors.grey,
                        elevation: 5,
                      ),
                      onPressed: () {
                        var weightInKG = weightController.text.toString();
                        var heightInFeet = footController.text.toString();
                        var heightInInch = inchController.text.toString();

                        if (weightInKG != "" &&
                            heightInFeet != "" &&
                            heightInInch != "") {
                          // BMI Calculation.

                          var inWeightInKG = int.parse(weightInKG);
                          var inHeightInFeet = int.parse(heightInFeet);
                          var inHeightInInch = int.parse(heightInInch);

                          var heightInInchs =
                              (inHeightInFeet * 12) + inHeightInInch;

                          var heightInCm = heightInInchs * 2.54;

                          var heightInMeter = heightInCm / 100;

                          var bmi =
                              inWeightInKG / (heightInMeter * heightInMeter);

                          var message;

                          if (bmi > 25) {
                            message = "You are OverWeight!! ";
                            bgColors = Colors.orange;
                          } else if (bmi < 18) {
                            message = "You are UnderWeight!!";
                            bgColors = Colors.red;
                          } else {
                            message = "You are Healthy!!";
                            bgColors = Colors.green;
                          }

                          setState(() {
                            result =
                                "$message \n Your BMI is : ${bmi.toStringAsFixed(3)}";
                          });

                          print(result);

                          weightController.clear();
                          footController.clear();
                          inchController.clear();
                        } else {
                          setState(() {
                            result = "Please fill all the required Fields";
                          });
                        }
                      },
                      child: Text(
                        ' Click  to Calculate',
                        style: TextStyle(
                          color: Colors.yellow,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      )),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  result,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
