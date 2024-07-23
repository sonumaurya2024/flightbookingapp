

import 'package:flutter/material.dart';

class MasterSpacer{
  static Width w = Width();
  static Height h = Height();
}

class Width{
  Widget fifty(){
    return const SizedBox(width: 50,);
  }
  Widget ten(){
    return const SizedBox(width: 5,);
  }
}

class Height{
  Widget five(){
    return const SizedBox(height: 5,);
  }
  Widget ten(){
    return const SizedBox(height: 10,);
  }

  Widget fifty(){
    return const SizedBox(height: 50,);
  }

  Widget max(){
    return Expanded(child: Container());
  }
}

