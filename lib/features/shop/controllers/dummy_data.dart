import '../../../utils/constants/enums.dart';
import '../../../utils/constants/image_strings.dart';
import '../../personalization/models/address_model.dart';
import '../../personalization/models/user_model.dart';
import '../models/brand_category_model.dart';
import '../models/brand_model.dart';
import '../models/cart_item_model.dart';
import '../models/cart_model.dart';
import '../models/category_model.dart';
import '../models/order_model.dart';
import '../models/product_attribute_model.dart';
import '../models/product_category_model.dart';
import '../models/product_model.dart';
import '../models/product_review_model.dart';
import '../models/product_variation_model.dart';

class TDummyData {
  /// -- User
  static final UserModel user = UserModel(
    firstName: 'مروان',
    lastName: 'عزوز',
    email: 'azzouzmerw@gmail.com',
    phoneNumber: '+213562413935',
    password: '',
    profilePicture: TImages.user,
    addresses: [
      AddressModel(
        id: '1',
        name: 'مروان احمد',
        phoneNumber: '+213578059528',
        street: '82311 مسكن',
        city: 'عين ارنات',
        state: 'سطيف',
        postalCode: '87547',
        country: 'الجزائر',
      ),
      AddressModel(
        id: '2',
        name: 'مرواني عزوز',
        phoneNumber: '+213578059528',
        street: '82311 مسكن',
        city: 'عين ارنات',
        state: 'سطيف',
        postalCode: '87547',
        country: 'الجزائر',
      ),
    ],
  );

  /// -- Cart
  static final CartModel cart = CartModel(
    cartId: '001',
    items: [
      CartItemModel(
        productId: '001',
        variationId: '1',
        quantity: 1,
        title: products[0].title,
        image: products[0].thumbnail,
        brandName: products[0].brand!.name,
        price: products[0].productVariations![0].price,
        selectedVariation: products[0].productVariations![0].attributeValues,
      ),
      CartItemModel(
        productId: '002',
        variationId: '',
        quantity: 1,
        title: products[1].title,
        image: products[1].thumbnail,
        brandName: products[1].brand!.name,
        price: products[1].price,
        selectedVariation: products[1].productVariations != null
            ? products[1].productVariations![1].attributeValues
            : {},
      ),
      CartItemModel(
        productId: '003',
        variationId: '',
        quantity: 15,
        title: products[3].title,
        image: products[3].thumbnail,
        brandName: products[3].brand!.name,
        price: products[3].price,
        selectedVariation: products[3].productVariations != null
            ? products[3].productVariations![3].attributeValues
            : {},
      ),
      CartItemModel(
        productId: '004',
        variationId: '',
        quantity: 15,
        title: products[4].title,
        image: products[4].thumbnail,
        brandName: products[4].brand!.name,
        price: products[4].price,
        selectedVariation: products[4].productVariations != null
            ? products[4].productVariations![4].attributeValues
            : {},
      ),
      CartItemModel(
        productId: '005',
        variationId: '',
        quantity: 15,
        title: products[5].title,
        image: products[5].thumbnail,
        brandName: products[5].brand!.name,
        price: products[5].price,
        selectedVariation: products[5].productVariations != null
            ? products[5].productVariations![5].attributeValues
            : {},
      ),
    ],
  );

  /// -- Order
  static final List<OrderModel> orders = [
    OrderModel(
        id: 'CWT0012',
        status: OrderStatus.processing,
        items: cart.items,
        totalAmount: 265,
        orderDate: DateTime(2023, 09, 1),
        deliveryDate: DateTime(2023, 09, 9)),
    OrderModel(
        id: 'CWT0025',
        status: OrderStatus.shipped,
        items: cart.items,
        totalAmount: 369,
        orderDate: DateTime(2023, 10, 2),
        deliveryDate: DateTime(2023, 10, 6)),
    OrderModel(
        id: 'CWT0152',
        status: OrderStatus.delivered,
        items: cart.items,
        totalAmount: 254,
        orderDate: DateTime(2023, 11, 3),
        deliveryDate: DateTime(2023, 11, 8)),
    OrderModel(
        id: 'CWT0265',
        status: OrderStatus.delivered,
        items: cart.items,
        totalAmount: 355,
        orderDate: DateTime(2023, 12, 20),
        deliveryDate: DateTime(2023, 12, 25)),
    OrderModel(
        id: 'CWT1536',
        status: OrderStatus.delivered,
        items: cart.items,
        totalAmount: 115,
        orderDate: DateTime(2023, 12, 25),
        deliveryDate: DateTime(2024, 01, 1)),
  ];

  /// -- قائمة جميع الفئات
  static final List<CategoryModel> categories = [
    CategoryModel(
        id: '1', image: TImages.sportIcon, name: 'الرياضة', isFeatured: true),
    CategoryModel(
        id: '5',
        image: TImages.furnitureIcon,
        name: 'الأثاث',
        isFeatured: true),
    CategoryModel(
        id: '2',
        image: TImages.electronicsIcon,
        name: 'الأدوات الكهرومنزلية',
        isFeatured: true),
    CategoryModel(
        id: '3', image: TImages.clothIcon, name: 'الملابس', isFeatured: true),
    // CategoryModel(
    //     id: '4',
    //     image: TImages.animalIcon,
    //     name: 'الحيوانات',
    //     isFeatured: true),

    CategoryModel(
        id: '7',
        image: TImages.cosmeticsIcon,
        name: 'المستحضرات والأدوات الطبية',
        isFeatured: true),
    CategoryModel(
        id: '14',
        image: TImages.jeweleryIcon,
        name: 'العناية بالبشرة والشعر',
        isFeatured: true),
    CategoryModel(
        id: '20',
        image: TImages.jeweleryIcon,
        name: 'الكيميائية  والصناعية',
        isFeatured: true),
    CategoryModel(
        id: '21',
        image: TImages.jeweleryIcon,
        name: 'العناية بالبشرة والشعر',
        isFeatured: true),
    CategoryModel(
        id: '22',
        image: TImages.jeweleryIcon,
        name: 'الغذاء والمشروبات',
        isFeatured: true),
    CategoryModel(
        id: '23',
        image: TImages.jeweleryIcon,
        name: 'الأدوات المدرسية ولواحقه',
        isFeatured: true),

    /// الفئات الفرعية
    CategoryModel(
        id: '8', image: TImages.sportIcon, name: 'أحذية رياضية', parentId: '1'),
    CategoryModel(
        id: '9', image: TImages.sportIcon, name: 'بدلات رياضية', parentId: '1'),
    CategoryModel(
        id: '10',
        image: TImages.sportIcon,
        name: 'معدات رياضية',
        parentId: '1'),
    // الأثاث
    CategoryModel(
        id: '11',
        image: TImages.furnitureIcon,
        name: 'أثاث غرفة النوم',
        parentId: '5'),
    CategoryModel(
        id: '12',
        image: TImages.furnitureIcon,
        name: 'أثاث المطبخ',
        parentId: '5'),
    CategoryModel(
        id: '13',
        image: TImages.furnitureIcon,
        name: 'أثاث المكتب',
        parentId: '5'),
    // الإلكترونيات
    CategoryModel(
        id: '14',
        image: TImages.electronicsIcon,
        name: 'لابتوب',
        parentId: '2'),
    CategoryModel(
        id: '15',
        image: TImages.electronicsIcon,
        name: 'موبايل',
        parentId: '2'),

    CategoryModel(
        id: '16', image: TImages.clothIcon, name: 'قمصان', parentId: '3'),
  ];

