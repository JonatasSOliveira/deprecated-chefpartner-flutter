import 'package:chefpatner_mobile/src/models/customer.dart';
import 'package:chefpatner_mobile/src/models/generic_model.dart';

class CustomerAddress extends GenericModel {
  final Customer? customer;
  final String? address;
  final String? city;
  final String? state;
  final String? number;
  final String? complement;
  final String? referencePoint;

  CustomerAddress({
    super.id,
    required this.customer,
    required this.address,
    required this.city,
    required this.state,
    required this.number,
    this.complement,
    this.referencePoint,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
  });

  CustomerAddress.getSQLDefinition()
      : customer = null,
        address = null,
        city = null,
        state = null,
        number = null,
        complement = null,
        referencePoint = null,
        super.getSQLDefinition('customer_address', [
          Attribute(
              name: 'customer_id',
              type: AttributeType.integer,
              isForeignKey: true,
              foreignTable: 'customer',
              foreignColumn: 'id'),
          Attribute(name: 'address', type: AttributeType.text),
          Attribute(name: 'city', type: AttributeType.text),
          Attribute(name: 'state', type: AttributeType.text),
          Attribute(name: 'number', type: AttributeType.text),
          Attribute(
              name: 'complement', type: AttributeType.text, isNulable: true),
          Attribute(
              name: 'reference_point',
              type: AttributeType.text,
              isNulable: true)
        ]);
}
