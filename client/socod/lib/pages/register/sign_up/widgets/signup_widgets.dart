import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/values/colors.dart';

Widget GenderButton(String initial, void Function(String value)? func) {
  String dropdownvalue = initial;
  List<String> genders = ['Male', 'Female'];
  return Container(
    margin: EdgeInsets.only(bottom: 20.h),
    height: 50.h,
    width: double.infinity,
    decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(15),
        // border: Border.all(color: AppColors.primaryFourElementText),
    ),
    child: Row(
      
      children: [
        Container(
            height: double.infinity,
            margin: EdgeInsets.only(left: 16.w),
            child: dropdownvalue == 'Male'
                ? Icon(Icons.male_rounded)
                : Icon(Icons.female_rounded)),
        SizedBox(
          width: 16.w,
        ),
        SizedBox(
          height: 50.h,
          width: 80.w,
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              style: TextStyle(
                  color: AppColors.primaryText,
                  fontFamily: "Avenir",
                  fontWeight: FontWeight.normal,
                  fontSize: 12.sp),

              // Initial Value
              value: dropdownvalue,

              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),

              // Array list of items
              items: genders.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (value) => func!(value!),
            ),
          ),
        )
      ],
    ),
  );
}

Widget ChooseDept(String initial, void Function(String value)? func) {
  String dropdownvalue = initial;
  List<String> genders = [
    'CSE',
    'IT',
    'BT',
    'BIOMED',
    'MECH',
    'AUTO',
    'AERO',
    'AIML',
    'ECE',
    'EEE'
  ];
  return Container(
    margin: EdgeInsets.only(bottom: 20.h),
    height: 50.h,
    width: double.infinity,
    decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(15),
        // border: Border.all(color: AppColors.primaryFourElementText),
    ),
    child: Row(
      children: [
        // Container(
        //     height: 16.h,
        //     width: 16.w,
        //     margin: EdgeInsets.only(left: 16.w),
        //     child: Icon(
        //       Icons.list_alt,
        //       size: 20,
        //     )),
        SizedBox(
          width: 16.w,
        ),
        SizedBox(
          height: 50.h,
          width: 80.w,
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              style: TextStyle(
                  color: AppColors.primaryText,
                  fontFamily: "Avenir",
                  fontWeight: FontWeight.normal,
                  fontSize: 12.sp),

              // Initial Value
              value: dropdownvalue,

              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),

              // Array list of items
              items: genders.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (value) => func!(value!),
            ),
          ),
        )
      ],
    ),
  );
}

Widget ChooseYear(String initial, void Function(String value)? func) {
  String dropdownvalue = initial;
  List<String> genders = ['1', '2', '3', '4'];
  return Container(
    margin: EdgeInsets.only(bottom: 20.h),
    height: 50.h,
    width: double.infinity,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        // border: Border.all(color: AppColors.primaryFourElementText),
    ),
    child: Row(
      children: [
        // Container(
        //     height: double.infinity,
        //     margin: EdgeInsets.only(left: 16.w),
        //     child: Icon(
        //       Icons.list,
        //       size: 20,
        //     )),
        SizedBox(
          width: 16.w,
        ),
        SizedBox(
          height: 50.h,
          width: 80.w,
          child: DropdownButton(
            style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: "Avenir",
                fontWeight: FontWeight.normal,
                fontSize: 12.sp),

            // Initial Value
            value: dropdownvalue,

            // Down Arrow Icon
            icon: const Icon(Icons.keyboard_arrow_down),

            // Array list of items
            items: genders.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            // After selecting the desired option,it will
            // change button value to selected value
            onChanged: (value) => func!(value!),
          ),
        )
      ],
    ),
  );
}