  /// -- قائمة جميع العلامات التجارية
  static final List<BrandModel> brands = [
    BrandModel(
        id: '1',
        image: TImages.nikeLogo,
        name: 'نايكي',
        productsCount: 265,
        isFeatured: true),
    BrandModel(
        id: '2',
        image: TImages.adidasLogo,
        name: 'أديداس',
        productsCount: 95,
        isFeatured: true),
    BrandModel(
        id: '8',
        image: TImages.kenwoodLogo,
        name: 'كينوود',
        productsCount: 36,
        isFeatured: false),
    BrandModel(
        id: '9',
        image: TImages.ikeaLogo,
        name: 'إيكيا',
        productsCount: 36,
        isFeatured: false),
    BrandModel(
        id: '5',
        image: TImages.appleLogo,
        name: 'أبل',
        productsCount: 16,
        isFeatured: true),
    BrandModel(
        id: '10',
        image: TImages.acerlogo,
        name: 'إيسر',
        productsCount: 36,
        isFeatured: false),
    BrandModel(
        id: '3',
        image: TImages.jordanLogo,
        name: 'جوردن',
        productsCount: 36,
        isFeatured: true),
    BrandModel(
        id: '4',
        image: TImages.pumaLogo,
        name: 'بوما',
        productsCount: 65,
        isFeatured: true),
    BrandModel(
        id: '6',
        image: TImages.zaraLogo,
        name: 'زارا',
        productsCount: 36,
        isFeatured: true),
    BrandModel(
        id: '7',
        image: TImages.electronicsIcon,
        name: 'سامسونج',
        productsCount: 36,
        isFeatured: false),
  ];

  /// -- قائمة جميع فئات العلامات التجارية
  static final List<BrandCategoryModel> brandCategories = [
    BrandCategoryModel(brandId: '1', categoryId: '1'),
    BrandCategoryModel(brandId: '1', categoryId: '8'),
    BrandCategoryModel(brandId: '1', categoryId: '9'),
    BrandCategoryModel(brandId: '1', categoryId: '10'),
    BrandCategoryModel(brandId: '2', categoryId: '1'),
    BrandCategoryModel(brandId: '2', categoryId: '8'),
    BrandCategoryModel(brandId: '2', categoryId: '9'),
    BrandCategoryModel(brandId: '2', categoryId: '10'),
    BrandCategoryModel(brandId: '3', categoryId: '1'),
    BrandCategoryModel(brandId: '3', categoryId: '8'),
    BrandCategoryModel(brandId: '3', categoryId: '9'),
    BrandCategoryModel(brandId: '3', categoryId: '10'),
    BrandCategoryModel(brandId: '4', categoryId: '1'),
    BrandCategoryModel(brandId: '4', categoryId: '8'),
    BrandCategoryModel(brandId: '4', categoryId: '9'),
    BrandCategoryModel(brandId: '4', categoryId: '10'),
    BrandCategoryModel(brandId: '5', categoryId: '15'),
    BrandCategoryModel(brandId: '5', categoryId: '2'),
    BrandCategoryModel(brandId: '10', categoryId: '2'),
    BrandCategoryModel(brandId: '10', categoryId: '14'),
    BrandCategoryModel(brandId: '6', categoryId: '3'),
    BrandCategoryModel(brandId: '6', categoryId: '16'),
    BrandCategoryModel(brandId: '7', categoryId: '2'),
    BrandCategoryModel(brandId: '8', categoryId: '5'),
    BrandCategoryModel(brandId: '8', categoryId: '11'),
    BrandCategoryModel(brandId: '8', categoryId: '12'),
    BrandCategoryModel(brandId: '8', categoryId: '13'),
    BrandCategoryModel(brandId: '9', categoryId: '5'),
    BrandCategoryModel(brandId: '9', categoryId: '11'),
    BrandCategoryModel(brandId: '9', categoryId: '12'),
    BrandCategoryModel(brandId: '9', categoryId: '13'),
  ];

