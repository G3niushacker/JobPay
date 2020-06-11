import 'package:flutter/material.dart';
import 'package:flutter_country_picker/flutter_country_picker.dart';
import 'package:invest/Screens/MyProfile.dart';
import 'package:invest/modals/constrains.dart';
import 'package:invest/modals/lists.dart';


class AcadmicInformation extends StatefulWidget {
  @override
  _AcadmicInformationState createState() => _AcadmicInformationState();
}
Constrains constrains = Constrains();
ListModel listModel = ListModel();
class _AcadmicInformationState extends State<AcadmicInformation> {
  String name;
  String cNIC;
  String city;
  Country _country;
  String yEar = "year";
  String institue;
  String degreeLevel;
  String majorSubject;

  @override
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
              padding: const EdgeInsets.only(top:40.0,left: 10.0,bottom: 40.0),
              child: Container(
                child: Text("Academic Information",style: constrains.infoScreenTitle,),
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
                      hintText: "Degree Level",
                      icon: Icon(Icons.arrow_upward)
                  ),
                  onSaved: (val){
                    degreeLevel = val;
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
                      hintText: "Major Subject",
                      icon: Icon(Icons.subject)
                  ),
                  onSaved: (val){
                    majorSubject = val;
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
                      hintText: "Institution",
                      icon: Icon(Icons.school)
                  ),
                  onSaved: (val){
                    institue = val;
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

//            Padding(
//              padding: const EdgeInsets.all(10.0),
//              child: Container(
//                padding: EdgeInsets.only(left: 20),
//                decoration: BoxDecoration(
//                  border: Border.all(
//                    color: Colors.grey,
//                  ),
//                  borderRadius: BorderRadius.circular(100),
//                ),
//                child: DropdownButton<String>(
//                  value: yEar,
//                  items: years.map((String dropDownItems){
//                    return DropdownMenuItem<String>(
//                        value: dropDownItems,
//                        child: Text(dropDownItems));
//                  }).toList(),
//                  onChanged: (String newValueSelected){
//                    setState(() {
//                      yEar = newValueSelected;
//                    });
//                  },
//                )
//              ),
//            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: MaterialButton(
                    shape: StadiumBorder(),
                    onPressed: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) => MyProfile()
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

