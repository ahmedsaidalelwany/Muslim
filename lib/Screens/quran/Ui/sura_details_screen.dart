import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:muslim/Screens/quran/Ui/quran_tab.dart';
import '../../../Core/Utils/Components/appbar.dart';
import '../../../Core/Utils/Components/loading_indicator.dart';

class SuraDetailsScreen extends StatefulWidget {
  const SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> ayat = [];
  late SuraDetailsArgs args;

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments as SuraDetailsArgs;
    if (ayat.isEmpty) {
      loadSuraFile();
    }
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/Wallpaper.jpeg'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.h),
          child: CustomAppbar(title: args.suraName),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white54.withOpacity(0.8),
                borderRadius: BorderRadius.circular(25),
              ),
              child: ayat.isEmpty
                  ? const LoadingIndicator(color: Color(0xFF7D9E83))
                  : ListView.builder(
                      itemBuilder: (_, index) => Text(
                        ayat[index],
                        style: TextStyle(
                          color: Color(0xFF394E3D),
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w200,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      itemCount: ayat.length,
                    ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> loadSuraFile() async {
    String sura = await rootBundle.loadString(
      'assets/files/${args.index + 1}.txt',
    );
    ayat = sura.split('\r\n');

    setState(() {});
  }
}
