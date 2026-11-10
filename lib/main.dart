import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/product_list_screen.dart';

void main() {
  runApp(const ReCartApp());
}

class ReCartApp extends StatelessWidget {
  const ReCartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ReCart',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ReCart - الصفحة الرئيسية'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'مرحباً بكِ في ريكارت! 🛒',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'منصتك الأولى لبيع وشراء المنتجات الجديدة والمستعملة والمعاد تدويرها.',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: const [
                  ProductCategoryCard(title: 'المنتجات الجديدة', icon: Icons.fiber_new),
                  ProductCategoryCard(title: 'المنتجات المستعملة', icon: Icons.replay),
                  ProductCategoryCard(title: 'المعاد تدويرها', icon: Icons.recycling),
                  ProductCategoryCard(title: 'مشترياتي وسلتي', icon: Icons.shopping_cart),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCategoryCard extends StatelessWidget {
  final String title;
  final IconData icon;

  const ProductCategoryCard({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductListScreen(categoryName: title),
          ),
        );
      },
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 40, color: Colors.teal),
              const SizedBox(height: 10),
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}