import 'package:business/product.dart';
import 'package:business/utils.dart';
import 'package:test/test.dart';

void main() async {
  test('Testing change element in list of products', () async {
    var list = [
      const Product (id:0, title: 'Title1', price: 1.0, inCart:0,),
      const Product (id:1, title: 'Title2', price: 2.0, inCart:0,),
      const Product (id:2, title: 'Title3', price: 3.0, inCart:0,),
      const Product (id:3, title: 'Title4', price: 4.0, inCart:0,),
      const Product (id:4, title: 'Title5', price: 5.0, inCart:0,),
      const Product (id:5, title: 'Title6', price: 6.0, inCart:0,),
      const Product (id:6, title: 'Title7', price: 7.0, inCart:0,),
    ];
    var newList = [
      const Product (id:0, title: 'Title1', price: 1.0, inCart:0,),
      const Product (id:1, title: 'Title2', price: 2.0, inCart:0,),
      const Product (id:2, title: 'Title3', price: 3.0, inCart:0,),
      const Product (id:3, title: 'Title4', price: 4.0, inCart:1,),
      const Product (id:4, title: 'Title5', price: 5.0, inCart:0,),
      const Product (id:5, title: 'Title6', price: 6.0, inCart:0,),
      const Product (id:6, title: 'Title7', price: 7.0, inCart:0,),
    ];
    var newProduct = const Product (id:3, title: 'Title4', price: 4.0, inCart:1);
    expect(await list.changeElement(newProduct), equals(newList));
  });
}