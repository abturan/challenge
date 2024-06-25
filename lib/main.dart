import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widgets/theme-1/app_bar.dart';
import 'widgets/theme-1/bottom_navigation.dart';
import 'widgets/theme-1/home_screen.dart';
import 'widgets/theme-1/challenges_screen.dart';
import 'widgets/theme-1/login_screen.dart';
import 'widgets/theme-1/profile_screen.dart';
import 'widgets/theme-1/register_screen.dart';
import 'widgets/theme-1/challenge_detail_screen.dart';
import 'widgets/theme-1/ad_banner.dart';
import 'widgets/theme-1/user_activity_notification.dart';
import 'widgets/theme-1/feed_item.dart';
import 'widgets/theme-1/colors.dart';
import 'models/challenge_model.dart';
import 'services/auth_service.dart';
import 'services/challenge_service.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
        ChangeNotifierProvider(create: (_) => ChallengeService()),
      ],
      child: ChallengeWTFApp(),
    ),
  );
}

class ChallengeWTFApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812), // Tasarım boyutunu belirtin
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Challenge .wtf',
          theme: ThemeData(
            primaryColor: primaryColor,
            scaffoldBackgroundColor: backgroundColor,
            appBarTheme: AppBarTheme(
              backgroundColor: primaryColor,
              titleTextStyle: TextStyle(color: lightTextColor, fontSize: 20, fontFamily: 'GameFont'),
            ),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: primaryColor,
              selectedItemColor: lightTextColor,
              unselectedItemColor: mutedTextColor,
            ),
            fontFamily: 'GameFont',
          ),
          home: ChallengeWTFHomePage(),
          routes: {
            '/login': (context) => LoginScreen(),
            '/register': (context) => RegisterScreen(),
            '/challenge_detail': (context) {
              final challenge = ModalRoute.of(context)?.settings.arguments as ChallengeModel;
              return ChallengeDetailScreen(challenge: challenge);
            },
          },
        );
      },
    );
  }
}

class ChallengeWTFHomePage extends StatefulWidget {
  @override
  _ChallengeWTFHomePageState createState() => _ChallengeWTFHomePageState();
}

class _ChallengeWTFHomePageState extends State<ChallengeWTFHomePage> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    ChallengesScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(showBackButton: _selectedIndex != 0),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
