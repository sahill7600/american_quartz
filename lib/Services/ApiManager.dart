import 'package:american_quartz/Utils/Logger.dart';
import 'package:american_quartz/pages/model/Api/OrderSampleResponse.dart';
import 'package:american_quartz/pages/model/Api/WarrantyRegistrationResponse.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import '../DataHandler/Network/APIEndpoints.dart';
import '../pages/model/Api/distributorResponse.dart';
import 'NetworkUtil.dart';
import 'ParsedResponse.dart';
import 'package:image_picker/image_picker.dart';

class ApiManager {
  static final ApiManager _apiManager = ApiManager._internal();

  //get pickedFile => null;

  static ApiManager get() {
    return _apiManager;
  }

  ApiManager._internal();

  static const int NO_INTERNET = 404;

  NetworkUtil _netUtil = NetworkUtil();

 // XFile? pickedFile;

  Future<ParsedResponse<DistributorResponse>> distributorUser(
      String name,
      String email,
      String subject ,
      String message,
      ) async {
    Map<String, dynamic> data = new Map();

    data["name"] = "${name}";
    data["email"] = "${email}";
    data["subject"] = "${subject}";
    data["message"] = "${message}";

    FormData formData = FormData.fromMap(data);

       Logger.get().log("adddepartmet>>>${data}");
       Logger.get().log("adddepartmet>>>${_apiManager}");
       Logger.get().log("Job URL>>${APIEndpoints.distributorUrl}");
       Logger.get().log("PiechartURL ____________ ?>>>>>${APIEndpoints.distributorUrl+"?name=$name"}");
       Logger.get().log("PiechartURL1 ____________ ?>>>>>${APIEndpoints.distributorUrl+"&email=$email"}");
       Logger.get().log("PiechartURL2 ____________ ?>>>>>${APIEndpoints.distributorUrl+"&subject=$subject"}");
       Logger.get().log("PiechartURL2 ____________ ?>>>>>${APIEndpoints.distributorUrl+"&message=$message"}");

       Logger.get().log("PiechartURL3 ____________ ?>>>>>${APIEndpoints.distributorUrl+"?name=$name"+"&email=$email"+"&subject=$subject"+"&message=$message"}");
  //  static const String distributorUrl = "https://americanquartzusa.com/wp-json/wp/v2/distributor-form?name=&email=&subject=&message=";
    return _netUtil
   //     .dioGet(APIEndpoints.agentsViewUrl+"?company_id=$company_id"+"&page=$page"+"&size=$size", hasToken: true,isFormData: false)

        .dioPost(APIEndpoints.distributorUrl +"?name=$name"+"&email=$email"+"&subject=$subject"+"&message=$message",formData, hasToken: false,isFormData: false)
        .then((response) {

      DistributorResponse? apiResponse = response.body != null
          ?  DistributorResponse.fromJson(response.body)
          : null;
      return  ParsedResponse(response.statusCode, apiResponse!);
    });
  }

  ///Order Sample

  Future<ParsedResponse<OrderSampleResponse>> orderSamplesUser(
      String color1,
      String color2,
      String color3 ,
      String firstName,
      String lastName,
      String email,
      String company,
      String businessWebsite,
      String synopsis,
      String phone,
      String street,
      String city,
      String zip,
      String state,
      String country,


      ) async {
    Map<String, dynamic> data = new Map();

    data["color1"] = "${color1}";
    data["color2"] = "${color2}";
    data["color3"] = "${color3}";
    data["firstName"] = "${firstName}";
    data["lastName"] = "${lastName}";
    data["email"] = "${email}";
    data["company"] = "${company}";
    data["businessWebsite"] = "${businessWebsite}";
    data["synopsis"] = "${synopsis}";
    data["phone"] = "${phone}";
    data["street"] = "${street}";
    data["city"] = "${city}";
    data["zip"] = "${zip}";
    data["state"] = "${state}";
    data["country"] = "${country}";


    FormData formData = FormData.fromMap(data);

       Logger.get().log("adddepartmet>>>${data}");
       Logger.get().log("adddepartmet>>>${_apiManager}");
       Logger.get().log("Job URL>>${APIEndpoints.distributorUrl}");
       Logger.get().log("PiechartURL ____________ ?>>>>>${APIEndpoints.distributorUrl+"?name=$color1"}");
       Logger.get().log("PiechartURL1 ____________ ?>>>>>${APIEndpoints.distributorUrl+"&email=$color2"}");
       Logger.get().log("PiechartURL2 ____________ ?>>>>>${APIEndpoints.distributorUrl+"&subject=$color3"}");
       Logger.get().log("PiechartURL2 ____________ ?>>>>>${APIEndpoints.distributorUrl+"&message=$email"}");

     // Logger.get().log("PiechartURL3 ____________ ?>>>>>${APIEndpoints.distributorUrl+"?name=$name"+"&email=$email"+"&subject=$subject"+"&message=$message"}");
    return _netUtil

        .dioPost(APIEndpoints.orderSamplesUrl +"?color1=$color1"+"&color2=$color2"+"&color3=$color3"+
        "&firstName=$firstName"+"&lastName=$lastName"+"&email=$email"+"&company=$company"+"&businessWebsite=$businessWebsite"+"&synopsis=$synopsis"+"&phone=$phone" +
        "&street=$street"+"&city=$city"+"&zip=$zip"+"&state=$state"+"&country=$country",formData, hasToken: false,isFormData: true)
        .then((response) {

      OrderSampleResponse? apiResponse = response.body != null
          ?  OrderSampleResponse.fromJson(response.body)
          : null;
      return  ParsedResponse(response.statusCode, apiResponse!);
    });
  }

