import 'dart:io';

import 'package:fruits_hub/core/entities/product_entity.dart';

ProductEntity getInstance() {
  return ProductEntity(
    id: '1',
    image: File(''),
    name: 'Dummy Product',
    code: 'DUMMY001',
    price: 10.0,
    iamgeUrl: null,
    isFeatured: false,
    description: 'This is a dummy product',
    expeireationMonths: 12,
    isOraganic: false,
    numberOfCalories: 100,
    avgRating: 4.5,
    ratingCount: 10,
    unitAmount: 1,
  );
}

// create method that get a list of dummy products;
List<ProductEntity> getDummyProducts() {
  return List.generate(
    10,
    (index) => getInstance(),
  );
}
