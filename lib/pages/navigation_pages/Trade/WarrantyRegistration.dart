import 'package:american_quartz/Enums/ViewState.dart';
import 'package:american_quartz/Services/ApiManager.dart';
import 'package:american_quartz/Utils/Logger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'dart:async';
import 'package:image_picker/image_picker.dart';
import '../../utils/demoApi.dart';

class WarrantyRegistration extends StatefulWidget {
  const WarrantyRegistration({key});

  @override
  State<WarrantyRegistration> createState() => _WarrantyRegistrationState();
}

class _WarrantyRegistrationState extends State<WarrantyRegistration> {


  TextEditingController FirstNameController = TextEditingController();
  TextEditingController LastNameController = TextEditingController();
  TextEditingController AddressController = TextEditingController();
  TextEditingController CityController = TextEditingController();
  TextEditingController StateController = TextEditingController();
  TextEditingController ZipController = TextEditingController();
  TextEditingController CountryController = TextEditingController();
  TextEditingController PhoneController = TextEditingController();
  TextEditingController EmailController = TextEditingController();

  TextEditingController ColorController = TextEditingController();
  TextEditingController ProductUsageController = TextEditingController();
  TextEditingController DealerController = TextEditingController();
  TextEditingController BatchSerialNumber = TextEditingController();
  TextEditingController FabricatorInstallerController = TextEditingController();
  TextEditingController datePickerController = TextEditingController();
  TextEditingController datePickerController1 = TextEditingController();
  TextEditingController FabricatorEmailController = TextEditingController();

  TextEditingController OrderSampleController = TextEditingController();

  ViewStateEnum _state = ViewStateEnum.idle;
  ViewStateEnum get state => _state;

