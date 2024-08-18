import 'package:cwt_ecommerce_ui_kit/features/shop/screens/seller_orders/seller_order_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../personalization/models/user_model.dart';
import '../../controllers/dummy_data.dart';

class OrdersListView extends StatefulWidget {
  OrdersListView({super.key});

  @override
  State<OrdersListView> createState() => _OrdersListViewState();
}

class _OrdersListViewState extends State<OrdersListView> {
  List<UserModel> users = [];

  Future<List<UserModel>> _getUsers() async {
    users = List.generate(10, (index) {
      return TDummyData.user;
    });

    print("the count is " + users.length.toString());

    return users;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("الطلبات"),
      ),
      body: Column(
        children: [
          Text("كل الطلبيات بلغت حد الشراء الجماعي للمنتج",
              style: Theme.of(context).textTheme.headlineSmall),
          SizedBox(height: TSizes.spaceBtwSections),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(users[index].firstName),
                  leading: CircleAvatar(
                    child: Icon(Iconsax.omega_circle),
                  ),
                  subtitle: Text("طلبية مكتملة"),
                  onTap: () {
                    Get.to(SellerOrderView());
                  },
                );
              },
            ),
          ),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
