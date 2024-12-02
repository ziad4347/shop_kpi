
class OrderModel {
  final String id;
  final bool isActive;
  final double price;
  final String company;
  final String picture;
  final String buyer;
  final List<String> tags;
  final String status;
  final DateTime registered;

  OrderModel({
    required this.id,
    required this.isActive,
    required this.price,
    required this.company,
    required this.picture,
    required this.buyer,
    required this.tags,
    required this.status,
    required this.registered,
  });

  // Factory method to create an Order from JSON
  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'] as String,
      isActive: json['isActive'] as bool,
      price: double.parse(json['price'].replaceAll(RegExp(r'[\$,]'), '')),
      company: json['company'] as String,
      picture: json['picture'] as String,
      buyer: json['buyer'] as String,
      tags: List<String>.from(json['tags']),
      status: json['status'] as String,
      registered: DateTime.parse(json['registered']),
    );
  }

  // Method to convert an Order to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'isActive': isActive,
      'price': price.toStringAsFixed(2),
      'company': company,
      'picture': picture,
      'buyer': buyer,
      'tags': tags,
      'status': status,
      'registered': registered.toIso8601String(),
    };
  }

  // CopyWith method for creating modified copies
  OrderModel copyWith({
    String? id,
    bool? isActive,
    double? price,
    String? company,
    String? picture,
    String? buyer,
    List<String>? tags,
    String? status,
    DateTime? registered,
  }) {
    return OrderModel(
      id: id ?? this.id,
      isActive: isActive ?? this.isActive,
      price: price ?? this.price,
      company: company ?? this.company,
      picture: picture ?? this.picture,
      buyer: buyer ?? this.buyer,
      tags: tags ?? this.tags,
      status: status ?? this.status,
      registered: registered ?? this.registered,
    );
  }
}
