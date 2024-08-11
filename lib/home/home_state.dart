import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:test/module/product_module.dart';

class HomeState extends ChangeNotifier {
  HomeState() {
    pageCount = 1; // Initialize pageCount
    getData(pageCount!);
    scrollController.addListener(_onScroll);
  }

  ScrollController scrollController = ScrollController();
  int? pageCount;
  bool isLoading = false;
  bool isMoreLoading = false;
  ProductModule productModule = ProductModule();
  Dio dio = Dio();

  void _onScroll() {
    if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent &&
        !isMoreLoading) {
      loadMore();
    }
  }

  Future<void> loadMore() async {
    if (isMoreLoading || isLoading) return;

    pageCount = pageCount! + 1;
    isMoreLoading = true;
    notifyListeners();

    try {
      print("Loading more with count $pageCount");

      var response = await dio.get(
        'https://connecthimal.ktmrush.com/api/v1/products?page=$pageCount',
        options: Options(headers: _getHeaders()),
      );

      var newProducts = ProductModule.fromJson(response.data).data;
      if (newProducts != null && newProducts.isNotEmpty) {
        productModule.data!.addAll(newProducts);
      }
    } on DioError catch (e) {
      print('Error loading more data: ${e.response}');
    } finally {
      isMoreLoading = false;
      notifyListeners();
    }
  }

  Future<void> getData(int pageCount) async {
    print(pageCount);
    setLoading(true);
    try {
      print("Fetching data for page $pageCount");

      var response = await dio.get(
        'https://connecthimal.ktmrush.com/api/v1/products?page=$pageCount',
        options: Options(headers: _getHeaders()),
      );
      productModule = ProductModule.fromJson(response.data);
    } on DioError catch (e) {
      print('Error fetching data: ${e.response?.data}');
    } finally {
      setLoading(false);
    }
  }

  void setLoading(bool val) {
    isLoading = val;
    notifyListeners();
  }

  //   File? galleryImage;
  // var bytes;
  // var fileName;

  // onPickImage() async {
  //   final image = await ImagePicker().pickImage(
  //     source: ImageSource.gallery,
  //     imageQuality: 25,
  //   );
  //   if (image != null) {
  //     galleryImage = File(image.path);
  //     fileName = image.path.split('/').last;
  //     notifyListeners();
  //   }
  // }

  //  var data = FormData.fromMap({
  //     "id": id,
  //     "type": "user",
  //     "message": message,
  //     "temporaryMsgId": temporaryMsgId,
  //   });

  //   // Add file to data if galleryImage is not null
  //   if (galleryImage != null) {
  //     data.files.add(MapEntry(
  //       "file",
  //       await MultipartFile.fromFile(galleryImage!.path, filename: fileName),
  //     ));
  //   }

  Map<String, String> _getHeaders() {
    return {
      'Authorization':
          'Bearer 410|g1jq6KwmdO2BMfNYyDfGW3Pu0QXkABbhRuNylhujbc28dc62',
      'Content-Type': 'application/json',
      'ch-api-key': 'ch-ktmrush-api-v1-2024',
    };
  }

  @override
  void dispose() {
    scrollController.removeListener(_onScroll);
    scrollController.dispose();
    super.dispose();
  }
}
