import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../View/Introduction/SignIn_SignUp_ForgttenPassword/Sign_In/SignIn.dart';

class IntroViewModel extends BaseViewModel{
PageController pageController = PageController();
int pageNumber = 0;

@override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  nextPage(){
  pageController.nextPage(duration: Duration(milliseconds: 100), curve: Curves.linear);
  }

  skipPage(){
  pageController.jumpToPage(3);
  }
  previousPage(){
  pageController.previousPage(duration: Duration(milliseconds: 100), curve: Curves.linear);

  }

  void pageUnChange(value){
  pageNumber = value;
  notifyListeners();
  }

  moveToLogInScreen(context){
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignIn(),));
  }
}