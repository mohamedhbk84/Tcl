
import 'package:arab_project/core/network/local/cache_helper.dart';

bool getbool(){
  switch( CasheHelper.getData(key: "isDark") ){
    case true :
      return true;
    case false:
      return false;
    default:
      return true;
  }


}

String BaseImage(){
return 'https://tclgcc.com/uploads/website/products/original/';
}String BaseImageAdvices(){
return 'https://crm.tclgcc.com/crm/uploads/website/advices/';
}
String BasePDF(){
return 'https://www.tclgcc.com/uploads/pdf/';
}String BaseSlug(){
return 'https://www.tclgcc.com/uploads/pdf/';
}