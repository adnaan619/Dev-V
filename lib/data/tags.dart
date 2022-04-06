class Tags {
  static final imageCartPostfix = '_2';

  static String imageProducts(String urlImage) => '${urlImage}_1';
  static String imageCart(String urlImage) => '$urlImage$imageCartPostfix';

  static bool isImageCartTag(String tag) => tag.contains(imageCartPostfix);
}