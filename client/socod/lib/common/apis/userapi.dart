import 'package:socod/common/utils/http_util.dart';

import '../entities/user.dart';

 class UserAPI{
//   static login({LoginRequestEntity? params}) async{
//     try{
//       var response = await HttpUtil().post(
//         'auth/login',
//         data : params?.toJson()
//       );
//       print("Response is ${response}");
//       return UserLoginResponseEntity.fromJson(response);
//     }
//     catch(e){
//     print("........Network error ${e}");
//     }
// }
static login()async{
  var response =await HttpUtil().post();
  print(response);

}
}