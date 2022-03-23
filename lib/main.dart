import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:MyFormPage(),
    );
  }
}
enum Gender { male,female }
class MyFormPage extends StatefulWidget{
  @override
  _MyFormPageState createState() =>_MyFormPageState();
}
class _MyFormPageState extends State<MyFormPage>{
  final global_form_key=GlobalKey<FormState>();
  var name="";
  var age="";
  Gender gender=Gender.male;
  bool checkLower=false;
  bool checkUpper=false;
  var seat_available=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("test form"),
        ),

        body:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
              key: global_form_key,
              child: Column(
                children:<Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Enter your Name',
                    ),
                    validator: (value){
                      name=value!;
                      if(value.isEmpty){
                        return 'please enter Correct name';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      hintText: 'Enter your age',
                    ),
                    validator: (value){
                      age=value!;
                      if(value.isEmpty){
                        return 'please enter correct age';
                      }
                      return null;
                    },
                  ),
                  ListTile(
                    title: Text("male"),

                    leading: Radio(
                      value: Gender.male,
                      groupValue: gender,
                      onChanged: (Gender? value) {
                        setState(() {
                          gender=value!;
                        });
                      },

                    ),
                  )
                  ,ListTile(
                    title: Text("female"),

                    leading: Radio(
                      value: Gender.female,
                      groupValue: gender,
                      onChanged: (Gender? value) {
                        setState(() {
                          gender=value!;
                        });
                      },

                    ),
                  ),
                  CheckboxListTile(
                    title: Text("lower"),
                    checkColor: Colors.blueAccent,
                    activeColor: Colors.orange,
                    onChanged: (bool? value) {
                      setState(() {
                        this.checkLower=value!;

                        if(value){
                          seat_available.add('lower');}
                        if(!value){
                         seat_available.remove('lower');
                        }

                      });

                    },
                    value:this.checkLower,
                  ),


                  CheckboxListTile(
                    title: Text("upper"),
                    checkColor: Colors.blueAccent,
                    activeColor: Colors.orange,

                    onChanged: (bool? value) {
                      setState(() {
                        this.checkUpper=value!;
                        if(value){
                          seat_available.add('upper');}
                        if(!value){
                          seat_available.remove('upper');}
                      });

                    },
                    value:this.checkUpper,),

                  TextButton(onPressed:(){

                    var valid = global_form_key.currentState!.validate();
                    if (!valid) {

                      return;
                    }

                    print(name+"\n"+age+"\n"+gender.toString()+"\n"+seat_available.toString());

                  },
                      child: Text("Click to Register"))

                ],
              )
          ),
        )
    );
  }

}