  /// -- List of all Product Categories
  static final List<ProductCategoryModel> productCategories = [
    ProductCategoryModel(productId: '001', categoryId: '1'),
    ProductCategoryModel(productId: '001', categoryId: '8'),
    ProductCategoryModel(productId: '004', categoryId: '3'),
    ProductCategoryModel(productId: '002', categoryId: '3'),
    ProductCategoryModel(productId: '002', categoryId: '16'),
    ProductCategoryModel(productId: '003', categoryId: '3'),
    ProductCategoryModel(productId: '005', categoryId: '1'),
    ProductCategoryModel(productId: '005', categoryId: '8'),
    ProductCategoryModel(productId: '040', categoryId: '2'),
    ProductCategoryModel(productId: '040', categoryId: '15'),
    ProductCategoryModel(productId: '006', categoryId: '2'),
    ProductCategoryModel(productId: '007', categoryId: '4'),
    ProductCategoryModel(productId: '009', categoryId: '1'),
    ProductCategoryModel(productId: '009', categoryId: '8'),
    ProductCategoryModel(productId: '010', categoryId: '1'),
    ProductCategoryModel(productId: '010', categoryId: '8'),
    ProductCategoryModel(productId: '011', categoryId: '1'),
    ProductCategoryModel(productId: '011', categoryId: '8'),
    ProductCategoryModel(productId: '012', categoryId: '1'),
    ProductCategoryModel(productId: '012', categoryId: '8'),
    ProductCategoryModel(productId: '013', categoryId: '1'),
    ProductCategoryModel(productId: '013', categoryId: '8'),

    ProductCategoryModel(productId: '014', categoryId: '1'),
    ProductCategoryModel(productId: '014', categoryId: '9'),
    ProductCategoryModel(productId: '015', categoryId: '1'),
    ProductCategoryModel(productId: '015', categoryId: '9'),
    ProductCategoryModel(productId: '016', categoryId: '1'),
    ProductCategoryModel(productId: '016', categoryId: '9'),
    ProductCategoryModel(productId: '017', categoryId: '1'),
    ProductCategoryModel(productId: '017', categoryId: '9'),

    ProductCategoryModel(productId: '018', categoryId: '1'),
    ProductCategoryModel(productId: '018', categoryId: '10'),
    ProductCategoryModel(productId: '019', categoryId: '1'),
    ProductCategoryModel(productId: '019', categoryId: '10'),
    ProductCategoryModel(productId: '020', categoryId: '1'),
    ProductCategoryModel(productId: '020', categoryId: '10'),
    ProductCategoryModel(productId: '021', categoryId: '1'),
    ProductCategoryModel(productId: '021', categoryId: '10'),

    ProductCategoryModel(productId: '022', categoryId: '5'),
    ProductCategoryModel(productId: '022', categoryId: '11'),
    ProductCategoryModel(productId: '023', categoryId: '5'),
    ProductCategoryModel(productId: '023', categoryId: '11'),
    ProductCategoryModel(productId: '024', categoryId: '5'),
    ProductCategoryModel(productId: '024', categoryId: '11'),
    ProductCategoryModel(productId: '025', categoryId: '5'),
    ProductCategoryModel(productId: '025', categoryId: '11'),

    ProductCategoryModel(productId: '026', categoryId: '5'),
    ProductCategoryModel(productId: '026', categoryId: '12'),
    ProductCategoryModel(productId: '027', categoryId: '5'),
    ProductCategoryModel(productId: '027', categoryId: '12'),
    ProductCategoryModel(productId: '028', categoryId: '5'),
    ProductCategoryModel(productId: '028', categoryId: '12'),

    ProductCategoryModel(productId: '029', categoryId: '5'),
    ProductCategoryModel(productId: '029', categoryId: '13'),
    ProductCategoryModel(productId: '030', categoryId: '5'),
    ProductCategoryModel(productId: '030', categoryId: '13'),
    ProductCategoryModel(productId: '031', categoryId: '5'),
    ProductCategoryModel(productId: '031', categoryId: '13'),
    ProductCategoryModel(productId: '032', categoryId: '5'),
    ProductCategoryModel(productId: '032', categoryId: '13'),

    ProductCategoryModel(productId: '033', categoryId: '2'),
    ProductCategoryModel(productId: '033', categoryId: '14'),
    ProductCategoryModel(productId: '034', categoryId: '2'),
    ProductCategoryModel(productId: '034', categoryId: '14'),
    ProductCategoryModel(productId: '035', categoryId: '2'),
    ProductCategoryModel(productId: '035', categoryId: '14'),
    ProductCategoryModel(productId: '036', categoryId: '2'),
    ProductCategoryModel(productId: '036', categoryId: '14'),

    ProductCategoryModel(productId: '037', categoryId: '2'),
    ProductCategoryModel(productId: '037', categoryId: '15'),
    ProductCategoryModel(productId: '038', categoryId: '2'),
    ProductCategoryModel(productId: '038', categoryId: '15'),
    ProductCategoryModel(productId: '039', categoryId: '2'),
    ProductCategoryModel(productId: '039', categoryId: '15'),
    //040 after product 005

    ProductCategoryModel(productId: '008', categoryId: '2'),
  ];

