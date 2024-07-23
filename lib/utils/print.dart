import 'dart:convert';

import 'package:flutter/foundation.dart';

mDebugPrint(msg){
  if(kDebugMode){
    print(msg);
  }
}

mDebugPrintApi(msg){
  if(kDebugMode){
    mDebugPrint("------------------------------------$msg----------------------------------------");
  }
}

mDebugPrintRequest(data){
  if(kDebugMode){
    mDebugPrint("Request : ${jsonEncode(data)}");
  }
}

mDebugPrintResponse(response){
  if(kDebugMode){
    mDebugPrint("Response : ${jsonEncode(response)}");
  }
}

mDebugPrintError(msg){
  if(kDebugMode){
    mDebugPrint("Error : ${jsonEncode(msg)}");
  }
}
