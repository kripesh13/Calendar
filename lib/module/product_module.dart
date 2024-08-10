class ProductModule {
  int? status;
  String? message;
  List<Data>? data;
  // Pagination? pagination;

  ProductModule({this.status, this.message, this.data});

  ProductModule.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    // pagination = json['pagination'] != null
    //     ? new Pagination.fromJson(json['pagination'])
    //     : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    // if (this.pagination != null) {
    //   data['pagination'] = this.pagination!.toJson();
    // }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  // String? slug;
  // int? productCategoryId;
  // int? sellerId;
  // int? display;
  // int? featured;
  // int? salesCount;
  // String? sku;
  // int? price;
  // double? discountedPrice;
  // double? usdPrice;
  // double? usdDiscountedPrice;
  // int? discount;
  // int? shippingCharge;
  // int? quantity;
  // int? weight;
  // String? overview;
  // String? specifications;
  // String? featuredImage;
  // String? thumbImage;
  // List<String>? gallery;
  // int? view;
  // // List<String>? units;
  // // UnitValues? unitValues;
  // int? variant;
  // String? createdAt;
  // String? updatedAt;
  // String? imageUrl;
  // String? thumbUrl;
  // bool? isWishlist;
  // String? url;
  // double? avgRating;

  Data(
      {this.id,
      this.name,
      // this.slug,
      // this.productCategoryId,
      // this.sellerId,
      // this.display,
      // this.featured,
      // this.salesCount,
      // this.sku,
      // this.price,
      // this.discountedPrice,
      // this.usdPrice,
      // this.usdDiscountedPrice,
      // this.discount,
      // this.shippingCharge,
      // this.quantity,
      // this.weight,
      // this.overview,
      // this.specifications,
      // this.featuredImage,
      // this.thumbImage,
      // this.gallery,
      // this.view,
      // // this.units,
      // // this.unitValues,
      // this.variant,
      // this.createdAt,
      // this.updatedAt,
      // this.imageUrl,
      // this.thumbUrl,
      // this.isWishlist,
      // this.url,
      // this.avgRating
      });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    // slug = json['slug'];
    // productCategoryId = json['product_category_id'];
    // sellerId = json['seller_id'];
    // display = json['display'];
    // featured = json['featured'];
    // salesCount = json['sales_count'];
    // sku = json['sku'];
    // price = json['price'];
    // // discountedPrice = json['discounted_price'];
    // usdPrice = json['usd_price'];
    // usdDiscountedPrice = json['usd_discounted_price'];
    // discount = json['discount'];
    // shippingCharge = json['shipping_charge'];
    // quantity = json['quantity'];
    // weight = json['weight'];
    // overview = json['overview'];
    // specifications = json['specifications'];
    // featuredImage = json['featured_image'];
    // thumbImage = json['thumb_image'];
    // gallery = json['gallery'].cast<String>();
    // view = json['view'];
    // // units = json['units'].cast<String>();
    // // unitValues = json['unit_values'] != null
    //     // ? new UnitValues.fromJson(json['unit_values'])
    //     // : null;
    // variant = json['variant'];
    // createdAt = json['created_at'];
    // updatedAt = json['updated_at'];
    // imageUrl = json['image_url'];
    // thumbUrl = json['thumb_url'];
    // isWishlist = json['isWishlist'];
    // url = json['url'];
    // avgRating = json['avg_rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    // data['slug'] = this.slug;
    // data['product_category_id'] = this.productCategoryId;
    // data['seller_id'] = this.sellerId;
    // data['display'] = this.display;
    // data['featured'] = this.featured;
    // data['sales_count'] = this.salesCount;
    // data['sku'] = this.sku;
    // data['price'] = this.price;
    // data['discounted_price'] = this.discountedPrice;
    // data['usd_price'] = this.usdPrice;
    // data['usd_discounted_price'] = this.usdDiscountedPrice;
    // data['discount'] = this.discount;
    // data['shipping_charge'] = this.shippingCharge;
    // data['quantity'] = this.quantity;
    // data['weight'] = this.weight;
    // data['overview'] = this.overview;
    // data['specifications'] = this.specifications;
    // data['featured_image'] = this.featuredImage;
    // data['thumb_image'] = this.thumbImage;
    // data['gallery'] = this.gallery;
    // data['view'] = this.view;
    // data['units'] = this.units;
    // if (this.unitValues != null) {
    //   data['unit_values'] = this.unitValues!.toJson();
    // }
    // data['variant'] = this.variant;
    // data['created_at'] = this.createdAt;
    // data['updated_at'] = this.updatedAt;
    // data['image_url'] = this.imageUrl;
    // data['thumb_url'] = this.thumbUrl;
    // data['isWishlist'] = this.isWishlist;
    // data['url'] = this.url;
    // data['avg_rating'] = this.avgRating;
    return data;
  }
}

// class UnitValues {
//   List<String>? shoesSize;
//   List<String>? color;
//   List<String>? tShirtSize;

//   UnitValues({this.shoesSize, this.color, this.tShirtSize});

//   UnitValues.fromJson(Map<String, dynamic> json) {
//     shoesSize = json['Shoes-size'].cast<String>();
//     color = json['Color'].cast<String>();
//     tShirtSize = json['T-Shirt-Size'].cast<String>();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['Shoes-size'] = this.shoesSize;
//     data['Color'] = this.color;
//     data['T-Shirt-Size'] = this.tShirtSize;
//     return data;
//   }
// }

// class Pagination {
//   int? total;
//   int? perPage;
//   int? currentPage;
//   int? lastPage;
//   int? from;
//   int? to;

//   Pagination(
//       {this.total,
//       this.perPage,
//       this.currentPage,
//       this.lastPage,
//       this.from,
//       this.to});

//   Pagination.fromJson(Map<String, dynamic> json) {
//     total = json['total'];
//     perPage = json['per_page'];
//     currentPage = json['current_page'];
//     lastPage = json['last_page'];
//     from = json['from'];
//     to = json['to'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['total'] = this.total;
//     data['per_page'] = this.perPage;
//     data['current_page'] = this.currentPage;
//     data['last_page'] = this.lastPage;
//     data['from'] = this.from;
//     data['to'] = this.to;
//     return data;
//   }
// }