  /// -- List of all Products
  static final List<ProductModel> products = [
    ProductModel(
      id: '001',
      title: 'حذاء رياضي أخضر من نايك',
      stock: 15,
      price: 135,
      isFeatured: true,
      thumbnail: TImages.productImage1,
      description: 'حذاء رياضي أخضر من نايك',
      brand: BrandModel(
          id: '1',
          image: TImages.nikeLogo,
          name: 'نايكي',
          productsCount: 265,
          isFeatured: true),
      images: [
        TImages.productImage1,
        TImages.productImage23,
        TImages.productImage21,
        TImages.productImage9
      ],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '1',
      productAttributes: [
        ProductAttributeModel(name: 'اللون', values: ['أخضر', 'أسود', 'أحمر']),
        ProductAttributeModel(
            name: 'المقاس', values: ['EU 30', 'EU 32', 'EU 34']),
      ],
      productVariations: [
        ProductVariationModel(
            id: '1',
            stock: 34,
            price: 134,
            salePrice: 122.6,
            image: TImages.productImage1,
            description: 'هذا وصف المنتج لحذاء رياضي أخضر من نايك.',
            attributeValues: {'اللون': 'أخضر', 'المقاس': 'EU 34'}),
        ProductVariationModel(
            id: '2',
            stock: 15,
            price: 132,
            image: TImages.productImage23,
            attributeValues: {'اللون': 'أسود', 'المقاس': 'EU 32'}),
        ProductVariationModel(
            id: '3',
            stock: 0,
            price: 234,
            image: TImages.productImage23,
            attributeValues: {'اللون': 'أسود', 'المقاس': 'EU 34'}),
        ProductVariationModel(
            id: '4',
            stock: 222,
            price: 232,
            image: TImages.productImage1,
            attributeValues: {'اللون': 'أخضر', 'المقاس': 'EU 32'}),
        ProductVariationModel(
            id: '5',
            stock: 0,
            price: 334,
            image: TImages.productImage21,
            attributeValues: {'اللون': 'أحمر', 'المقاس': 'EU 34'}),
        ProductVariationModel(
            id: '6',
            stock: 11,
            price: 332,
            image: TImages.productImage21,
            attributeValues: {'اللون': 'أحمر', 'المقاس': 'EU 32'}),
      ],
    ),
    ProductModel(
      id: '002',
      title: 'تيشيرت أزرق لجميع الأعمار',
      stock: 15,
      price: 35,
      isFeatured: true,
      thumbnail: TImages.productImage69,
      description:
          'هذا وصف المنتج لتيشيرت أزرق بدون أكمام من نايك. هناك المزيد من التفاصيل التي يمكن إضافتها لكني أمارس فقط ولا شيء آخر.',
      brand: BrandModel(id: '6', image: TImages.zaraLogo, name: 'زارا'),
      images: [
        TImages.productImage68,
        TImages.productImage69,
        TImages.productImage5
      ],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '16',
      productAttributes: [
        ProductAttributeModel(name: 'المقاس', values: ['EU34', 'EU32']),
        ProductAttributeModel(name: 'اللون', values: ['أخضر', 'أحمر', 'أزرق']),
      ],
    ),
    ProductModel(
      id: '003',
      title: 'سترة جلدية بنية',
      stock: 15,
      price: 38000,
      isFeatured: false,
      thumbnail: TImages.productImage64,
      description:
          'هذا وصف المنتج لسترة جلدية بنية. هناك المزيد من التفاصيل التي يمكن إضافتها لكني أمارس فقط ولا شيء آخر.',
      brand: BrandModel(id: '6', image: TImages.zaraLogo, name: 'زارا'),
      images: [
        TImages.productImage64,
        TImages.productImage65,
        TImages.productImage66,
        TImages.productImage67
      ],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '16',
      productAttributes: [
        ProductAttributeModel(name: 'المقاس', values: ['EU34', 'EU32']),
        ProductAttributeModel(name: 'اللون', values: ['أخضر', 'أحمر', 'أزرق']),
      ],
    ),
    ProductModel(
      id: '004',
      title: 'تيشيرت بأربعة ألوان وذات ياقة جافة',
      stock: 15,
      price: 135,
      isFeatured: false,
      thumbnail: TImages.productImage60,
      description:
          'هذا وصف المنتج لتيشيرت بأربعة ألوان وذات ياقة جافة. هناك المزيد من التفاصيل التي يمكن إضافتها لكن هذا مجرد عرض تجريبي ولا شيء آخر.',
      brand: BrandModel(id: '6', image: TImages.zaraLogo, name: 'زارا'),
      images: [
        TImages.productImage60,
        TImages.productImage61,
        TImages.productImage62,
        TImages.productImage63
      ],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '16',
      productAttributes: [
        ProductAttributeModel(
            name: 'اللون', values: ['أحمر', 'أصفر', 'أخضر', 'أزرق']),
        ProductAttributeModel(
            name: 'المقاس', values: ['EU 30', 'EU 32', 'EU 34']),
      ],
      productVariations: [
        ProductVariationModel(
            id: '1',
            stock: 34,
            price: 134,
            salePrice: 122.6,
            image: TImages.productImage60,
            description: 'هذا وصف المنتج لتيشيرت بأربعة ألوان وذات ياقة جافة.',
            attributeValues: {'اللون': 'أحمر', 'المقاس': 'EU 34'}),
        ProductVariationModel(
            id: '2',
            stock: 15,
            price: 132,
            image: TImages.productImage60,
            attributeValues: {'اللون': 'أحمر', 'المقاس': 'EU 32'}),
        ProductVariationModel(
            id: '3',
            stock: 0,
            price: 234,
            image: TImages.productImage61,
            attributeValues: {'اللون': 'أصفر', 'المقاس': 'EU 34'}),
        ProductVariationModel(
            id: '4',
            stock: 222,
            price: 232,
            image: TImages.productImage61,
            attributeValues: {'اللون': 'أصفر', 'المقاس': 'EU 32'}),
        ProductVariationModel(
            id: '5',
            stock: 0,
            price: 334,
            image: TImages.productImage62,
            attributeValues: {'اللون': 'أخضر', 'المقاس': 'EU 34'}),
        ProductVariationModel(
            id: '6',
            stock: 11,
            price: 332,
            image: TImages.productImage62,
            attributeValues: {'اللون': 'أخضر', 'المقاس': 'EU 30'}),
        ProductVariationModel(
            id: '7',
            stock: 0,
            price: 334,
            image: TImages.productImage63,
            attributeValues: {'اللون': 'أزرق', 'المقاس': 'EU 30'}),
        ProductVariationModel(
            id: '8',
            stock: 11,
            price: 332,
            image: TImages.productImage63,
            attributeValues: {'اللون': 'أزرق', 'المقاس': 'EU 34'}),
      ],
    ),

// Products after banner
    ProductModel(
      id: '005',
      title: 'أحذية نايك إير جوردن',
      stock: 15,
      price: 35,
      isFeatured: false,
      thumbnail: TImages.productImage10,
      description: 'أحذية نايك إير جوردن للجري. منتج ذو جودة وطويل العمر',
      brand: BrandModel(
          id: '1',
          image: TImages.nikeLogo,
          name: 'نايكي',
          productsCount: 265,
          isFeatured: true),
      images: [
        TImages.productImage7,
        TImages.productImage8,
        TImages.productImage9,
        TImages.productImage10
      ],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '8',
      productAttributes: [
        ProductAttributeModel(
            name: 'اللون', values: ['برتقالي', 'أسود', 'بني']),
        ProductAttributeModel(
            name: 'المقاس', values: ['EU 30', 'EU 32', 'EU 34']),
      ],
      productVariations: [
        ProductVariationModel(
            id: '1',
            stock: 34,
            price: 134,
            salePrice: 122.6,
            image: TImages.productImage7,
            description: 'أحذية نايك إير جوردن للجري. منتج ذو جودة وطويل العمر',
            attributeValues: {'اللون': 'برتقالي', 'المقاس': 'EU 34'}),
        ProductVariationModel(
            id: '2',
            stock: 15,
            price: 132,
            image: TImages.productImage8,
            attributeValues: {'اللون': 'أسود', 'المقاس': 'EU 32'}),
        ProductVariationModel(
            id: '3',
            stock: 0,
            price: 234,
            image: TImages.productImage9,
            attributeValues: {'اللون': 'أسود', 'المقاس': 'EU 34'}),
        ProductVariationModel(
            id: '4',
            stock: 222,
            price: 232,
            image: TImages.productImage10,
            attributeValues: {'اللون': 'برتقالي', 'المقاس': 'EU 32'}),
        ProductVariationModel(
            id: '5',
            stock: 0,
            price: 334,
            image: TImages.productImage10,
            attributeValues: {'اللون': 'بني', 'المقاس': 'EU 34'}),
        ProductVariationModel(
            id: '6',
            stock: 11,
            price: 332,
            image: TImages.productImage10,
            attributeValues: {'اللون': 'بني', 'المقاس': 'EU 30'}),
      ],
    ),
    ProductModel(
      id: '006',
      title: 'تيشيرت أزرق بأكمام قصيرة',
      stock: 15,
      price: 55,
      isFeatured: true,
      thumbnail: TImages.productImage69,
      description: 'تيشيرت أزرق بأكمام قصيرة. منتج مريح وعصري',
      brand: BrandModel(
          id: '4',
          image: TImages.adidasLogo,
          name: 'أديداس',
          productsCount: 350,
          isFeatured: true),
      images: [TImages.productImage69, TImages.productImage68],
      salePrice: 30,
      sku: 'AD234',
      categoryId: '12',
      productAttributes: [
        ProductAttributeModel(name: 'اللون', values: ['أزرق', 'أبيض']),
        ProductAttributeModel(name: 'المقاس', values: ['S', 'M', 'L']),
      ],
    ),

//Furniture
//Bedroom
    ProductModel(
      id: '022',
      title: 'سرير خشبي نقي',
      stock: 15,
      price: 950,
      isFeatured: true,
      thumbnail: TImages.productImage32,
      description:
          'فلاتر هو إطار مفتوح المصدر من جوجل لبناء واجهات مميزة وعالية الجودة (سريعة جدًا) لتطبيقات iOS وAndroid باستخدام قاعدة كود موحدة.',
      brand: BrandModel(id: '8', image: TImages.kenwoodLogo, name: 'كينوود'),
      images: [
        TImages.productImage43,
        TImages.productImage44,
        TImages.productImage45,
        TImages.productImage46
      ],
      salePrice: 600,
      sku: 'ABR4568',
      categoryId: '11',
      productAttributes: [
        ProductAttributeModel(name: 'اللون', values: ['أسود', 'رمادي', 'بني']),
        ProductAttributeModel(
            name: 'الحجم', values: ['EU 30', 'EU 32', 'EU 34']),
      ],
      productVariations: [
        ProductVariationModel(
            id: '1',
            stock: 16,
            price: 36,
            salePrice: 12.6,
            image: TImages.productImage32,
            description:
                'فلاتر هو إطار مفتوح المصدر من جوجل لبناء واجهات مميزة وعالية الجودة (سريعة جدًا) لتطبيقات iOS وAndroid باستخدام قاعدة كود موحدة.',
            attributeValues: {'اللون': 'بني', 'الحجم': 'EU 34'}),
        ProductVariationModel(
            id: '2',
            stock: 15,
            price: 35,
            image: TImages.productImage45,
            attributeValues: {'اللون': 'بني', 'الحجم': 'EU 32'}),
        ProductVariationModel(
            id: '3',
            stock: 14,
            price: 34,
            image: TImages.productImage46,
            attributeValues: {'اللون': 'بني', 'الحجم': 'EU 30'}),
        ProductVariationModel(
            id: '4',
            stock: 13,
            price: 33,
            image: TImages.productImage43,
            attributeValues: {'اللون': 'أسود', 'الحجم': 'EU 32'}),
        ProductVariationModel(
            id: '5',
            stock: 12,
            price: 32,
            image: TImages.productImage43,
            attributeValues: {'اللون': 'أسود', 'الحجم': 'EU 34'}),
        ProductVariationModel(
            id: '6',
            stock: 11,
            price: 31,
            image: TImages.productImage44,
            attributeValues: {'اللون': 'رمادي', 'الحجم': 'EU 32'}),
      ],
    ),
    ProductModel(
      id: '023',
      title: 'مصباح طاولة جانبية',
      stock: 15,
      price: 25,
      thumbnail: TImages.productImage33,
      description:
          'وصف المنتج لمصباح الطاولة الجانبية. هناك المزيد من التفاصيل التي يمكن إضافتها لكني أمارس فقط ولا شيء آخر.',
      brand: BrandModel(id: '8', image: TImages.kenwoodLogo, name: 'كينوود'),
      // salePrice: 400,1
      sku: 'ABR4568',
      categoryId: '11',
      productAttributes: [
        ProductAttributeModel(name: 'الحجم', values: ['EU34', 'EU32']),
        ProductAttributeModel(name: 'اللون', values: ['أخضر', 'أحمر', 'أزرق']),
      ],
    ),
    ProductModel(
      id: '024',
      title: 'كنبة غرفة نوم',
      stock: 15,
      price: 25,
      thumbnail: TImages.productImage34,
      description:
          'وصف المنتج لكنبة غرفة النوم. هناك المزيد من التفاصيل التي يمكن إضافتها لكني أمارس فقط ولا شيء آخر.',
      brand: BrandModel(id: '8', image: TImages.kenwoodLogo, name: 'كينوود'),
      // salePrice: 400,1
      sku: 'ABR4568',
      categoryId: '11',
      productAttributes: [
        ProductAttributeModel(name: 'الحجم', values: ['EU34', 'EU32']),
        ProductAttributeModel(name: 'اللون', values: ['أخضر', 'أحمر', 'أزرق']),
      ],
    ),
    ProductModel(
      id: '025',
      title: 'خزانة غرفة نوم',
      stock: 15,
      price: 56,
      thumbnail: TImages.productImage35,
      description:
          'وصف المنتج لخزانة غرفة النوم. هناك المزيد من التفاصيل التي يمكن إضافتها لكني أمارس فقط ولا شيء آخر.',
      brand: BrandModel(id: '8', image: TImages.kenwoodLogo, name: 'كينوود'),
      // salePrice: 400,1
      sku: 'ABR4568',
      categoryId: '11',
      productAttributes: [
        ProductAttributeModel(name: 'الحجم', values: ['EU34', 'EU32']),
        ProductAttributeModel(name: 'اللون', values: ['أخضر', 'أحمر', 'أزرق']),
      ],
    ),
//Kitchen
    ProductModel(
      id: '026',
      title: 'عداد المطبخ',
      stock: 15,
      price: 1012,
      thumbnail: TImages.productImage36,
      description:
          'وصف المنتج لعداد المطبخ. هناك المزيد من التفاصيل التي يمكن إضافتها لكني أمارس فقط ولا شيء آخر.',
      brand: BrandModel(id: '2', image: TImages.adidasLogo, name: 'أديداس'),
      // salePrice: 400,1
      sku: 'ABR4568',
      categoryId: '12',
      productAttributes: [
        ProductAttributeModel(name: 'الحجم', values: ['EU34', 'EU32']),
        ProductAttributeModel(name: 'اللون', values: ['أخضر', 'أحمر', 'أزرق']),
      ],
    ),
    ProductModel(
      id: '027',
      title: 'طاولة طعام',
      stock: 15,
      price: 1012,
      thumbnail: TImages.productImage37,
      description:
          'وصف المنتج لطاولة الطعام. هناك المزيد من التفاصيل التي يمكن إضافتها لكني أمارس فقط ولا شيء آخر.',
      brand: BrandModel(id: '2', image: TImages.adidasLogo, name: 'أديداس'),
      // salePrice: 400,1
      sku: 'ABR4568',
      categoryId: '12',
      productAttributes: [
        ProductAttributeModel(name: 'الحجم', values: ['EU34', 'EU32']),
        ProductAttributeModel(name: 'اللون', values: ['أخضر', 'أحمر', 'أزرق']),
      ],
    ),
    ProductModel(
      id: '028',
      title: 'ثلاجة',
      stock: 15,
      price: 987,
      thumbnail: TImages.productImage38,
      description:
          'وصف المنتج للثلاجة. هناك المزيد من التفاصيل التي يمكن إضافتها لكني أمارس فقط ولا شيء آخر.',
      brand: BrandModel(id: '2', image: TImages.adidasLogo, name: 'أديداس'),
      // salePrice: 400,1
      sku: 'ABR4568',
      categoryId: '12',
      productAttributes: [
        ProductAttributeModel(name: 'الحجم', values: ['EU34', 'EU32']),
        ProductAttributeModel(name: 'اللون', values: ['أخضر', 'أحمر', 'أزرق']),
      ],
    ),
//Office
    ProductModel(
      id: '029',
      title: 'كرسي مكتب أحمر',
      stock: 15,
      price: 150,
      thumbnail: TImages.productImage39,
      description:
          'وصف المنتج لكرسي المكتب. هناك المزيد من التفاصيل التي يمكن إضافتها لكني أمارس فقط ولا شيء آخر.',
      brand: BrandModel(id: '9', image: TImages.ikeaLogo, name: 'IKEA'),
      // salePrice: 400,1
      sku: 'ABR4568',
      categoryId: '13',
      productAttributes: [
        ProductAttributeModel(name: 'الحجم', values: ['EU34', 'EU32']),
        ProductAttributeModel(name: 'اللون', values: ['أخضر', 'أحمر', 'أزرق']),
      ],
    ),
    ProductModel(
      id: '030',
      title: 'كرسي مكتب أبيض',
      stock: 15,
      price: 140,
      thumbnail: TImages.productImage40,
      description:
          'وصف المنتج لكرسي المكتب. هناك المزيد من التفاصيل التي يمكن إضافتها لكني أمارس فقط ولا شيء آخر.',
      brand: BrandModel(id: '9', image: TImages.ikeaLogo, name: 'IKEA'),
      // salePrice: 400,1
      sku: 'ABR4568',
      categoryId: '13',
      productAttributes: [
        ProductAttributeModel(name: 'الحجم', values: ['EU34', 'EU32']),
        ProductAttributeModel(name: 'اللون', values: ['أخضر', 'أحمر', 'أزرق']),
      ],
    ),
    ProductModel(
      id: '031',
      title: 'مكتب مكتب أحمر',
      stock: 15,
      price: 360,
      thumbnail: TImages.productImage41,
      description:
          'وصف المنتج لمكتب المكتب. هناك المزيد من التفاصيل التي يمكن إضافتها لكني أمارس فقط ولا شيء آخر.',
      brand: BrandModel(id: '9', image: TImages.ikeaLogo, name: 'IKEA'),
      // salePrice: 400,1
      sku: 'ABR4568',
      categoryId: '13',
      productAttributes: [
        ProductAttributeModel(name: 'الحجم', values: ['EU34', 'EU32']),
        ProductAttributeModel(name: 'اللون', values: ['أخضر', 'أحمر', 'أزرق']),
      ],
    ),
    ProductModel(
      id: '032',
      title: 'مكتب مكتب بني',
      stock: 15,
      price: 400,
      thumbnail: TImages.productImage42,
      description:
          'وصف المنتج لمكتب المكتب. هناك المزيد من التفاصيل التي يمكن إضافتها لكني أمارس فقط ولا شيء آخر.',
      brand: BrandModel(id: '9', image: TImages.ikeaLogo, name: 'IKEA'),
      // salePrice: 400,1
      sku: 'ABR4568',
      categoryId: '13',
      productAttributes: [
        ProductAttributeModel(name: 'الحجم', values: ['EU34', 'EU32']),
        ProductAttributeModel(name: 'اللون', values: ['أخضر', 'أحمر', 'أزرق']),
      ],
    ),

    //Electronics
//Laptops
    ProductModel(
      id: '033',
      title:
          'حاسوب محمول Acer RAM من 8 جيجابايت إلى 16 جيجابايت و 512 جيجابايت إلى 2 تيرابايت',
      stock: 15,
      price: 950,
      isFeatured: true,
      thumbnail: TImages.productImage56,
      description:
          'وصف المنتج لحاسوب Acer المحمول. هناك المزيد من التفاصيل التي يمكن إضافتها لكني أمارس فقط ولا شيء آخر.',
      brand: BrandModel(id: '10', image: TImages.acerlogo, name: 'Acer'),
      images: [
        TImages.productImage56,
        TImages.productImage47,
        TImages.productImage57,
        TImages.productImage58
      ],
      salePrice: 800,
      sku: 'ABR4568',
      categoryId: '14',
      productAttributes: [
        ProductAttributeModel(
            name: 'الذاكرة العشوائية',
            values: ['6 جيجابايت', '8 جيجابايت', '16 جيجابايت']),
        ProductAttributeModel(
            name: 'التخزين',
            values: ['512 جيجابايت', '1 تيرابايت', '2 تيرابايت']),
      ],
      productVariations: [
        ProductVariationModel(
            id: '1',
            stock: 16,
            price: 400,
            salePrice: 350,
            image: TImages.productImage56,
            description:
                'وصف المنتج لحاسوب Acer المحمول. هناك المزيد من التفاصيل التي يمكن إضافتها لكني أمارس فقط ولا شيء آخر.',
            attributeValues: {
              'الذاكرة العشوائية': '6 جيجابايت',
              'التخزين': '512 جيجابايت'
            }),
        ProductVariationModel(
            id: '2',
            stock: 15,
            price: 450,
            image: TImages.productImage47,
            attributeValues: {
              'الذاكرة العشوائية': '8 جيجابايت',
              'التخزين': '512 جيجابايت'
            }),
        ProductVariationModel(
            id: '3',
            stock: 14,
            price: 470,
            image: TImages.productImage59,
            attributeValues: {
              'الذاكرة العشوائية': '8 جيجابايت',
              'التخزين': '1 تيرابايت'
            }),
        ProductVariationModel(
            id: '4',
            stock: 13,
            price: 500,
            image: TImages.productImage58,
            attributeValues: {
              'الذاكرة العشوائية': '16 جيجابايت',
              'التخزين': '512 جيجابايت'
            }),
        ProductVariationModel(
            id: '5',
            stock: 12,
            price: 650,
            image: TImages.productImage57,
            attributeValues: {
              'الذاكرة العشوائية': '16 جيجابايت',
              'التخزين': '1 تيرابايت'
            }),
        ProductVariationModel(
            id: '6',
            stock: 11,
            price: 800,
            image: TImages.productImage59,
            attributeValues: {
              'الذاكرة العشوائية': '16 جيجابايت',
              'التخزين': '2 تيرابايت'
            }),
      ],
    ),
    ProductModel(
      id: '034',
      title: 'حاسوب محمول Acer 6 جيجابايت 1 تيرابايت',
      stock: 15,
      price: 400,
      thumbnail: TImages.productImage48,
      description:
          'وصف المنتج لحاسوب Acer المحمول. هناك المزيد من التفاصيل التي يمكن إضافتها لكني أمارس فقط ولا شيء آخر.',
      brand: BrandModel(id: '10', image: TImages.acerlogo, name: 'Acer'),
      // salePrice: 400,1
      sku: 'ABR4568',
      categoryId: '14',
      productAttributes: [
        ProductAttributeModel(name: 'الحجم', values: ['EU34', 'EU32']),
        ProductAttributeModel(name: 'اللون', values: ['أخضر', 'أحمر', 'أزرق']),
      ],
    ),
    ProductModel(
      id: '035',
      title: 'حاسوب محمول Acer 6 جيجابايت 500 جيجابايت',
      stock: 15,
      price: 400,
      thumbnail: TImages.productImage49,
      description:
          'وصف المنتج لحاسوب Acer المحمول. هناك المزيد من التفاصيل التي يمكن إضافتها لكني أمارس فقط ولا شيء آخر.',
      brand: BrandModel(id: '10', image: TImages.acerlogo, name: 'Acer'),
      // salePrice: 400,1
      sku: 'ABR4568',
      categoryId: '14',
      productAttributes: [
        ProductAttributeModel(name: 'الحجم', values: ['EU34', 'EU32']),
        ProductAttributeModel(name: 'اللون', values: ['أخضر', 'أحمر', 'أزرق']),
      ],
    ),
    ProductModel(
      id: '036',
      title: 'حاسوب محمول Acer 4 جيجابايت 500 جيجابايت',
      stock: 15,
      price: 400,
      thumbnail: TImages.productImage50,
      description:
          'وصف المنتج لحاسوب Acer المحمول. هناك المزيد من التفاصيل التي يمكن إضافتها لكني أمارس فقط ولا شيء آخر.',
      brand: BrandModel(id: '10', image: TImages.acerlogo, name: 'Acer'),
      // salePrice: 400,1
      sku: 'ABR4568',
      categoryId: '14',
      productAttributes: [
        ProductAttributeModel(name: 'الحجم', values: ['EU34', 'EU32']),
        ProductAttributeModel(name: 'اللون', values: ['أخضر', 'أحمر', 'أزرق']),
      ],
    ),
//Mobiles
    ProductModel(
      id: '037',
      title: 'آيفون 13 برو 512 جيجابايت',
      stock: 15,
      price: 999,
      thumbnail: TImages.productImage51,
      description:
          'وصف المنتج لآيفون. هناك المزيد من التفاصيل التي يمكن إضافتها لكني أمارس فقط ولا شيء آخر.',
      brand: BrandModel(id: '5', image: TImages.appleLogo, name: 'Apple'),
      // salePrice: 400,1
      sku: 'ABR4568',
      categoryId: '15',
      productAttributes: [
        ProductAttributeModel(name: 'الحجم', values: ['EU34', 'EU32']),
        ProductAttributeModel(name: 'اللون', values: ['أخضر', 'أحمر', 'أزرق']),
      ],
    ),
    ProductModel(
      id: '038',
      title: 'آيفون 14 برو 512 جيجابايت',
      stock: 15,
      price: 999,
      thumbnail: TImages.productImage52,
      description:
          'وصف المنتج لآيفون. هناك المزيد من التفاصيل التي يمكن إضافتها لكني أمارس فقط ولا شيء آخر.',
      brand: BrandModel(id: '5', image: TImages.appleLogo, name: 'Apple'),
      // salePrice: 400,1
      sku: 'ABR4568',
      categoryId: '15',
      productAttributes: [
        ProductAttributeModel(name: 'الحجم', values: ['EU34', 'EU32']),
        ProductAttributeModel(name: 'اللون', values: ['أخضر', 'أحمر', 'أزرق']),
      ],
    ),
    ProductModel(
      id: '039',
      title: 'آيفون 14 أبيض 512 جيجابايت',
      stock: 15,
      price: 999,
      thumbnail: TImages.productImage53,
      description:
          'وصف المنتج لآيفون. هناك المزيد من التفاصيل التي يمكن إضافتها لكني أمارس فقط ولا شيء آخر.',
      brand: BrandModel(id: '5', image: TImages.appleLogo, name: 'Apple'),
      // salePrice: 400,1
      sku: 'ABR4568',
      categoryId: '15',
      productAttributes: [
        ProductAttributeModel(name: 'الحجم', values: ['EU34', 'EU32']),
        ProductAttributeModel(name: 'اللون', values: ['أخضر', 'أحمر', 'أزرق']),
      ],
    ),
    ProductModel(
      id: '040',
      title: 'آيفون 12، 4 ألوان 128 جيجابايت و256 جيجابايت',
      stock: 15,
      price: 950,
      isFeatured: true,
      thumbnail: TImages.productImage70,
      description:
          'وصف المنتج لآيفون 12. هناك المزيد من التفاصيل التي يمكن إضافتها لكني أمارس فقط ولا شيء آخر.',
      brand: BrandModel(id: '5', image: TImages.appleLogo, name: 'Apple'),
      images: [
        TImages.productImage70,
        TImages.productImage71,
        TImages.productImage72,
        TImages.productImage73
      ],
      salePrice: 800,
      sku: 'ABR4568',
      categoryId: '15',
      productAttributes: [
        ProductAttributeModel(
            name: 'اللون', values: ['أخضر', 'أحمر', 'أزرق', 'أسود']),
        ProductAttributeModel(
            name: 'التخزين', values: ['128 جيجابايت', '256 جيجابايت']),
      ],
      productVariations: [
        ProductVariationModel(
            id: '1',
            stock: 16,
            price: 400,
            salePrice: 350,
            image: TImages.productImage70,
            description:
                'وصف المنتج لآيفون 12. هناك المزيد من التفاصيل التي يمكن إضافتها لكني أمارس فقط ولا شيء آخر.',
            attributeValues: {'اللون': 'أحمر', 'التخزين': '128 جيجابايت'}),
        ProductVariationModel(
            id: '2',
            stock: 15,
            price: 450,
            image: TImages.productImage70,
            attributeValues: {'اللون': 'أحمر', 'التخزين': '256 جيجابايت'}),
        ProductVariationModel(
            id: '3',
            stock: 14,
            price: 470,
            image: TImages.productImage71,
            attributeValues: {'اللون': 'أزرق', 'التخزين': '128 جيجابايت'}),
        ProductVariationModel(
            id: '4',
            stock: 13,
            price: 500,
            image: TImages.productImage71,
            attributeValues: {'اللون': 'أزرق', 'التخزين': '256 جيجابايت'}),
        ProductVariationModel(
            id: '5',
            stock: 12,
            price: 650,
            image: TImages.productImage72,
            attributeValues: {'اللون': 'أخضر', 'التخزين': '128 جيجابايت'}),
        ProductVariationModel(
            id: '6',
            stock: 11,
            price: 800,
            image: TImages.productImage73,
            attributeValues: {'اللون': 'أسود', 'التخزين': '128 جيجابايت'}),
        ProductVariationModel(
            id: '6',
            stock: 11,
            price: 800,
            image: TImages.productImage73,
            attributeValues: {'اللون': 'أسود', 'التخزين': '256 جيجابايت'}),
      ],
    ),
    ProductModel(
      id: '008',
      title: 'آبل آيفون 8 (أسود، 64 جيجابايت)',
      stock: 15,
      price: 480,
      isFeatured: true,
      thumbnail: TImages.productImage14,
      description:
          'وصف المنتج لآيفون 8. هناك المزيد من التفاصيل التي يمكن إضافتها لكني أمارس فقط ولا شيء آخر.',
      brand: BrandModel(id: '5', image: TImages.appleLogo, name: 'آيفون 8'),
      images: [
        TImages.productImage15,
        TImages.productImage16,
        TImages.productImage17,
        TImages.productImage14
      ],
      salePrice: 380,
      sku: 'ABR4568',
      categoryId: '15',
      productAttributes: [
        ProductAttributeModel(name: 'الحجم', values: ['EU34', 'EU32']),
        ProductAttributeModel(name: 'اللون', values: ['أخضر', 'أحمر', 'أزرق']),
      ],
    ),
  ];

