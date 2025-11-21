// lib/order_details_page.dart
import 'package:flutter/material.dart';

class OrderDetailsPage extends StatelessWidget {
  // simple variable names that show a student made it
  final String studentName = 'Mera Student';
  final String orderNo = '0054752';
  final String orderDate = '29 Nov, 01:20 pm';
  final String status = 'Active';

  // prices
  final double item1Price = 20.0;
  final double item2Price = 12.0;
  final double subtotal = 32.0;
  final double tax = 5.0;
  final double delivery = 3.0;

  OrderDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double total = subtotal + tax + delivery;

    return Scaffold(
      backgroundColor: const Color(0xFFFFF7EB), // soft yellow background like design top
      body: SafeArea(
        child: Column(
          children: [
            // top yellow header with big title
            Container(
              height: 120,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFFF4C84B),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
              ),
              alignment: Alignment.center,
              child: const Text(
                'Order Details',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700, color: Colors.white),
              ),
            ),

            Expanded(
              child: Container(
                margin: const EdgeInsets.fromLTRB(16, 12, 16, 16),
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 8, offset: const Offset(0, 4)),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Order No. $orderNo', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.brown[800])),
                              const SizedBox(height: 6),
                              Text(orderDate, style: TextStyle(color: Colors.brown[300])),
                            ],
                          ),
                        ),
                        Text(status, style: TextStyle(color: Colors.deepOrange[400], fontWeight: FontWeight.w700)),
                      ],
                    ),

                    const SizedBox(height: 12),
                    const Divider(color: Color(0xFFFFE6D9), thickness: 1.0),
                    const SizedBox(height: 12),

                    orderItemRow(
                      title: 'Strawberry Shake',
                      subtitle: '3 Items',
                      price: item1Price,
                    ),

                    const SizedBox(height: 12),
                    const Divider(color: Color(0xFFFFE6D9), thickness: 1.0),
                    const SizedBox(height: 12),

                    orderItemRow(
                      title: 'Broccoli Lasagna',
                      subtitle: '3 Items',
                      price: item2Price,
                    ),

                    const SizedBox(height: 18),
                    const Divider(color: Color(0xFFFFE6D9), thickness: 1.0),
                    const SizedBox(height: 18),

                    totalsRow(label: 'Subtotal', value: subtotal),
                    const SizedBox(height: 10),
                    totalsRow(label: 'Tax and Fees', value: tax),
                    const SizedBox(height: 10),
                    totalsRow(label: 'Delivery', value: delivery),

                    const SizedBox(height: 12),
                    const Divider(color: Color(0xFFFFE6D9), thickness: 1.0),
                    const SizedBox(height: 12),

                    totalsRow(label: 'Total', value: total, isTotal: true),

                    const Spacer(),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Cancel Order pressed')));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFE85D3A),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                            ),
                            child: const Text('Cancel Order', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                          ),
                        ),
                        const SizedBox(width: 14),

                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Track Driver pressed')));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFFFD9C4),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                            ),
                            child: Text('Track Driver', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.brown[800])),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // helper widget for an order item row
  Widget orderItemRow({required String title, required String subtitle, required double price}) {
    return Row(
      children: [
        // image placeholder rounded
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            width: 72,
            height: 72,
            color: const Color(0xFFF8E9E3),
            child: const Icon(Icons.image, size: 36, color: Colors.grey),
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.brown[800])),
              const SizedBox(height: 6),
              Text(subtitle, style: TextStyle(color: Colors.brown[300])),
            ],
          ),
        ),
        Text('\$${price.toStringAsFixed(2)}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.brown[800])),
      ],
    );
  }

  // helper widget for totals row
  Widget totalsRow({required String label, required double value, bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(fontSize: isTotal ? 20 : 16, fontWeight: isTotal ? FontWeight.w700 : FontWeight.w500, color: Colors.brown[800])),
        Text('\$${value.toStringAsFixed(2)}', style: TextStyle(fontSize: isTotal ? 20 : 16, fontWeight: isTotal ? FontWeight.w700 : FontWeight.w500, color: Colors.brown[800])),
      ],
    );
  }
}
