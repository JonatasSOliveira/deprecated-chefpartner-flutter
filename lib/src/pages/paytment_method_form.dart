import 'package:flutter/material.dart';

class PaymnetMethodForm extends StatefulWidget {
  const PaymnetMethodForm({super.key});

  @override
  State<PaymnetMethodForm> createState() => _PaymnetMethodFormState();
}

class _PaymnetMethodFormState extends State<PaymnetMethodForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formas de Pagamento'),
      ),
      body: const Center(
        child: Text('Formas de Pagamento'),
      ),
    );
  }
}
