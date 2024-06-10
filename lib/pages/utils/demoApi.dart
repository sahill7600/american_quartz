import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class DemoApi {
  Future<void> uploadImage( XFile? pickedFile)async{
    print("hellooo");
    try{
      Dio dio =Dio();

      if(pickedFile != null){
        FormData formData = FormData.fromMap(
            {
              "userFile": await MultipartFile.fromFile(pickedFile.path,filename: "image.jpg"),
            }
            );
        Response response = await dio.post("https://americanquartzusa.com/wp-json/wp/v2/warranty-registration-form",data: formData);

        if(response.statusCode ==200){
          print("image uploaded successfully");
          print(response.data);
        }else{
          print("image upload failed. Error :${response.statusCode})");
        }
      }
    }catch(error){
      print("erroe uploading image:$error");
    }
  }
}