import 'package:fapp/record/record_select_description.dart';
import 'package:fapp/record/record_select_moment.dart';
import 'package:fapp/screens/emotion_home.dart';
import 'package:fapp/mock/emotion_summary.dart';
import 'package:fapp/settings/components/setting_profile_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomTab extends StatefulWidget {
  const BottomTab({super.key});

  @override
  State createState() => _BottomTabState();
}

class _BottomTabState extends State<BottomTab>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late PageController _pageController;
  final bioMockData = MockData.bioMockData;

  int _selectedIndex = 0;
  List<Map<String, dynamic>> tabData = [
    {
      'iconActive': 'assets/tabicon/home_inline.svg',
      'iconInactive': 'assets/tabicon/home_outline.svg',
      'text': '홈',
    },
    {
      'iconActive': 'assets/tabicon/report_inline.svg',
      'iconInactive': 'assets/tabicon/report.svg',
      'text': '레포트',
    },
    {
      'iconActive': 'assets/tabicon/cbt_inline.svg',
      'iconInactive': 'assets/tabicon/cbt.svg',
      'text': 'CBT레포트',
    },
    {
      'iconActive': 'assets/tabicon/per_inline.svg',
      'iconInactive': 'assets/tabicon/per.svg',
      'text': '개인설정',
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabData.length, vsync: this);
    _pageController = PageController();
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });
  }

  @override // 부모 dispose를 상속받아 객체(_*Controller)가 사용하던 리소스를 해제하는 역할
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("")),
      bottomNavigationBar: SizedBox(
        height: 75,
        child: TabBar(
          indicatorColor: Colors.transparent,
          // padding: EdgeInsets.symmetric(vertical: 5.0),
          labelColor: Colors.black,
          controller: _tabController,
          overlayColor: WidgetStateProperty.all(
            Colors.transparent,
          ), //만약 탭바를 눌렀을 때 눌린 효과를 주려면 이 코드 제거
          onTap: (index) {
            _pageController.jumpToPage(index);
          },
          tabs: List.generate(tabData.length, (index) {
            return Tab(
              icon: SvgPicture.asset(
                _selectedIndex == index
                    ? tabData[index]['iconActive']
                    : tabData[index]['iconInactive'],
              ),
              child: Text(
                tabData[index]['text'],
                style: TextStyle(
                  color:
                      _selectedIndex == index
                          ? const Color(0xFF8749EB)
                          : const Color(0xFF9FA0A0),
                ),
              ),
            );
          }),
        ),
      ),
      body: PageView(
        controller: _pageController,
        physics:
            const NeverScrollableScrollPhysics(), // 나중에 페이지를 스와이프해서 넘길 경우 이 코드 제거
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
            _tabController.animateTo(index);
          });
        },
        children: [
          tabContainer(
            context,
            const Color.fromARGB(128, 29, 141, 182),
            HomeScreen(),
          ),
          tabContainer(context, Colors.amber[600]!, const RecordSelectMoment()),
          tabContainer(
            context,
            Colors.blueGrey,
            const RecordSelectDescription(),
          ),
          tabContainer(context, Colors.green, SettingProfileContainer()),
        ],
      ),
    );
  }

  Widget tabContainer(BuildContext context, Color tabColor, Widget child) {
    return child;
  }
}
