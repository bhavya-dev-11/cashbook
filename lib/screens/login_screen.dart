import 'package:expense_tracker/screens/signup_screen.dart';
import 'package:expense_tracker/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isVisible = false;

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: AppColors.gradient,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(
                    Icons.account_balance_wallet_rounded,
                    color: AppColors.textPrimary,
                    size: 30,
                  ),
                ),
                SizedBox(height: 18),
                Text(
                  "Welcome Back",
                  style: GoogleFonts.inter(
                    color: AppColors.textPrimary,
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  "Log in to keep tracking your income and expenses.",
                  style: GoogleFonts.inter(
                    color: AppColors.textSecondary,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 24),
                Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Email",
                        style: GoogleFonts.inter(
                          color: AppColors.textSecondary,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 6),
                      TextFormField(
                        controller: _email,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color: AppColors.textSecondary,
                          ),
                          filled: true,
                          fillColor: AppColors.surface2,
                          hintText: "Enter your mail",
                          hintStyle: GoogleFonts.inter(
                            color: AppColors.textSecondary,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              !value.contains('@')) {
                            return "Please enter correct email address";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),
                      Text(
                        "Password",
                        style: GoogleFonts.inter(
                          color: AppColors.textSecondary,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 6),
                      TextFormField(
                        controller: _password,
                        obscureText: !isVisible,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock_outline_rounded,
                            color: AppColors.textSecondary,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isVisible = !isVisible;
                              });
                            },
                            icon: Icon(
                              isVisible
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off,
                              color: AppColors.textSecondary,
                            ),
                          ),
                          filled: true,
                          fillColor: AppColors.surface2,
                          hintText: "Enter your password",
                          hintStyle: GoogleFonts.inter(
                            color: AppColors.textSecondary,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 8) {
                            return "Please enter secure password";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),
                      Align(
                        alignment: AlignmentGeometry.centerEnd,
                        child: InkWell(
                          child: Text(
                            "Forget Password?",
                            style: GoogleFonts.inter(
                              color: AppColors.blue,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 26),
                      SizedBox(
                        width: double.infinity,
                        child: GestureDetector(
                          child: Container(
                            padding: EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              gradient: AppColors.gradient,
                              borderRadius: BorderRadius.circular(16),
                              shape: BoxShape.rectangle,
                            ),
                            child: Center(
                              child: Text(
                                "Login",
                                style: GoogleFonts.inter(
                                  color: AppColors.textPrimary,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 26),
                      Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: AppColors.textSecondary.withOpacity(0.3),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "OR CONTINUE WITH",
                              style: GoogleFonts.inter(
                                color: AppColors.textSecondary,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: AppColors.textSecondary.withOpacity(0.3),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 26),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 40,
                                vertical: 14,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                color: AppColors.surface2,

                                shape: BoxShape.rectangle,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.g_mobiledata_rounded,
                                    color: AppColors.textPrimary,
                                  ),
                                  Text(
                                    "Google",
                                    style: GoogleFonts.inter(
                                      color: AppColors.textPrimary,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 40,
                                vertical: 14,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                color: AppColors.surface2,

                                shape: BoxShape.rectangle,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.apple_rounded,
                                    color: AppColors.textPrimary,
                                  ),
                                  Text(
                                    "Apple",
                                    style: GoogleFonts.inter(
                                      color: AppColors.textPrimary,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      
                    ],
                  ),
                ),
                SizedBox(height: 26),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account? ",
                              style: GoogleFonts.inter(
                                color: AppColors.textSecondary,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "Sign Up",
                              style: GoogleFonts.inter(
                                color: AppColors.blue,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                      
                          ],
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
