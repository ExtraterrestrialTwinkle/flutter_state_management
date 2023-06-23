import 'package:business/product.dart';
import 'package:synchronized/synchronized.dart';

extension Operations on List<Product> {
  Future<List<Product>> changeElement(Product newProduct) async {
    int oldProductIndex = indexWhere((element) => element.id == newProduct.id);
    var lock = Lock();
    await lock.synchronized(() {
      removeAt(oldProductIndex);
    });
    await lock.synchronized(() {
      insert(oldProductIndex, newProduct);
    });
    return this;
  }
}