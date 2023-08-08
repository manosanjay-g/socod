import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../common/values/colors.dart';


Widget BuildTextField(String hintText,String textType,String imageName,void Function(String value)? func){
 return Container(
  margin: EdgeInsets.only(bottom: 20.h),
  height: 50.h,
  width: 325.h,
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(15),
    border: Border.all(color:AppColors.primaryFourElementText)
    ),
    child: Row(
      children: [
        Container(
          height: 16.h,
          width: 16.w,
          margin: EdgeInsets.only(left: 16.w),
          child: Image.asset("assets/icons/${imageName}.png"),
        ),
        SizedBox(
          height: 50.h,
          width: 270.w,
          child:  TextField(
            onChanged: (value) => func!(value),
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle:TextStyle(fontSize: 14.sp,color: AppColors.primarySecondaryElementText),
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent
                ),
              ),
              enabledBorder:const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent
                ),
              ),
              disabledBorder:const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent
                ),
              ),
              
            ),
            style: TextStyle(
              color: AppColors.primaryText,
              fontFamily: "Avenir",
              fontWeight: FontWeight.normal,
              fontSize: 12.sp
            ),
            autocorrect: false,
            obscureText: textType=="password"?true:false,
          
          ),

        )
      ],
    ),
  
 ); 
}
Widget BuildLoginAndRegisterButton(String buttonName,String buttontype,void Function()? func){
  return GestureDetector(
    onTap: func,
    child: Container(
      margin: EdgeInsets.only(top:buttontype=="login"?40:30),
      height: 50.h,
      width: 325.w,
      decoration: BoxDecoration(
        color:buttontype=="login"
        ? Colors.purple
        :AppColors.primaryBackground,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          color: buttontype=="login"
          ?Colors.transparent
          :AppColors.primaryFourElementText
  
        ),
        boxShadow: [BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 1,
          blurRadius: 2,
          offset: Offset(0,1)
        )]
        
      ),
      child: Center(
        child: Text(
          buttonName,
          style:TextStyle(
            color: buttontype=="login"
            ? AppColors.primaryBackground
            :AppColors.primaryText,
            fontSize: 16.sp,
            fontWeight: FontWeight.normal
          ) ,
        ),
      ),
    ),
  );

}

Widget BuildBioTextField(void Function(String value)? func){
 return Container(
  margin: EdgeInsets.only(bottom: 20.h),
  height: 50.h,
  width: 325.h,
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(15),
    border: Border.all(color:AppColors.primaryFourElementText)
    ),
    child: Row(
      children: [
        Container(
          height: 16.h,
          width: 16.w,
          margin: EdgeInsets.only(left: 16.w),
          child: Icon(Icons.book,color: Colors.black,size: 20,),
        ),
        SizedBox(width: 3.w,),
        SizedBox(
          height: 50.h,
          width: 270.w,
          child:  TextField(
            onChanged: (value) => func!(value),
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration: InputDecoration(
              hintText: "Fill in your bio",
              hintStyle:TextStyle(fontSize: 14.sp,color: AppColors.primarySecondaryElementText),
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent
                ),
              ),
              enabledBorder:const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent
                ),
              ),
              disabledBorder:const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent
                ),
              ),
              
            ),
            style: TextStyle(
              color: AppColors.primaryText,
              fontFamily: "Avenir",
              fontWeight: FontWeight.normal,
              fontSize: 12.sp
            ),
            autocorrect: false,
          
          
          ),

        )
      ],
    ),
  
 ); 
}


