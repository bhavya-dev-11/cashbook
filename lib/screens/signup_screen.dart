import 'package:expense_tracker/controller/auth_controller.dart';
import 'package:expense_tracker/homeshell.dart';
import 'package:expense_tracker/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});

  @override
  ConsumerState<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isVisible = false;
  bool isAgreed = false;
  bool loading = false;

  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ref.listen(authControllerProvider, (previous, next) {
      return next.whenOrNull(
        data: (user) {
          if (user != null) {
            setState(() {
              loading = false;
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "Sign up successfully",
                  style: TextStyle(color: AppColors.textPrimary),
                ),
                backgroundColor: AppColors.income,
              ),
            );
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Homeshell()));
          }
        },
        loading: (){
          setState(() {
            loading = true;
          });
        },
        error: (e, st){
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "Error while signing up $e",
                  style: TextStyle(color: AppColors.textPrimary),
                ),
                backgroundColor: AppColors.expense,
              ),
            );
        }
      );
    });

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.border, width: 0.3),
                    borderRadius: BorderRadius.circular(16),
                    color: AppColors.surface2,
                  ),
                  child: const Icon(Icons.arrow_back, size: 20),
                ),
              ),
              SizedBox(height: 18),
              Text(
                "Create Account",
                style: GoogleFonts.inter(
                  color: AppColors.textPrimary,
                  fontSize: 26,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 6),
              Text(
                "Start tracking your money the smart way.",
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
                      "Full Name",
                      style: GoogleFonts.inter(
                        color: AppColors.textSecondary,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 6),
                    TextFormField(
                      controller: _fullName,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person_outline_rounded,
                          color: AppColors.textSecondary,
                        ),
                        filled: true,
                        fillColor: AppColors.surface2,
                        hintText: "Enter your full name",
                        hintStyle: GoogleFonts.inter(
                          color: AppColors.textSecondary,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.length < 2) {
                          return "Please enter correct name";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
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
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Checkbox(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          value: isAgreed,
                          onChanged: (value) {
                            setState(() {
                              isAgreed = value!;
                            });
                          },
                        ),

                        const SizedBox(width: 4),

                        Expanded(
                          child: Wrap(
                            children: [
                              Text(
                                "I agree to the ",
                                style: GoogleFonts.inter(
                                  color: AppColors.textSecondary,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "Terms & Conditions ",
                                style: GoogleFonts.inter(
                                  color: AppColors.blue,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "and ",
                                style: GoogleFonts.inter(
                                  color: AppColors.textSecondary,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "Privacy & Policy",
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
                    SizedBox(height: 26),
                    SizedBox(
                      width: double.infinity,
                      child: GestureDetector(
                        onTap: (){
                          ref.read(authControllerProvider.notifier).signUp(_fullName.text, _email.text, _password.text);
                        },
                        child: Container(
                          padding: EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            gradient: AppColors.gradient,
                            borderRadius: BorderRadius.circular(16),
                            shape: BoxShape.rectangle,
                          ),
                          child: Center(
                            child: loading ? CircularProgressIndicator(color: AppColors.textPrimary,) : Text(
                              "Create Account",
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
                  ],
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: GoogleFonts.inter(
                        color: AppColors.textSecondary,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "Login",
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
    );
  }
}
