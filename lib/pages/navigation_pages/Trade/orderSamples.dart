import 'package:american_quartz/Enums/ViewState.dart';
import 'package:american_quartz/Services/ApiManager.dart';
import 'package:american_quartz/Utils/Logger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class OrderSamples extends StatefulWidget {
  const OrderSamples({key});

  @override
  State<OrderSamples> createState() => _OrderSamplesState();
}

class _OrderSamplesState extends State<OrderSamples> {
  String? _dropDownValue;

  TextEditingController Color1Controller = TextEditingController();
  TextEditingController Color2Controller = TextEditingController();
  TextEditingController Color3Controller = TextEditingController();

  TextEditingController FirstNameController = TextEditingController();
  TextEditingController LastNameController = TextEditingController();
  TextEditingController EmailController = TextEditingController();
  TextEditingController CompanyController = TextEditingController();
  TextEditingController BusinessController = TextEditingController();
  TextEditingController SynopsisController = TextEditingController();
  TextEditingController PhoneController = TextEditingController();

  TextEditingController StreetController = TextEditingController();
  TextEditingController CityController = TextEditingController();
  TextEditingController ZipController = TextEditingController();
  TextEditingController StateController = TextEditingController();
  TextEditingController CountryController = TextEditingController();

  ViewStateEnum _state = ViewStateEnum.idle;
  ViewStateEnum get state => _state;

