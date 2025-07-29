import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Core/Utils/Components/appbar.dart';
import 'hadeth.dart';
import 'hadeth_details_screen.dart';

class HadethTab extends StatefulWidget {
  const HadethTab({super.key});

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth> ahadeth = [];

  @override
  Widget build(BuildContext context) {
    if (ahadeth.isEmpty) {
      loadAhadethFile();
    }

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: CustomAppbar(title: "الأحاديث النبوية"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/images/Hadith.png', scale: 9.5),
          ),
          const Divider(thickness: 2, color: Color(0xFF7D9E83)),
          Text(
            'الأحاديث',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Divider(thickness: 2, color: Color(0xFF7D9E83)),
          Expanded(
            child: ListView.separated(
              itemBuilder: (_, index) => GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => HadethDetailsScreen(
                      hadeth: ahadeth[index],
                    ),
                  ),
                ),
                child: Text(
                  ahadeth[index].title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              separatorBuilder: (context, index) =>
              const SizedBox(height: 10),
              itemCount: ahadeth.length,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> loadAhadethFile() async {
    String ahadethFileContent =
    await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> ahadethText = ahadethFileContent.split('#');
    ahadeth = ahadethText.map((hadethText) {
      List<String> hadethLines = hadethText.trim().split('\n');
      String title = hadethLines.first;
      hadethLines.removeAt(0);
      List<String> content = hadethLines;
      return Hadeth(content: content, title: title);
    }).toList();
    setState(() {});
  }
}