  ///Warranty Registration


  Future<ParsedResponse<WarrantyRegistrationResponse>> warrantyRegistrationUser(
  //Future<void> uploadImage( XFile? pickedFile)async{
      String firstName,
      String lastName,
      String address ,
      String city,
      String state,
      String zip,
      String country,
      String phone,
      String email,
      String dealer,
      String batchSerial,
      String fabricatorInstaller,
      String fabricatorEmail,

      ) async {
    Map<String, dynamic> data = new Map();


    data["firstName"] = "${firstName}";
    data["lastName"] = "${lastName}";
    data["address"] = "${address}";
    data["city"] = "${city}";
    data["state"] = "${state}";
    data["zip"] = "${zip}";
    data["country"] = "${country}";
    data["phone"] = "${phone}";
    data["email"] = "${email}";
    data["dealer"] = "${dealer}";
    data["batchSerial"] = "${batchSerial}";
    data["fabricatorInstaller"] = "${fabricatorInstaller}";
    data["fabricatorEmail"] = "${fabricatorEmail}";
  //  data[ "userFile"] = await MultipartFile.fromFile(pickedFile!.path,filename: "image.jpg");

    FormData formData = FormData.fromMap(data);

    // Logger.get().log("adddepartmet>>>${data}");
    // Logger.get().log("adddepartmet>>>${_apiManager}");
    // Logger.get().log("Job URL>>${APIEndpoints.distributorUrl}");
    // Logger.get().log("PiechartURL ____________ ?>>>>>${APIEndpoints.distributorUrl+"?name=$color1"}");
    // Logger.get().log("PiechartURL1 ____________ ?>>>>>${APIEndpoints.distributorUrl+"&email=$color2"}");
    // Logger.get().log("PiechartURL2 ____________ ?>>>>>${APIEndpoints.distributorUrl+"&subject=$color3"}");
    // Logger.get().log("PiechartURL2 ____________ ?>>>>>${APIEndpoints.distributorUrl+"&message=$email"}");

    //Logger.get().log("PiechartURL3 ____________ ?>>>>>${APIEndpoints.distributorUrl+"?name=$name"+"&email=$email"+"&subject=$subject"+"&message=$message"}");
    //  static const String distributorUrl = https://americanquartzusa.com/wp-json/wp/v2/warranty-registration-form?firstName=Bhoomi&lastName=Patel&address=803, Pehel Lake View&city=Ahmedabad&state=Gujarat&zip=382441&country=India&phone=7894561223&email=bhoomi.insignia@gmail.com&dealer=XYZ&batchSerial=A001B&fabricatorInstaller=Fabricator&fabricatorEmail=mansi.insignia@gmail.com
    return _netUtil

        .dioPost(APIEndpoints.warrantyRegistrationUrl +"?firstName=$firstName"+"&lastName=$lastName"+"&address=$address"+ "&city=$city"+
        "&state=$state"+"&zip=$zip"+"&country=$country"+"&phone=$phone"+"&email=$email"
        +"&dealer=$dealer"+"&batchSerial=$batchSerial"+"&fabricatorInstaller=$fabricatorInstaller"+
        "&fabricatorEmail=$fabricatorEmail",formData, hasToken: false,isFormData: true)
        .then((response) {

      WarrantyRegistrationResponse? apiResponse = response.body != null
          ?  WarrantyRegistrationResponse.fromJson(response.body)
          : null;
      return  ParsedResponse(response.statusCode, apiResponse!);
    });
  }

  ///upload

  // Future<void> uploadImage( XFile? pickedFile)async{
  //   print("hellooo");
  //   try{
  //     Dio dio =Dio();
  //
  //     if(pickedFile != null){
  //       FormData formData = FormData.fromMap(
  //         {
  //           "userFile": await MultipartFile.fromFile(pickedFile.path,filename: "image.jpg"),
  //         });
  //       Response response = await dio.post("https://americanquartzusa.com/wp-json/wp/v2/warranty-registration-form",data: formData);
  //
  //       if(response.statusCode ==200){
  //         print("image uploaded successfully");
  //         print(response.data);
  //       }else{
  //         print("image upload failed. Error :${response.statusCode})");
  //       }
  //     }
  //   }catch(error){
  //     print("erroe uploading image:$error");
  //   }
  // }

}
