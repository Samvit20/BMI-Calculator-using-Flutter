import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'results_page.dart';
import 'bottom_button.dart';
import 'round_icon_button.dart';
import 'calculator_brain.dart';


enum Gender{
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender;
  int height=180;
  int weight=60;
  int age=18;

//  Color maleCardColour=inactiveCardColour;
//  Color femaleCardColour=inactiveCardColour;

//  void updateColour(Gender selectedGender){
//    if(selectedGender==Gender.male){
//      if(maleCardColour==inactiveCardColour){
//        maleCardColour=activeCardColour;
//        femaleCardColour=inactiveCardColour;
//      }
//      else{
//        maleCardColour=inactiveCardColour;
//      }
//    }
//    if(selectedGender==Gender.female){
//      if(femaleCardColour==inactiveCardColour){
//        femaleCardColour=activeCardColour;
//        maleCardColour=inactiveCardColour;
//      }
//      else{
//        femaleCardColour=inactiveCardColour;
//      }
//    }
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender=Gender.male;
                      });
                    },
                    cardChild: IconContent(icon: FontAwesomeIcons.mars, label: 'MALE',),
                      colour: selectedGender==Gender.male ? kActiveCardColour : kInactiveCardColour,
                  ),
                ),
                Expanded(
                child: ReusableCard(
                  onPress: (){
                    setState(() {
                      selectedGender=Gender.female;
                    });
                  },
                  cardChild: IconContent(icon: FontAwesomeIcons.venus, label: 'FEMALE',),
                    colour: selectedGender==Gender.female ? kActiveCardColour : kInactiveCardColour,
                )
                )
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
                colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('HEIGHT',
                  style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: Color(0xFFEB1555),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      overlayColor: Color(0x29EB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 25),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 100,
                      max: 220,
                      onChanged: (double newValue){
                        setState(() {
                          height=newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('WEIGHT',
                        style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                      colour: kActiveCardColour
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('AGE',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: (){
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: (){
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                      colour: kActiveCardColour
                  ),
                ),
              ],
            ),
          ),
          BottomButton(buttonTitle: 'CALCULATE',
          onTap: (){

            CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);

            Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=>ResultsPage(
                  bmiResult: calc.calculatBMI(),
                  resultText: calc.getResult(),
                  interpretation: calc.getInterpretation(),
                )));
          },),
        ],
      ),
    );
  }
}





