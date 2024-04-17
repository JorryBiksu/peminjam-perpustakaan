import 'package:get/get.dart';

import '../../book/controllers/book_controller.dart';
import '../controllers/add_book_controller.dart';

class AddBookBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddBookController>(
      () => AddBookController(),
    );
    Get.lazyPut<BookController>(
          () => BookController(),
    );
  }
}
