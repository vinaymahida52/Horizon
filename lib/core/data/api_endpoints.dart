class ApiEndPoint {
  static const String baseUrl = "twiila.com";

  // static const String baseUrl = "192.168.31.85:3000";

  static const String cus = "/customer";

  static const String login = "/customer/login/signin";
  static const String signup = "/customer/login/signup";
  static const String getCart = "/customer/cart/get/";
  static const String addToCart = "/customer/cart/update/";
  static const String getwishList = "/customer/wishlist/get/";
  static const String updateWishlist = "/customer/wishlist/update/";
  static const String deleteFromWishList = "$cus/wishlist/delete/";

  //address
  static const String getAddress = "/customer/address/get/";
  static const String addAddress = "/customer/address/add/";
  static const String updateAddress = "/customer/address/update/";
  static const String deleteAddress = "/customer/address/delete/";

  //location
  static const String location = "$cus/location/get";

  //product
  static const String getAllProduct = "$cus/shop/product/get/";
  static const String getProductByShop = "$cus/shop/product/";
  static const String getProductDetail = "$cus/shop/product/details/";
  static const String getAllBrand = "$cus/shop/product/brands/";
  static const String getVarient = "/shop/product/variant/";

  //category
  static const String getAllCategory = "$cus/shop/category/get";
  static const String getSubCAtegory =
      "$cus/shop/subcategory/get/"; //path param cat id

  //sale
  static const String getSale = "$cus/sale/details";
  static const String getSaleBetweenDates =
      "$cus/sale/details"; //query param start_date end_date

  //notification
  static const String notification = "$cus/notification/get";

  //banner image and video
  static const String videoImage = "$cus/utils";

  //profile
  static const String getProfile = "$cus/profile/get/"; //path param customer id
  static const String updateProfile =
      "$cus/profile/update/"; //path param customer id

  //order

  static const String getOrder = "$cus/orders/"; // path param customer id
  static const String createOrder =
      "$cus/newplaceorder/"; //path param customer id
  static const String clearCart = "$cus/cart/delete/"; //path param customer id
  static const String addReview = "$cus/review/add/"; //path param customer id

  static const String editReview = "$cus/review/edit/"; //path param review id
  static const String addReturn =
      "$cus/return/add/"; //path param customer id product id
  static const String cancelOrder = "$cus/cancelOrder";

  //get filters
  static const String getFilters = "$cus/filter";

  //get shop
  static const String getAllShop = "$cus/shops/getAll";
  static const String getProductsByShop =
      "$cus/shops/get/"; //path param shop id and user id

  static const String applySeller = "/shop/sellerRequest/apply";
}

class SocketEndPoint {}
