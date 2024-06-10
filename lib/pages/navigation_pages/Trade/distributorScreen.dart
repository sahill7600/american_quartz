import 'package:american_quartz/Enums/ViewState.dart';
import 'package:american_quartz/Services/ApiManager.dart';
import 'package:american_quartz/Utils/Logger.dart';
import 'package:american_quartz/Utils/Utils.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';
import '../../utils/common.dart';


class Distributor extends StatefulWidget {
  const Distributor({key});

  @override
  State<Distributor> createState() => _DistributorState();
}

class _DistributorState extends State<Distributor> {

  ViewStateEnum _state = ViewStateEnum.idle;
  ViewStateEnum get state => _state;

  void setLoaderState(ViewStateEnum viewState) {
    if (state != viewState) _state = viewState;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
   //   update();
      return;
    });

  }

  TextEditingController NameController = TextEditingController();
  TextEditingController EmailController = TextEditingController();
  TextEditingController SubjectController = TextEditingController();
  TextEditingController MessageController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Distributor",
            style: TextStyle(fontFamily: 'RaleWay', color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
            padding: EdgeInsets.only(left: 7.0, right: 7.0, top: 25.0),
            child: Card(color: Colors.white24,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 2,
                // margin: EdgeInsets.all(19),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text('Send us a message',
                              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold))),
                      Divider(),
                      Container(
                          margin: EdgeInsets.only(left: 20,right: 20,top: 10),
                          child: TextField(
                            controller: NameController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'User Name',
                            ),
                          )
                      ),
                      Container(

                          margin: EdgeInsets.only(left: 20,right: 20,top: 10),
                          child: TextField(
                            controller: EmailController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Email',
                            ),
                          )
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 20,right: 20,top: 10),
                          child: TextField(
                            controller: SubjectController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Subject',
                            ),
                          )
                      ),
                      Container(
                        height: 100,
                          margin: EdgeInsets.only(left: 20,right: 20,top: 10),
                          child: TextField(
                              controller: MessageController,
                            maxLines: null,
                            expands: true,
                              decoration: InputDecoration(filled: true,fillColor: Colors.transparent,
                                border: OutlineInputBorder(),
                                labelText: 'Enter a message',
                              )
                          )
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),),
                          // Divider(),
                          ElevatedButton(
                            onPressed: (){
                              distributorUser();
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white, backgroundColor: Colors.green,
                              shape: BeveledRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(1))),
                            ),
                            child: Text('SEND A MESSAGE '),
                          ),
                          // ElevatedButton(
                          //   onPressed: (){},
                          //   style: ElevatedButton.styleFrom(
                          //     foregroundColor: Colors.white, backgroundColor: Colors.red, // foreground
                          //   ),
                          //   child: Text('SEND A MESSAGE'),
                          // ),
                           Divider(),
                          SizedBox(height: 8,),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    _makeEmail("info@americanquartzusa.com");
                                  },
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.mail,
                                      ),
                                      SizedBox(width: 15),
                                      Text(
                                        "info@americanquartzusa.com",
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: "Futura",
                                            fontSize: 18),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: GestureDetector(
                              onTap: () {
                                _makePhoneCall("1877-553-2323");
                              },
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.call,
                                      ),
                                      SizedBox(width: 15),
                                      Text(
                                        "1877-553-2323",
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: "Futura",
                                            fontSize: 18),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10),

                        ],
                      ),
                    ],
                  ),
                )
            )
        )
    );
  }
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  Future<void> _makeEmail(String email) async {
    final Uri launchUri = Uri(
      scheme: 'mailto',
      path: email,
    );
    await launchUrl(launchUri);
  }


  bool isValidInput() {
    String message = "";
    bool isValid;
    if (NameController.text.isEmpty) {
     // showMessageInSnackBar("Please enter a Name", true);
      showSnackBar(context);
      Logger.get().log("name");
      print("testing6");
      isValid = false;
    } else if (EmailController.text.isEmpty) {
    //  showMessageInSnackBar("Please enter a Email", true);
      showSnackBarEmail(context);
      isValid = false;
    } else if (EmailController.text.isNotEmpty &&
        !Utils.isValidateEmail(EmailController.text.toString())) {
      // showMessageInSnackBar(
      //     "${"Please enter a email address"}", true);
      showSnackBarEmailValid(context);
      Logger.get().log("email");
      isValid = false;
    } else if (SubjectController.text.isEmpty) {
     // showMessageInSnackBar("Please enter a Subject", true);
      showSnackBarSub(context);
      Logger.get().log("subject");
      print("testing7");
      isValid = false;
    }
    else if (MessageController.text.isEmpty) {
     // showMessageInSnackBar("Please enter a Message", true);
      showSnackBarMes(context);
      isValid = false;
      Logger.get().log("message");
    }    else {
      isValid = true;
    }

    if (message != "") {
      showMessageInSnackBar(message, false);
    }

    return isValid;
  }

  inputValidation(){
  //  bool isValid;
    var myPass = NameController.text;
    var myemail = EmailController.text;
    var mycompnyName = SubjectController.text;
    var position = MessageController.text;

    if (myPass.isEmpty) {
    //  isValid = false;
      showToast("Please enter a Name");
    } else if (myemail.isEmpty) {
      //isValid = false;
    showToast("Please enter a Email");
    } else if (!RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(myemail)) {
      showToast("Please enter valid Email Id");
    } else if (mycompnyName.isEmpty) {
      //isValid = false;
    showToast("Please enter a Subject");
    } else if (position.isEmpty) {
      showToast("Please enter a Message");
    } else {
      showAlertDialog(context);
      // sendRequestRegister(myPass, myemail,mycompnyName, position);
      print("testing2");
     // return isValid;
    }
   // return isValid;

  }
  void showSnackBar(BuildContext context) {
    final snackBar = SnackBar(
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height - 100,
        left: 10,
        right: 10,
      ),
      content: Text('Please enter a Name'),
      backgroundColor: Colors.red,
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
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
 }
  void showSnackBarEmail(BuildContext context) {
    final snackBar = SnackBar(
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height - 100,
        left: 10,
        right: 10,
      ),
      content: Text('Please enter a Email'),
      backgroundColor: Colors.red,
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
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
 }
  void showSnackBarEmailValid(BuildContext context) {
    final snackBar = SnackBar(
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height - 100,
        left: 10,
        right: 10,
      ),
      content: Text('Please enter a Valid Email'),
      backgroundColor: Colors.red,
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
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
 }
  void showSnackBarSub(BuildContext context) {
    final snackBar = SnackBar(
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height - 100,
        left: 10,
        right: 10,
      ),
      content: Text('Please enter a Subject'),
      backgroundColor: Colors.red,
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
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  void showSnackBarMes(BuildContext context) {
    final snackBar = SnackBar(
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height - 100,
        left: 10,
        right: 10,
      ),
      content: Text('Please enter a Message'),
      backgroundColor: Colors.red,
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
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  showMessageInSnackBar(String message, bool isError) {
    print("showtesting not working");
    try {
      Get.snackbar(
        "",
        "",
        isDismissible: true,
        maxWidth: double.infinity,
        padding: const EdgeInsets.all(3),

          margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
        //margin: const EdgeInsets.all(3),
        backgroundColor: isError ? Colors.red : Colors.green,
        //   isError ? AppColors.errorColor.withOpacity(.5) : AppColors.successColor,
        colorText: Colors.white,
        titleText: Text(
          message,

          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,

          ),
        ),
      );
    } catch (e) {
      Fimber.e(e.toString());
    }
  }

  void distributorUser() {
    print("testing");
    distributorUserApiCall();
  }

  void distributorUserApiCall() {
    print("testing1");
    //isValidInput();
    if (isValidInput()) {
      print("testing2");
      setLoaderState(ViewStateEnum.busy);
      try {
        print("testing3");
          Logger.get().log("adddepartmet>>>${EmailController}");
        ApiManager.get()
            .distributorUser(NameController.text, EmailController.text.trim(),
          SubjectController.text, MessageController.text,)
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

  showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(
            margin: EdgeInsets.only(left: 50),
            child: Text("Loading",
                style: TextStyle(
                  fontFamily: 'Futura',
                )),
          )
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

}
