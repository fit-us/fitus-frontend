import 'package:fapp/features/auth/ui/auth-header.dart';
import 'package:fapp/features/auth/ui/auth-text-field.dart';
import 'package:fapp/pages/auth-signup-page.dart';
import 'package:flutter/material.dart';

class AuthSignInPage extends StatefulWidget {
  const AuthSignInPage({super.key});

  @override
  State<AuthSignInPage> createState() => _AuthSignInPageState();
}

class _AuthSignInPageState extends State<AuthSignInPage> {
  bool keepLoggedIn = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                AuthHeader(title: "로그인"),

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
                  placeHolder: "비밀번호를 입력해주세요.",
                  obscureText: true,
                  controller: passwordController,
                ),
                SizedBox(height: 16),

                Row(
                  children: [
                    Checkbox(
                      checkColor: Color(0xff8749EB),
                      fillColor: WidgetStateProperty.resolveWith<Color>((
                        states,
                      ) {
                        if (states.contains(WidgetState.selected)) {
                          return Colors.white;
                        }
                        return Colors.white;
                      }),
                      value: keepLoggedIn,
                      onChanged: (value) {
                        setState(() {
                          keepLoggedIn = value ?? false;
                        });
                      },
                    ),

                    Text(
                      '로그인 유지',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff727171),
                      ),
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        '비밀번호 찾기',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff727171),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        '이메일 찾기',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff727171),
                        ),
                      ),
                    ),
                  ],
                ),

                Column(
                  children: [
                    Divider(color: Color(0xffA57AEF)),

                    Container(
                      margin: EdgeInsets.fromLTRB(0, 14, 0, 14),
                      child: Text(
                        "간편 로그인",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Image.asset("assets/icon-faceid.png"),
                            ),
                            Text("생체인증 로그인", style: TextStyle(fontSize: 10)),
                          ],
                        ),

                        SizedBox(width: 16),

                        Column(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Image.asset("assets/icon-google.png"),
                            ),
                            Text("구글 로그인", style: TextStyle(fontSize: 10)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),

                Spacer(),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff8749EB),
                    ),
                    onPressed: () {},
                    child: Text(
                      '로그인',
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
                      '회원가입',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color(0xff8749EB),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
