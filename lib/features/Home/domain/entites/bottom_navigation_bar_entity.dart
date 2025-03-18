import '../../../../core/utils/app_images.dart';
 
 class BottomNavigationBarEntity {
   final String activeImage, inActiveImage;
   final String name;
 
   BottomNavigationBarEntity(
       {required this.activeImage,
       required this.inActiveImage,
       required this.name});
 }
 
 List<BottomNavigationBarEntity> get bottomNavigationBarItems => [
       BottomNavigationBarEntity(
           activeImage: Assets.imgIconBottomBoldHome,
           inActiveImage: Assets.imgIconBottomOutlineHome,
           name: 'الرئيسية'),
       BottomNavigationBarEntity(
           activeImage: Assets.imgIconBottomBoldProducts,
           inActiveImage: Assets.imgIconBottomOutlineProducts,
           name: 'المنتجات'),
       BottomNavigationBarEntity(
           activeImage: Assets.imgIconBottomBoldShoppingCart,
           inActiveImage: Assets.imgIconBottomOutlineShoppingCart,
           name: 'سلة التسوق'),
       BottomNavigationBarEntity(
           activeImage: Assets.imgIconBottomBoldUser,
           inActiveImage: Assets.imgIconBottomOutlineUser,
           name: 'حسابي'),
     ];