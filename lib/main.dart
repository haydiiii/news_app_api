import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_api/core/services/local_storage.dart';
import 'package:news_app_api/core/utils/colors.dart';
import 'package:news_app_api/features/manager/news_cubit.dart';
import 'package:news_app_api/features/splash_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppLocalStorage.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            appBarTheme: AppBarTheme(
              backgroundColor: AppColors.background,
            ),
            inputDecorationTheme: InputDecorationTheme(
              fillColor: AppColors.grey,
              filled: true,
              hintStyle: TextStyle(color: AppColors.white),
              contentPadding: EdgeInsets.all(10),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: AppColors.primary,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: AppColors.primary,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.red,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.red,
                ),
              ),
            ),
            dividerTheme: DividerThemeData(
                color: AppColors.primary, indent: 20, endIndent: 20),
            scaffoldBackgroundColor: AppColors.background),
        home: SplashView(),
      ),
    );
  }
}