  void setLoaderState(ViewStateEnum viewState) {
    if (state != viewState) _state = viewState;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      //   update();
      return;
    });

  }


  String? _dropDownValue;
  String? _dropDownValue1;
  int _groupValue = -1;
  String? radiobutton;
  File? _image;
  final picker = ImagePicker();

 // DemoApi uploadService = DemoApi();



    Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

   // uploadService.uploadImage(pickedFile);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future getImageFromCamera() async {
    //  final pickedFile = await picker.getImage(source: ImageSource.camera);
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    //  ImagePicker().pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  //Show options to get image from camera or gallery
  Future showOptions() async {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            child: Text('Photo Gallery'),
            onPressed: () {
              // close the options modal
              Navigator.of(context).pop();
              // get image from gallery
              getImage();
            },
          ),
          CupertinoActionSheetAction(
            child: Text('Camera'),
            onPressed: () {
              // close the options modal
              Navigator.of(context).pop();
              // get image from camera
              getImageFromCamera();
            },
          ),
        ],
      ),
    );
  }

  // //Image Picker function to get image from gallery
  // Future getImageFromGallery() async {
  //   final pickedFile = await picker.pickImage(source: ImageSource.gallery);
  //  // final pickedFile = await picker.getImage(source: ImageSource.gallery);
  //
  //   setState(() {
  //     if (pickedFile != null) {
  //       _image = File(pickedFile.path);
  //     }
  //   });
  // }
  //
  // //Image Picker function to get image from camera
  // Future getImageFromCamera() async {
  // //  final pickedFile = await picker.getImage(source: ImageSource.camera);
  //   final pickedFile = await picker.pickImage(source: ImageSource.camera);
  //
  // //  ImagePicker().pickImage(source: source);
  //
  //   setState(() {
  //     if (pickedFile != null) {
  //       _image = File(pickedFile.path);
  //     }
  //   });
  // }
  //
  // //Show options to get image from camera or gallery
  // Future showOptions() async {
  //   showCupertinoModalPopup(
  //     context: context,
  //     builder: (context) => CupertinoActionSheet(
  //       actions: [
  //         CupertinoActionSheetAction(
  //           child: Text('Photo Gallery'),
  //           onPressed: () {
  //             // close the options modal
  //             Navigator.of(context).pop();
  //             // get image from gallery
  //             getImageFromGallery();
  //           },
  //         ),
  //         CupertinoActionSheetAction(
  //           child: Text('Camera'),
  //           onPressed: () {
  //             // close the options modal
  //             Navigator.of(context).pop();
  //             // get image from camera
  //             getImageFromCamera();
  //           },
  //         ),
  //       ],
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Warranty Registration",
          style: TextStyle(
              color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: 10.0,right: 10,bottom: 10),
                child: Text("Contact information",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
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
            Container(
                height: 50,
                margin: EdgeInsets.only(left: 10,right: 10),
                child: TextField(
                  controller: AddressController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Address',
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
                  controller: CountryController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Country',
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
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: 10.0,right: 10,bottom: 10),
                child: Text("Product information",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
            SizedBox(height: 2,),
            Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: 10.0,right: 10,bottom: 10),
                child: Text("Color:",style: TextStyle(fontSize: 20),)),
            SizedBox(height: 10,),
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
                items: ['Absolute Noir(6100)','Airy Concrete(4044)','Albero(8330)',"Almond Rocca(9241)",].map(
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
            SizedBox(height: 10,),
            Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: 10.0,right: 10,bottom: 10),
                child: Text("Product Usage:",style: TextStyle(fontSize: 20),)),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 10.0,right: 10),
              child: DropdownButton(
                hint: _dropDownValue1 == null
                    ? Text('----',style: TextStyle(color: Colors.white),)
                    : Text(
                  _dropDownValue1!,
                  style: TextStyle(color: Colors.white),
                ),
                isExpanded: true,
                iconSize: 30.0,
                style: TextStyle(color: Colors.white),
                items: ['Kitchen','Vanity','Other',].map(
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
                      _dropDownValue1 = val as String?;
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 10,),
            Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: 10.0,right: 10,bottom: 10),
                child: Text("Dealer:",style: TextStyle(fontSize: 20),)),
            SizedBox(height: 10,),
            Container(
                height: 50,
                margin: EdgeInsets.only(left: 10,right: 10),
                child: TextField(
                  controller: DealerController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Dealer',
                  ),
                )
            ),
            SizedBox(height: 10,),
            Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: 10.0,right: 10,bottom: 10),
                child: Text("Batch /Serial Number:",style: TextStyle(fontSize: 20),)),
            SizedBox(height: 10,),
            Container(
                height: 50,
                margin: EdgeInsets.only(left: 10,right: 10),
                child: TextField(
                  controller: BatchSerialNumber,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Batch /Serial Number:',
                  ),
                )
            ),
            SizedBox(height: 10,),
            Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: 10.0,right: 10,bottom: 10),
                child: Text("Fabricator / Installer:",style: TextStyle(fontSize: 20),)),
            SizedBox(height: 10,),
            Container(
                height: 50,
                margin: EdgeInsets.only(left: 10,right: 10),
                child: TextField(
                  controller: FabricatorInstallerController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Fabricator / Installer:',
                  ),
                )
            ),
            SizedBox(height: 10,),
            Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: 10.0,right: 10,bottom: 10),
                child: Text("Purchase Date:",style: TextStyle(fontSize: 20),)),
          //  SizedBox(height: 5,),
            Container(
                 alignment: Alignment.topLeft,
                 padding: const EdgeInsets.only(left: 10.0,right: 10,bottom: 10),
                 child: TextField(
                       controller: datePickerController,
                       readOnly: true,
                           decoration:
                           const InputDecoration(hintText: "Click here to select date",hintStyle: TextStyle(color: Colors.white), suffixIcon: Icon(
                               Icons.calendar_today,),
                           ),
                       onTap: () => onTapFunction(context: context),
                     ),
               ),
            SizedBox(height: 10,),
            Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: 10.0,right: 10,bottom: 10),
                child: Text("Install Date:",style: TextStyle(fontSize: 20),)),
            //  SizedBox(height: 5,),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(left: 10.0,right: 10,bottom: 10),
              child: TextField(
                controller: datePickerController1,
                readOnly: true,
                decoration:
                const InputDecoration(hintText: "Click here to select date",hintStyle: TextStyle(color: Colors.white), suffixIcon: Icon(
                  Icons.calendar_today,),
                ),
                onTap: () => onTapFunction1(context: context),
              ),
            ),
            SizedBox(height: 10,),
            Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: 10.0,right: 10,bottom: 10),
                child: Text("Fabricator Email:",style: TextStyle(fontSize: 20),)),
            SizedBox(height: 10,),
            Container(
                height: 50,
                margin: EdgeInsets.only(left: 10,right: 10),
                child: TextField(
                  controller: FabricatorEmailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Fabricator Email',
                  ),
                )
            ),
            SizedBox(height: 10,),
            Column(
              children: [
                Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(left: 10.0,right: 10,bottom: 10),
                    child: Text("Did you order a sample from American Quartz in the past?",style: TextStyle(fontSize: 20 ),)),
                RadioListTile(

                  title: Text("Yes"),
                  value: "Yes",
                  groupValue: radiobutton,
                  onChanged: (value){
                    setState(() {
                      radiobutton = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  title: Text("No"),
                  value: "No",
                  groupValue: radiobutton,
                  onChanged: (value){
                    setState(() {
                      radiobutton = value.toString();
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 10,),
            Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: 10.0,right: 10,bottom: 10),
                child: Text("Upload Product Picture",style: TextStyle(fontSize: 20),)),
            SizedBox(height: 5,),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(left: 10.0,right: 10,bottom: 10),
              child: Row(
                children: [
                  ElevatedButton(
                    child: Text('Choose File'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      //backgroundColor: Colors.green,
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(1))),
                    ),
                    onPressed: getImage,
                    //showOptions,
                  ),
                  SizedBox(width: 2,),
                  _image == null
                      ? Text('No image Name.')
                      : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //  Image.file(_image!),
                      //  SizedBox(height: 20),
                      Text(_image!.path.split('/').last,style: TextStyle(fontSize: 12),), // Display image name
                    ],
                  ),
                ],
              ),
            ),
            // Center(
            //   child: _image == null ? Text('No Image selected') : Image.file(_image!),
            // ),
            Container(
              width: 200,
              child: ElevatedButton(
                onPressed: (){
                  warrantyRegistrationUser();
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

//  TextEditingController datePickerController = TextEditingController();
  onTapFunction({required BuildContext context}) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      lastDate: DateTime.now(),
      firstDate: DateTime(2015),
      initialDate: DateTime.now(),
    );
    if (pickedDate == null) return;
    datePickerController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
  }

 // TextEditingController datePickerController1 = TextEditingController();
  onTapFunction1({required BuildContext context}) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      lastDate: DateTime.now(),
      firstDate: DateTime(2015),
      initialDate: DateTime.now(),
    );
    if (pickedDate == null) return;
    datePickerController1.text = DateFormat('yyyy-MM-dd').format(pickedDate);
  }


  void warrantyRegistrationUser() {
    print("testing order");
    warrantyRegistrationUserApiCall();
  }

  void warrantyRegistrationUserApiCall() {
    print("testing1");
    //isValidInput();

    print("testing2");
    setLoaderState(ViewStateEnum.busy);
    try {
      print("testing3");
      ApiManager.get()
          .warrantyRegistrationUser(FirstNameController.text, LastNameController.text,
        AddressController.text, CityController.text,StateController.text,ZipController.text,
        CountryController.text, PhoneController.text, EmailController.text.trim(),DealerController.text,
        BatchSerialNumber.text, FabricatorInstallerController.text,FabricatorEmailController.text.trim(),
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



