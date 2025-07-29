import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Core/Utils/Components/appbar.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int number = 0;
  String name = "سبحان الله";
  double turns = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: CustomAppbar(title: "السبحة"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                number += 1;
                if (number >= 33 && number < 66) {
                  name = 'الحمد لله';
                } else if (number >= 66 && number < 99) {
                  name = 'الله اكبر';
                } else if (number >= 99 && number <= 100) {
                  name = 'لااله الا الله';
                } else if (number > 100) {
                  number = 0;
                  name = 'سبحان الله';
                }
                setState(() {
                  turns += 1 / 33;
                });
              },
              child: AnimatedRotation(
                duration: const Duration(seconds: 1),
                turns: turns,
                child: Image.asset(
                  "assets/images/sebha.png",
                  scale: 1,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text("عدد التسبيحات", style: TextStyle(
              color: Colors.white,
              fontSize: 25.sp,
              fontWeight: FontWeight.w500,
            ),),
            const SizedBox(height: 24),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Color(0xFF7D9E83),
              ),
              height: 81,
              width: 69,
              child: Center(
                child: Text(
                  '$number',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w400,
                ),
                ),
              ),
            ),
            const SizedBox(height: 22),
            ElevatedButton(
              onPressed: () {
                number += 1;
                if (number >= 33 && number < 66) {
                  name = 'الحمد لله';
                } else if (number >= 66 && number < 99) {
                  name = 'الله اكبر';
                } else if (number >= 99 && number <= 100) {
                  name = 'لااله الا الله';
                } else if (number > 100) {
                  number = 0;
                  name = 'سبحان الله';
                }
                setState(() {
                  turns += 1 / 33;
                });
              },
              child: Text(
                name,
                style: TextStyle(
                  color: Color(0xFF7D9E83),
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
