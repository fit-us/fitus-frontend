import 'package:fapp/app_state.dart';
import 'package:fapp/settings/components/app/setting_profile_app.dart';
import 'package:fapp/settings/components/health/setting_profile_health.dart';
import 'package:fapp/settings/components/setting_profile_modal.dart';
import 'package:fapp/settings/components/userinfo/setting_profile_userinfo.dart';
import 'package:fapp/settings/components/userinfo/setting_profile_modal_blood.dart';
import 'package:fapp/settings/components/userinfo/setting_profile_modal_date.dart';
import 'package:fapp/settings/components/userinfo/setting_profile_modal_gender.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class SettingProfileContainer extends StatefulWidget {
  const SettingProfileContainer({super.key});

  @override
  State<SettingProfileContainer> createState() =>
      _SettingProfileContainerState();
}

class _SettingProfileContainerState extends State<SettingProfileContainer> {
  bool _isEditMode = false;
  final GlobalKey _birthDateKey = GlobalKey();
  Rect? _birthDateRect;

  String _name = '김대건';
  String _birthDate = '2000. 04. 02 (24)';
  String _gender = '남성';
  String _bloodType = 'RH A+';
  bool _abnormalDetectionEnabled = true;

  final TextEditingController _nameController = TextEditingController();
  final double _horizontalPadding = 15.0;

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    _nameController.text = _name;
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _toggleEditMode() {
    setState(() {
      _isEditMode = !_isEditMode;
    });
  }

  void _clearField(String field) {
    setState(() {
      switch (field) {
        case 'name':
          _name = '';
          _nameController.text = '';
          break;
        case 'birthDate':
          _birthDate = '';
          break;
        case 'gender':
          _gender = '';
          break;
        case 'bloodType':
          _bloodType = '';
          break;
      }
    });
  }

  void _startEditing(String field) {
    final appState = Provider.of<AppState>(context, listen: false);
    appState.setBottomTabVisibility(false);

    setState(() {
      if (field == 'name') {
        _nameController.text = _name;
      }
      if (field == 'birthDate' && _birthDateKey.currentContext != null) {
        final RenderBox renderBox =
            _birthDateKey.currentContext!.findRenderObject() as RenderBox;
        _birthDateRect = renderBox.localToGlobal(Offset.zero) & renderBox.size;
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showEditingModal(field);
    });
  }

  void _showEditingModal(String field) {
    switch (field) {
      case 'birthDate':
        showDatePickerModal(
          context: context,
          onCancel: _cancelEditing,
          onDateChanged: (date) {
            if (mounted) {
              final appState = Provider.of<AppState>(context, listen: false);
              appState.setBottomTabVisibility(true);
            }

            setState(() {
              _birthDate =
                  '${date.year}. ${date.month.toString().padLeft(2, '0')}. ${date.day.toString().padLeft(2, '0')} (${DateTime.now().year - date.year})';
            });
          },
          anchorRect: _birthDateRect,
        );
        break;
      case 'gender':
        showGenderSelectionModal(
          context: context,
          onCancel: _cancelEditing,
          currentGender: _gender,
          onSelectGender: _selectGender,
        );
        break;
      case 'bloodType':
        showBloodTypeSelectionModal(
          context: context,
          onCancel: _cancelEditing,
          currentBloodType: _bloodType,
          onSelectBloodType: _selectBloodType,
        );
        break;
      case 'name':
        showNameEditingModal(
          context: context,
          onCancel: _cancelEditing,
          onSave: _saveNameChange,
          nameController: _nameController,
        );
        break;
    }
  }

  void _saveNameChange() {
    if (mounted) {
      final appState = Provider.of<AppState>(context, listen: false);
      appState.setBottomTabVisibility(true);
    }

    setState(() {
      _name = _nameController.text;
    });
  }

  void _selectGender(String gender) {
    if (mounted) {
      final appState = Provider.of<AppState>(context, listen: false);
      appState.setBottomTabVisibility(true);
    }

    setState(() {
      _gender = gender;
    });
  }

  void _selectBloodType(String bloodType) {
    if (mounted) {
      final appState = Provider.of<AppState>(context, listen: false);
      appState.setBottomTabVisibility(true);
    }

    setState(() {
      _bloodType = bloodType;
    });
  }

  void _cancelEditing() {
    if (mounted) {
      final appState = Provider.of<AppState>(context, listen: false);
      appState.setBottomTabVisibility(true);
    }

    setState(() {});
  }

  void _toggleAbnormalDetection(bool value) {
    setState(() {
      _abnormalDetectionEnabled = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Image.asset(
            'assets/bgImage.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          SafeArea(
            child: Column(
              children: [
                _buildHeader(),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(
                      horizontal: _horizontalPadding,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SettingProfileUserInfo(
                          isEditMode: _isEditMode,
                          name: _name,
                          birthDate: _birthDate,
                          gender: _gender,
                          bloodType: _bloodType,
                          nameController: _nameController,
                          onClearField: _clearField,
                          onStartEditing: _startEditing,
                          onNameChanged: (value) {
                            setState(() {
                              _name = value;
                            });
                          },
                          birthDateKey: _birthDateKey,
                        ),
                        const SizedBox(height: 24),

                        _buildSectionTitle('건강설정'),
                        buildHealthSettingsCard(
                          abnormalDetectionEnabled: _abnormalDetectionEnabled,
                          onToggleAbnormalDetection: _toggleAbnormalDetection,
                        ),
                        const SizedBox(height: 24),
                        _buildSectionTitle('앱 설정'),
                        buildAppSettingsCard(),
                        const SizedBox(height: 80),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child:
          _isEditMode
              ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: _toggleEditMode,
                    child: const Text(
                      '취소',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.indigo,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: _toggleEditMode,
                    child: const Text(
                      '완료',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.indigo,
                      ),
                    ),
                  ),
                ],
              )
              : Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: _toggleEditMode,
                    child: const Text(
                      '편집',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.indigo,
                      ),
                    ),
                  ),
                ],
              ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 2.0, bottom: 15.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      ),
    );
  }
}
