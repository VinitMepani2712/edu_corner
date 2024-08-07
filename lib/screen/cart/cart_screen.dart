import 'package:edu_corner/model/cart_model.dart';
import 'package:edu_corner/provider/cart_screen_provider.dart';
import 'package:edu_corner/screen/payment/first_checkout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),
      body: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          return cartProvider.items.isEmpty
              ? Center(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "Looks like your cart is currently empty. Time to fill it up with goodies! 🛒",
                      style: TextStyle(fontSize: 18.0),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              : ListView.builder(
                  padding: EdgeInsets.all(10.0),
                  itemCount: cartProvider.items.length,
                  itemBuilder: (context, index) {
                    final cartItem = cartProvider.items[index];
                    return _buildCartItem(cartItem, context);
                  },
                );
        },
      ),
      bottomNavigationBar: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          if (cartProvider.items.isEmpty) {
            return SizedBox();
          } else {
            return _buildProcessButton(context, cartProvider);
          }
        },
      ),
    );
  }

  Future<bool?> showDeleteConfirmation(
      CartItem cartItem, BuildContext context) {
    return showModalBottomSheet<bool>(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Remove from Cart?",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              Divider(),
              SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 6,
                    width: MediaQuery.of(context).size.width / 3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        cartItem.course.image,
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cartItem.course.title,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Total Video: ${cartItem.course.videos}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Level: ${cartItem.course.level}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('\u{20B9}${cartItem.course.price}'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    style: ButtonStyle(
                      minimumSize: WidgetStateProperty.all(
                        Size(MediaQuery.of(context).size.width / 2.5, 40),
                      ),
                      backgroundColor: WidgetStateProperty.all<Color>(
                        Color(0xffEDEDED),
                      ),
                    ),
                    onPressed: () => Navigator.of(context).pop(false),
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        color: Color(0xff407BFF),
                      ),
                    ),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      minimumSize: WidgetStateProperty.all(
                        Size(MediaQuery.of(context).size.width / 2.5, 40),
                      ),
                      backgroundColor: WidgetStateProperty.all<Color>(
                        Color(0xff407BFF),
                      ),
                    ),
                    onPressed: () => Navigator.of(context).pop(true),
                    child: Text(
                      "Yes, Remove",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCartItem(CartItem cartItem, BuildContext context) {
    return Dismissible(
      key: Key(cartItem.toString()),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) async {
        return await showDeleteConfirmation(cartItem, context);
      },
      onDismissed: (direction) {
        Provider.of<CartProvider>(context, listen: false).removeItem(cartItem);
      },
      background: Container(
        color: const Color.fromARGB(255, 252, 178, 172),
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        alignment: AlignmentDirectional.centerEnd,
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      child: Card(
        elevation: 2.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 6,
                width: MediaQuery.of(context).size.width / 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    cartItem.course.image,
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  ),
                ),
              ),
              SizedBox(width: 10.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cartItem.course.title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Total Video: ${cartItem.course.videos}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Level: ${cartItem.course.level}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Color.fromARGB(255, 255, 255, 255)
                            : Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('\u{20B9}${cartItem.course.price}'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProcessButton(BuildContext context, CartProvider cartProvider) {
    return Container(
      padding: EdgeInsets.only(bottom: 10.0.h),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.light
            ? Color.fromARGB(255, 255, 255, 255)
            : Color.fromARGB(255, 0, 0, 0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(
            top: 10.0.h, left: 10.0.w, right: 10.0.w, bottom: 10.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 20),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(
                                color: Color(0xffDEDEDE),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(
                                color: Color(0xffDEDEDE),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(
                                color: Color(0xffDEDEDE),
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(
                                color: Color(0xffDEDEDE),
                              ),
                            ),
                            hintText: 'Promo Code',
                            hintStyle: TextStyle(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Color.fromARGB(255, 255, 255, 255)
                                  : Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 10,
                          child: TextButton(
                            style: ButtonStyle(
                              minimumSize: WidgetStateProperty.all(
                                Size(MediaQuery.of(context).size.width / 3.8.w,
                                    40.h),
                              ),
                              backgroundColor: WidgetStateProperty.all<Color>(
                                  Color(0xff407BFF)),
                            ),
                            onPressed: () {},
                            child: Text(
                              'Apply',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Sub Total:',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Color.fromARGB(255, 255, 255, 255)
                        : Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                Text(
                  '\u{20B9}${cartProvider.subtotal.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Color.fromARGB(255, 255, 255, 255)
                        : Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Discount:',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Color.fromARGB(255, 255, 255, 255)
                        : Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                Text(
                  '-\u{20B9}${cartProvider.discount.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Color.fromARGB(255, 255, 255, 255)
                        : Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Cost:',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Color.fromARGB(255, 255, 255, 255)
                        : Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                Text(
                  '\u{20B9}${cartProvider.totalPrice.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Color.fromARGB(255, 255, 255, 255)
                        : Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            TextButton(
              style: ButtonStyle(
                minimumSize: WidgetStateProperty.all(
                  Size(MediaQuery.of(context).size.width / 1.2, 40),
                ),
                backgroundColor:
                    WidgetStateProperty.all<Color>(Color(0xff407BFF)),
              ),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (contex) => FirstCheckoutScreen(),
                ),
              ),
              child: Text(
                'Proceed to Checkout',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
