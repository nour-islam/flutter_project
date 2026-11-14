import 'package:flutter/material.dart';

class Product {
  final String title;
  final String price;
  final String category;
  final IconData icon;

  Product({
    required this.title,
    required this.price,
    required this.category,
    required this.icon,
  });
}

class ProductListScreen extends StatelessWidget {
  final String categoryName;

  const ProductListScreen({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    // قائمة منتجات تجريبية
    final List<Product> sampleProducts = [
      Product(
        title: 'حقيبة يد جلدية (لومينا)',
        price: '450 ج.م',
        category: 'المنتجات الجديدة',
        icon: Icons.shopping_bag,
      ),
      Product(
        title: 'هاتف ذكي مستعمل بحالة ممتازة',
        price: '3200 ج.م',
        category: 'المنتجات المستعملة',
        icon: Icons.phone_android,
      ),
      Product(
        title: 'منظم مكتب من مواد معاد تدويرها',
        price: '120 ج.م',
        category: 'المعاد تدويرها',
        icon: Icons.recycling,
      ),
    ];
    final products =
        sampleProducts
            .where((product) => product.category == categoryName)
            .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body:
          products.isEmpty
              ? const Center(
                child: Text(
                  'لا توجد منتجات في هذه الفئة حالياً',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              )
              : ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.teal.shade50,
                        child: Icon(product.icon, color: Colors.teal),
                      ),
                      title: Text(
                        product.title,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(product.price),
                      trailing: ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'تمت إضافة "${product.title}" إلى السلة!',
                              ),
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('إضافة للسلة'),
                      ),
                    ),
                  );
                },
              ),
    );
  }
}
