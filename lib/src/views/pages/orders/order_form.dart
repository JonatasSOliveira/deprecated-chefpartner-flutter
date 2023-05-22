import 'package:flutter/material.dart';
import 'package:chefpartner_mobile/src/controllers/product_controller.dart';
import 'package:chefpartner_mobile/src/dtos/order_product_dto.dart';
import 'package:chefpartner_mobile/src/dtos/product_dto.dart';

class OrderForm extends StatefulWidget {
  static const String _routeName = '/order_form';

  const OrderForm({super.key});

  static String getRouteName() {
    return _routeName;
  }

  @override
  State<OrderForm> createState() => _OrderFormState();
}

class _OrderFormState extends State<OrderForm> {
  final ProductController _productController = ProductController();
  List<ProductDTO> _products = [];
  final List<OrderProductDTO> _orderProductsCart = [];

  @override
  void initState() {
    super.initState();
    _productController.listAll().then((products) => _products = products);
  }

  void _removeProductFromCart(ProductDTO product) {
    final orderProductIndex = _orderProductsCart.indexWhere(
      (orderProduct) => orderProduct.getProduct().getId() == product.getId()
    );
    if (orderProductIndex == -1) {
      return;
    }

    final orderProduct = _orderProductsCart[orderProductIndex];
    if (orderProduct.getQtd() > 1) {
      orderProduct.decrementQtd();
    } else {
      _orderProductsCart.removeAt(orderProductIndex);
    }
  }

  void _addProductToCart(ProductDTO product) {
    final orderProductIndex = _orderProductsCart.indexWhere(
        (orderProduct) => orderProduct.getProduct().getId() == product.getId());
    if (orderProductIndex > -1) {
      _orderProductsCart[orderProductIndex].incrementQtd();
      return;
    }

    _orderProductsCart.add(OrderProductDTO(
        product: product, qtd: 1, unitPrice: product.getPrice()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo Pedido'),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        Expanded(
            child: ListView.builder(
                itemCount: _products.length,
                itemBuilder: (context, index) => ListTile(
                    trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                      IconButton(
                          icon: const Icon(Icons.remove_circle),
                          onPressed: () =>
                              _removeProductFromCart(_products[index])),
                      IconButton(
                          icon: const Icon(Icons.add_circle),
                          onPressed: () => _addProductToCart(_products[index]))
                    ]),
                    title: Text(_products[index].getName()))))
      ]),
    );
  }
}
