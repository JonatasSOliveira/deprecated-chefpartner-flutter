import 'package:flutter/material.dart';

class DrawerContainer extends StatelessWidget {
  final Widget child;
  final String title;

  const DrawerContainer({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);

  void _navigateTo(BuildContext context, String routeName) {
    Navigator.pushReplacementNamed(context, routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        drawer: Drawer(
          child: ListView(padding: EdgeInsets.zero, children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: null,
            ),
            ListTile(
              title: const Text('Início'),
              onTap: () => _navigateTo(context, '/'),
            ),
            ListTile(
              title: const Text('Clientes'),
              onTap: () => _navigateTo(context, '/customers'),
            ),
            ListTile(
              title: const Text('Pedidos'),
              onTap: () => _navigateTo(context, '/orders'),
            ),
            ListTile(
              title: const Text('Produtos'),
              onTap: () => _navigateTo(context, '/products'),
            ),
            ListTile(
              title: const Text('Formas de Pagamentos'),
              onTap: () => _navigateTo(context, '/payment_methods'),
            )
          ]),
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: child,
        )));
  }
}
