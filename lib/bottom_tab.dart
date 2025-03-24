import 'dart:developer';
import 'package:fapp/app_state.dart';
import 'package:fapp/bottom_tab_route_observer.dart';
import 'package:fapp/record/record_select_description.dart';
import 'package:fapp/record/record_select_moment.dart';
import 'package:fapp/screens/emotion_home.dart';
import 'package:fapp/settings/setting_profile_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class BottomTab extends StatefulWidget {
  const BottomTab({super.key});

  @override
  State createState() => _BottomTabState();
}

class _BottomTabState extends State<BottomTab>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late PageController _pageController;

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

  final List<GlobalKey<NavigatorState>> _navigatorKeys = List.generate(
    4,
    (_) => GlobalKey<NavigatorState>(),
  );

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

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) {
          return;
        }
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_selectedIndex].currentState!.maybePop();
        if (isFirstRouteInCurrentTab) {
          log('앱 종료');
        }
      },
      child: Consumer<AppState>(
        builder: (context, appState, child) {
          return Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: AppBar(title: const Text("")),
            // AppState에 따라 바텀 탭바 표시 여부 결정
            bottomNavigationBar:
                appState.showBottomTab
                    ? SizedBox(
                      height: 75,
                      child: TabBar(
                        indicatorColor: Colors.transparent,
                        labelColor: Colors.black,
                        controller: _tabController,
                        overlayColor: WidgetStateProperty.all(
                          Colors.transparent,
                        ),
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
                    )
                    : null,
            body: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (index) {
                setState(() {
                  _selectedIndex = index;
                  _tabController.animateTo(index);
                });
              },
              children: List.generate(tabData.length, (index) {
                return Navigator(
                  key: _navigatorKeys[index],
                  initialRoute: '/',
                  // RouteObserver 등록
                  observers: [Provider.of<BottomTabRouteObserver>(context)],
                  onGenerateRoute: (routeSettings) {
                    WidgetBuilder builder;
                    switch (index) {
                      case 0:
                        builder = (context) => HomeScreen();
                        break;
                      case 1:
                        builder = (context) => const RecordSelectMoment();
                        break;
                      case 2:
                        builder = (context) => const RecordSelectDescription();
                        break;
                      case 3:
                        builder = (context) => SettingProfileContainer();
                        break;
                      default:
                        throw Exception('Invalid index: $index');
                    }
                    return MaterialPageRoute(
                      builder: builder,
                      settings: routeSettings,
                    );
                  },
                );
              }),
            ),
          );
        },
      ),
    );
  }
}
