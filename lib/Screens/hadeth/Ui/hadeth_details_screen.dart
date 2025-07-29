import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Core/Utils/Components/appbar.dart';
import '../../../Core/Utils/Components/loading_indicator.dart';
import 'hadeth.dart';

class HadethDetailsScreen extends StatelessWidget {
  final Hadeth hadeth;

  const HadethDetailsScreen({super.key, required this.hadeth});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/Wallpaper.jpeg'),
          fit: BoxFit.fill,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60.h),
            child: CustomAppbar(title: hadeth.title),
          ),

          body: Container(
            padding: const EdgeInsets.all(24),
            margin: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.06,
              horizontal: MediaQuery.of(context).size.width * 0.07,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFF7D9E83),
              borderRadius: BorderRadius.circular(25),
            ),
            child: hadeth.content.isEmpty
                ? const LoadingIndicator(color: Colors.white)
                : ListView.builder(
                    itemCount: hadeth.content.length,
                    itemBuilder: (_, index) => Text(
                      hadeth.content[index],
                      style: Theme.of(
                        context,
                      ).textTheme.titleLarge?.copyWith(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
