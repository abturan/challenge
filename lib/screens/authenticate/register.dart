import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cwtf_app/services/auth_service.dart';

class RegisterScreen extends StatefulWidget {
  final Function toggleView;
  RegisterScreen({required this.toggleView});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _errorMessage = '';

  final List<String> descriptions = [
    "Günlük görevleri tamamla, WTF puanlarını kap!",
    "Arkadaşlarına meydan oku, zirveye tırman!",
    "Yepyeni zorluklarla kendini test et.",
    "Her günün daha renkli, daha eğlenceli olsun.",
    "Topluluk etkinliklerine katıl, yeni kankalar edin.",
    "Görevleri bitir, WTF puanlarını topla.",
    "Hedeflerini belirle, başarıya ulaş.",
    "Başarılarını paylaş, diğerleriyle etkileşimde bulun.",
    "Seni bekleyen yeni görevler her gün yenileniyor.",
    "Motivasyonunu yüksek tut, zirveye ulaş."
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
                      'Create Account',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Please register to create an account',
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
                                  await authService.register(email, password);
                                  Navigator.pop(context); // Ekranı kapat
                                } catch (e) {
                                  setState(() {
                                    _errorMessage = 'Invalid email or password. Please try again.';
                                  });
                                }
                              },
                              child: Text('Register'),
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
                                "Already have an account? Sign in",
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
                        fontSize: 18,
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