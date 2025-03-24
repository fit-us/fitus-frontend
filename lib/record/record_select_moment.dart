import 'dart:developer';
import 'dart:io';
import 'package:fapp/bottom_tab_route_observer.dart';
import 'package:fapp/record/components/moment/record_moment_header.dart';
import 'package:fapp/record/components/record_app_bar_ios.dart';
import 'package:fapp/record/components/record_next_button.dart';
import 'package:fapp/record/components/moment/record_moment_select_box.dart';
import 'package:fapp/record/record_context.dart';
import 'package:fapp/record/record_select_emotion.dart';
import 'package:fapp/style/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecordSelectMoment extends StatefulWidget {
  const RecordSelectMoment({super.key});

  @override
  State<RecordSelectMoment> createState() => _RecordSelectMomentState();
}

class _RecordSelectMomentState extends State<RecordSelectMoment>
    with RouteAware {
  String? _selectedMoment;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final routeObserver = Provider.of<BottomTabRouteObserver>(
      context,
      listen: false,
    );
    routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute);
  }

  @override
  void dispose() {
    final routeObserver = Provider.of<BottomTabRouteObserver>(
      context,
      listen: false,
    );
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  void _handleSelect(String moment) {
    setState(() {
      _selectedMoment = moment;
      Provider.of<RecordContext>(context, listen: false).setMoment(moment);
    });
  }

  void _showSelectionAlert() {
    if (Platform.isIOS) {
      _showSelectionAlertCupertino();
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("순간을 선택해주세요"),
            content: const Text("어느 순간을 기록하고 싶은지 선택해주세요"),
            actions: <Widget>[
              TextButton(
                child: const Text("확인"),
                onPressed: () {
                  log("Alert닫");
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  void _showSelectionAlertCupertino() {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text("순간을 선택해주세요"),
          content: const Text("어느 순간을 기록하고 싶은지 선택해주세요"),
          actions: <CupertinoDialogAction>[
            CupertinoDialogAction(
              child: const Text("확인"),
              onPressed: () {
                log("Alert닫힘");
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _handleNext() {
    if (_selectedMoment != null) {
      log('Navigating to /screens/form-select-emotion');
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SelectEmotionScreen(),
          settings: const RouteSettings(name: '/record-select-emotion'),
        ),
      );
    } else {
      _showSelectionAlert();
    }
  }

  bool get _isButtonEnabled => _selectedMoment != null;

  @override
  Widget build(BuildContext context) {
    final day = DateTime.now();
    final dayTransformer = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
    final now = "${day.month}월 ${day.day}일 ${dayTransformer[day.weekday - 1]}";
    final nowTimes = "${day.hour}시${day.minute}분";

    // 필요하다면 Provider를 통해 RecordContext에서 emotion 값을 가져와 Palette에 접근
    final recordContext = Provider.of<RecordContext>(context);
    final currentPalette = palette[recordContext.emotion];

    return Platform.isIOS
        ? CupertinoPageScaffold(
          navigationBar: const RecordAppBarIos(title: ""),
          child: SafeArea(
            child: _buildContent(context, now, nowTimes, currentPalette),
          ),
        )
        : Scaffold(
          appBar: AppBar(title: const Text("")),
          body: SafeArea(
            child: _buildContent(context, now, nowTimes, currentPalette),
          ),
        );
  }

  Widget _buildContent(
    BuildContext context,
    String now,
    String nowTimes,
    PaletteItem currentPalette,
  ) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: currentPalette.backgroundColor,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: DefaultTextStyle(
        style: const TextStyle(color: Colors.black),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 80),
                      child: RecordMomentHeader(now: now),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 60),
                      child: RecordMomentSelectBox(
                        nowTimes: nowTimes,
                        onSelect: _handleSelect,
                        selectedMoment: _selectedMoment,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            RecordNextButton(
              onPressed: _isButtonEnabled ? _handleNext : null,
              buttonColor: currentPalette.buttonColor,
              text: "다음",
            ),
          ],
        ),
      ),
    );
  }
}
