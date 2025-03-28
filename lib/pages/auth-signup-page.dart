import 'package:fapp/features/auth/ui/auth-text-field.dart';
import 'package:flutter/material.dart';

class AuthSignUpPage extends StatefulWidget {
  const AuthSignUpPage({super.key});

  @override
  State<AuthSignUpPage> createState() => _AuthSignUpPageState();
}

class _AuthSignUpPageState extends State<AuthSignUpPage> {
  final TextEditingController emailController = TextEditingController(
    text: "Fitus@gmail.com",
  );
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController birthController = TextEditingController();

  String selectedGender = '남성';
  String selectedRh = 'RH+';
  String selectedBlood = 'B';

  String get selectedBloodType => '$selectedRh $selectedBlood';

  final List<String> genderOptions = ['남성', '여성', '기타'];
  final List<String> rhOptions = ['RH+', 'RH-'];
  final List<String> bloodOptions = ['A', 'B', 'O', 'AB'];

  Future<void> showSelectionSheet({
    required String title,
    required String currentValue,
    required List<String> options,
    required ValueChanged<String> onSelected,
  }) async {
    await showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
              trailing: TextButton(
                child: Text('완료'),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            Divider(),
            ...options.map(
              (option) => RadioListTile<String>(
                title: Text(option),
                value: option,
                groupValue: currentValue,
                onChanged: (val) {
                  if (val != null) {
                    onSelected(val);
                    Navigator.pop(context);
                  }
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> showBloodTypeSheet() async {
    String tempRh = selectedRh;
    String tempBlood = selectedBlood;

    await showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: Text(
                    '혈액형 선택',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: TextButton(
                    child: Text('완료'),
                    onPressed: () {
                      setState(() {
                        selectedRh = tempRh;
                        selectedBlood = tempBlood;
                      });
                      Navigator.pop(context);
                    },
                  ),
                ),
                Row(
                  children:
                      rhOptions.map((rh) {
                        return Expanded(
                          child: RadioListTile<String>(
                            title: Text(rh),
                            value: rh,
                            groupValue: tempRh,
                            onChanged:
                                (val) => setModalState(() => tempRh = val!),
                          ),
                        );
                      }).toList(),
                ),
                Divider(),
                ...bloodOptions.map(
                  (blood) => RadioListTile<String>(
                    title: Text(blood),
                    value: blood,
                    groupValue: tempBlood,
                    onChanged: (val) => setModalState(() => tempBlood = val!),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget createSelectField(String label, String value, VoidCallback onTap) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xff595757),
            ),
          ),
          SizedBox(height: 8),
          InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(12),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(value),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color.fromRGBO(135, 73, 235, 0.4), Color(0xFFC9C4F2)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      SizedBox(height: 8),
                      Image.asset("assets/fitus-logo.png", height: 40),
                      Text(
                        "회원가입",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 32),
                Text(
                  '이메일 또는 아이디',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff595757),
                  ),
                ),
                SizedBox(height: 8),
                AuthTextField(
                  placeHolder: "이메일 또는 아이디를 입력해주세요.",
                  controller: emailController,
                ),

                SizedBox(height: 24),

                Text(
                  '비밀번호',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff595757),
                  ),
                ),
                SizedBox(height: 8),
                AuthTextField(
                  placeHolder: "비밀번호를 입력해주세요",
                  controller: passwordController,
                  obscureText: true,
                ),

                SizedBox(height: 24),
                Row(
                  children: [
                    createSelectField("성별", selectedGender, () {
                      showSelectionSheet(
                        title: "성별 선택",
                        currentValue: selectedGender,
                        options: genderOptions,
                        onSelected:
                            (val) => setState(() => selectedGender = val),
                      );
                    }),
                    SizedBox(width: 16),
                    createSelectField(
                      "혈액형",
                      selectedBloodType,
                      showBloodTypeSheet,
                    ),
                  ],
                ),
                SizedBox(height: 24),
                Text(
                  '이름',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff595757),
                  ),
                ),
                SizedBox(height: 8),
                AuthTextField(
                  placeHolder: "이름을 입력해주세요",
                  controller: nameController,
                ),

                SizedBox(height: 24),

                Text(
                  '생년월일',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff595757),
                  ),
                ),
                SizedBox(height: 8),
                AuthTextField(
                  placeHolder: '생년월일을 입력해주세요',
                  controller: birthController,
                ),

                SizedBox(height: 32),
                Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff8749EB),
                        ),
                        onPressed: () {},
                        child: Text(
                          '구글로 회원가입',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 12),

                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffB9A4F1),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => AuthSignUpPage(),
                            ),
                          );
                        },
                        child: Text(
                          '일반 회원가입',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color(0xff8749EB),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