  void setLoaderState(ViewStateEnum viewState) {
    if (state != viewState) _state = viewState;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      //   update();
      return;
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Order Samples",
          style: TextStyle(fontFamily: 'RaleWay', color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: 10.0,right: 10,bottom: 10),
                child: Text("Professional Information",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
            Padding(
              padding: const EdgeInsets.only(left: 10.0,right: 10),

              child: DropdownButton(
                hint: _dropDownValue == null
                    ? Text('----',style: TextStyle(color: Colors.white),)
                    : Text(
                        _dropDownValue!,
                        style: TextStyle(color: Colors.white),
                      ),
                isExpanded: true,
                iconSize: 30.0,
                style: TextStyle(color: Colors.white),
                items: ['Homeowner','Architects & Building Designer','Designer-Build Firm',"General Contractor","Home Builder","Interior Designers & Decorator",'Kitchen & Bath Designer','Kitchen & Bath Remodeler'].map(
                  (val) {
                    return DropdownMenuItem<String>(
                      value: val,
                      child: Text(val),
                    );
                  },
                ).toList(),
                onChanged: (val) {
                  setState(
                    () {
                      _dropDownValue = val as String?;
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 5,),
            Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: 10.0,right: 10,bottom: 10),
                child: Text("Color Name",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
            SizedBox(height: 2,),
            Container(

                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: 10.0,right: 10,bottom: 10),
                child: Text("Color1:",style: TextStyle(fontSize: 22),)),
            Container(
              height: 50,
                margin: EdgeInsets.only(left: 10,right: 10),
                child: TextField(
                  controller: Color1Controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  //  labelText: 'User Name',
                  ),
                )
            ),
            SizedBox(height: 5,),
            Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: 10.0,right: 10,bottom: 10),
                child: Text("Color2:",style: TextStyle(fontSize: 22),)),
            Container(
                height: 50,
                margin: EdgeInsets.only(left: 10,right: 10),
                child: TextField(
                  controller: Color2Controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    //  labelText: 'User Name',
                  ),
                )
            ),
            SizedBox(height: 5,),
            Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: 10.0,right: 10,bottom: 10),
                child: Text("Color3:",style: TextStyle(fontSize: 22),)),
            Container(
                height: 50,
                margin: EdgeInsets.only(left: 10,right: 10),
                child: TextField(
                  controller: Color3Controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    //  labelText: 'User Name',
                  ),
                )
            ),
            SizedBox(height: 7,),
            Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: 10.0,right: 10,bottom: 10),
                child: Text("Contact information",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
            SizedBox(height: 2,),
            Container(
              height: 50,
                margin: EdgeInsets.only(left: 10,right: 10),
                child: TextField(
                  controller: FirstNameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'First Name',
                  ),
                )
            ),
            SizedBox(height: 10,),
            Container(
                height: 50,
                margin: EdgeInsets.only(left: 10,right: 10),
                child: TextField(
                  controller: LastNameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Last Name',
                  ),
                )
            ),
            SizedBox(height: 10,),
            Container (
                height: 50,
                margin: EdgeInsets.only(left: 10,right: 10),
                child: TextField(
                  controller: EmailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                )
            ),
            SizedBox(height: 10,),
            Container(
                height: 50,
                margin: EdgeInsets.only(left: 10,right: 10),
                child: TextField(
                  controller: CompanyController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Company',
                  ),
                )
            ),
            SizedBox(height: 10,),
            Container(
                height: 50,
                margin: EdgeInsets.only(left: 10,right: 10),
                child: TextField(
                  controller: BusinessController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Business Website',
                  ),
                )
            ),
            SizedBox(height: 10,),
            Container(
                height: 50,
                margin: EdgeInsets.only(left: 10,right: 10),
                child: TextField(
                  controller: SynopsisController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Synopsis',
                  ),
                )
            ),
            SizedBox(height: 10,),
            Container(
                height: 50,
                margin: EdgeInsets.only(left: 10,right: 10),
                child: TextField(
                  controller: PhoneController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Phone',
                  ),
                )
            ),
            SizedBox(height: 10,),
            Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: 10.0,right: 10,bottom: 10),
                child: Text("Address",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
            Container(
                height: 50,
                margin: EdgeInsets.only(left: 10,right: 10),
                child: TextField(
                  controller: StreetController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Street',
                  ),
                )
            ),
            SizedBox(height: 10,),
            Container(
                height: 50,
                margin: EdgeInsets.only(left: 10,right: 10),
                child: TextField(
                  controller: CityController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'City',
                  ),
                )
            ),
            SizedBox(height: 10,),
            Container(
                height: 50,
                margin: EdgeInsets.only(left: 10,right: 10),
                child: TextField(
                  controller: ZipController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Zip',
                  ),
                )
            ),
            SizedBox(height: 10,),
            Container(
                height: 50,
                margin: EdgeInsets.only(left: 10,right: 10),
                child: TextField(
                  controller: StateController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'State',
                  ),
                )
            ),
            SizedBox(height: 10,),
            Container(
                height: 50,
                margin: EdgeInsets.only(left: 10,right: 10),
                child: TextField(
                  controller: CountryController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Country',
                  ),
                )
            ),
            SizedBox(height: 10,),
            Container(width: 200,
              child: ElevatedButton(
                onPressed: (){
                  orderSamplesUser();
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.green,
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(1))),
                ),
                child: Text('SEND '),
              ),
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }

  void orderSamplesUser() {
    print("testing order");
    orderSamplesUserApiCall();
  }

  void orderSamplesUserApiCall() {
    print("testing1");
    //isValidInput();

      print("testing2");
      setLoaderState(ViewStateEnum.busy);
      try {
        print("testing3");
        ApiManager.get()
            .orderSamplesUser(Color1Controller.text, Color2Controller.text,
          Color3Controller.text, FirstNameController.text,LastNameController.text,
          EmailController.text.trim(), CompanyController.text, BusinessController.text,SynopsisController.text,PhoneController.text,
          StreetController.text, CityController.text, ZipController.text,StateController.text,CountryController.text,
        )
            .then((response) async {
          if (response.isOk() && response.body.isSuccess()) {
            setLoaderState(ViewStateEnum.idle);
            // showMessageInSnackBar(response.body.getMessage(), false);
            //  showMessageInSnackBar(response.body.getMessage(), false);
            SnackBar(
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height - 100,
                left: 10,
                right: 10,
              ),
              content: Text(response.body.getMessage()),
              backgroundColor: Colors.green,
              behavior: SnackBarBehavior.floating,
              dismissDirection: DismissDirection.up,
              action: SnackBarAction(
                backgroundColor: Colors.black,
                label: 'Dismiss',
                //  disabledTextColor: Colors.white,
                textColor: Colors.white,
                onPressed: () {
                  //Do whatever you want
                },
              ),
            );
            // ScaffoldMessenger.of(context).showSnackBar(snackBar);

          } else {
            setLoaderState(ViewStateEnum.idle);
            // showMessageInSnackBar(response.body.getMessage(), false);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.green,
                content:  Text(response.body.getMessage()),
                behavior: SnackBarBehavior.floating,
                margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height - 100,
                  left: 20,
                  right: 20,
                ),
              ),
            );
          }
        });
      } catch (e) {
        setLoaderState(ViewStateEnum.idle);
        Logger.get().log(e);
      }
    }
}
