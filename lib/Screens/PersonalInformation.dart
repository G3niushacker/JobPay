import 'package:flutter/material.dart';
import 'package:flutter_country_picker/flutter_country_picker.dart';
import 'package:invest/Screens/BottomNavBar.dart';
import 'package:invest/modals/constrains.dart';


class PersonalInformation extends StatefulWidget {
  @override
  _PersonalInformationState createState() => _PersonalInformationState();
}
Constrains constrains = Constrains();
class _PersonalInformationState extends State<PersonalInformation> {

  String name;
  String city;
  String cNIC;
  Country _country;

  @override
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top:100.0,left: 10.0,bottom: 40.0),
              child: Container(
                child: Text("Personal Information",style: constrains.infoScreenTitle,),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                padding: EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Name",
                      icon: Icon(Icons.edit)
                  ),
                  onSaved: (val){
                    name = val;
                  },
                  validator: (String value){
                    if(value.isEmpty){
                      return "Name is required";
                    }else{
                      return null;
                    }
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                padding: EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "CNIC",
                      icon: Icon(Icons.credit_card)
                  ),
                  onSaved: (val){
                    cNIC = val;
                  },
                  validator: (String value){
                    if(value.isEmpty){
                      return "CNIC is required";
                    }else{
                      return null;
                    }
                  },
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top:8.0,left: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text("Country"),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: 50,
                        padding: EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: CountryPicker(
                          dense: false,
                          showFlag: true,  //displays flag, true by default
                          showDialingCode: false, //displays dialing code, false by default
                          showName: true, //displays country name, true by default
                          showCurrency: false, //eg. 'British pound'
                          showCurrencyISO: false, //eg. 'GBP'
                          onChanged: (Country country) {
                            setState(() {
                              _country = country;
                            });
                          },
                          selectedCountry: _country,
                        )
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                padding: EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "City",
                      icon: Icon(Icons.location_city)
                  ),
                  onSaved: (val){
                    city = val;
                  },
                  validator: (String value){
                    if(value.isEmpty){
                      return "City is required";
                    }else{
                      return null;
                    }
                  },
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: MaterialButton(
                    shape: StadiumBorder(),
                    onPressed: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) => BottomNavBar()
                      ));
                    },
                    height: 50.0,
                    minWidth: MediaQuery.of(context).size.width,
                    color: constrains.blueclr,
                    child: Text("Continue")
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