  /// -- Sorting Filters for search
  static final sortingFilters = [
    SortFilterModel(id: '1', name: 'Name'),
    SortFilterModel(id: '2', name: 'Lowest Price'),
    SortFilterModel(id: '3', name: 'Most Popular'),
    SortFilterModel(id: '4', name: 'Highest Price'),
    SortFilterModel(id: '5', name: 'Newest'),
    SortFilterModel(id: '6', name: 'Most Suitable'),
  ];

  /// -- Product Reviews
  static final List<ProductReviewModel> productReviews = [
    ProductReviewModel(
      id: '01',
      userId: '001',
      userName: 'مرواني عزوز',
      rating: 4.5,
      timestamp: DateTime.now(),
      companyTimestamp: DateTime.now(),
      userImageUrl: TImages.userProfileImage2,
      comment:
          'واجهة المستخدم في التطبيق بديهية جدًا. تمكنت من التنقل وإجراء عمليات الشراء بسلاسة. عمل رائع!',
      companyComment:
          'شكرًا لك على كلماتك الطيبة، جون! نحن سعداء لسماع تجربتك السلسة مع التطبيق. نسعى دائمًا لتقديم واجهة بديهية لمستخدمينا. ترقب المزيد من التحديثات!',
    ),
    ProductReviewModel(
      id: '02',
      userId: '002',
      userName: "امين صالحي",
      rating: 3.5,
      timestamp: DateTime.now(),
      companyTimestamp: DateTime.now(),
      userImageUrl: TImages.userProfileImage1,
      comment:
          'أنا معجبة حقًا بتصميم التطبيق وتنوع المنتجات المتاحة. ميزات الفلترة والفرز جعلت التسوق أسهل بكثير بالنسبة لي!',
      companyComment:
          'شكرًا جزيلاً لك، صوفيا! نحن متحمسون لسماع أنك تستمتعين بالتطبيق وتجدين الميزات مفيدة. هدفنا هو جعل تجربة التسوق لديكِ فعالة وممتعة قدر الإمكان. استمري في الاستكشاف، وتسوق سعيد!',
    ),
    ProductReviewModel(
      id: '03',
      userId: '003',
      userName: 'بدر الدين ماضي',
      rating: 5,
      timestamp: DateTime.now(),
      companyTimestamp: DateTime.now(),
      userImageUrl: TImages.userProfileImage3,
      comment:
          'التطبيق سريع جدًا، وتوصيات المنتجات دقيقة! أود أن أرى المزيد من الميزات في المستقبل.',
      companyComment:
          'شكرًا على تعليقاتك، أليكس! نحن متحمسون لسماع أنك استمتعت بالسرعة والتوصيات. نحن نعمل باستمرار على تقديم ميزات جديدة، لذا ترقب التحديث القادم!',
    ),
  ];
}

class SortFilterModel {
  String id;
  String name;

  SortFilterModel({required this.id, required this.name});
}
