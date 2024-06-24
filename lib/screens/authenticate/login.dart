import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cwtf_app/services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  final Function toggleView;

  LoginScreen({required this.toggleView});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _errorMessage = '';

  final List<String> descriptions = [
    "Виконуйте щоденні завдання та збирайте бали WTF!", // Ukraynaca
    "¡Desafía a tus amigos y alcanza la cima!", // İspanyolca
    "毎日のタスクを完了して、WTFポイントを獲得しよう！", // Japonca
    "أكمل المهام اليومية واحصل على نقاط WTF!", // Arapça
    "Participă la evenimentele comunității și găsește prieteni noi.", // Rumence
    "Completa le missioni e raccogli i punti WTF.", // İtalyanca
    "목표를 설정하고 성공을 달성하십시오.", // Korece
    "Achivementsınızı paylaşın ve başkalarıyla etkileşimde bulunun.", // Türkçe
    "每天都有新的任务等着你。", // Çince (Basitleştirilmiş)
    "Motivasyonunuzu yüksek tutun ve zirveye ulaşın.", // Türkçe
];

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white, size: 30),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueGrey[900]!, Colors.blueGrey[700]!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: IntrinsicHeight(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 100), // AppBar için eklenmiş yüksekliği telafi etmek için
                    Text(
                      'Welcome Back',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Please login to your account',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 20),
                    if (_errorMessage.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          _errorMessage,
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: <Widget>[
                            TextField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            TextField(
                              controller: _passwordController,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              obscureText: true,
                            ),
                            SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () async {
                                final email = _emailController.text;
                                final password = _passwordController.text;
                                try {
                                  bool success = await authService.login(email, password);
                                  if (success) {
                                    Navigator.pop(context); // Ekranı kapat
                                  }
                                } catch (e) {
                                  setState(() {
                                    _errorMessage = 'Invalid email or password. Please try again.';
                                  });
                                }
                              },
                              child: Text('Login'),
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 32),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () => widget.toggleView(),
                              child: Text(
                                "Don't have an account? Register",
                                style: TextStyle(color: Colors.blueGrey[900]),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      descriptions[DateTime.now().millisecondsSinceEpoch % descriptions.length],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Expanded(child: Container()), // Boş alanı doldurmak için Expanded widget'ı ekledik.
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}