// lib/main.dart
import 'package:flutter/material.dart';

void main() => runApp(app());

class app extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Tasks',
      debugShowCheckedModeBanner: false,
      home: homePage(),
    );
  }
}

class homePage extends StatelessWidget {
  // متغيرات بسيطة توضح إن الطالب هو اللي عاملها
  final String name = 'Ahmed Saber';
  final int tasksPercent = 80;
  final int inProgressCount = 5;
  final int personalCount = 5;
  final int homeCount = 3;
  final int workCount = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F6F4),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // header: avatar + Hello + name
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // بديل للصورة: دائرة مع أيقونة علم
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.flag, color: Colors.green, size: 32),
                  ),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hello!', style: TextStyle(fontSize: 14, color: Colors.grey[700])),
                      SizedBox(height: 2),
                      Text(name, style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
                    ],
                  ),
                  Spacer(),
                ],
              ),

              SizedBox(height: 20),

              // big green progress card
              Container(
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
                decoration: BoxDecoration(
                  color: Colors.green[700],
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  children: [
                    // left column: text + percent
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Your today's tasks\nalmost done!", style: TextStyle(color: Colors.white, fontSize: 16)),
                          SizedBox(height: 12),
                          Text('${tasksPercent}%', style: TextStyle(color: Colors.white, fontSize: 42, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),

                    // view tasks button style
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text('View Tasks', style: TextStyle(color: Colors.green[700], fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 18),

              // In Progress label with badge
              Row(
                children: [
                  Text('In Progress', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                  SizedBox(width: 8),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(color: Colors.green[100], borderRadius: BorderRadius.circular(8)),
                    child: Text('$inProgressCount', style: TextStyle(color: Colors.green[800], fontWeight: FontWeight.w600)),
                  ),
                ],
              ),

              SizedBox(height: 12),

              // sample black task card
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Work Task', style: TextStyle(color: Colors.white70, fontSize: 14)),
                          SizedBox(height: 8),
                          Text('Add New Features', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(color: Colors.green[700], borderRadius: BorderRadius.circular(8)),
                      child: Icon(Icons.work, color: Colors.white),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 22),

              // Task Groups label
              Text('Task Groups', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
              SizedBox(height: 12),

              // personal task row
              taskRow(icon: Icons.person, title: 'Personal Task', count: personalCount, badgeColor: Colors.green[100], iconBg: Colors.green[50]),

              SizedBox(height: 12),

              // home task row (pink)
              taskRow(icon: Icons.home, title: 'Home Task', count: homeCount, badgeColor: Colors.pink[50], iconBg: Colors.pink[50], usePinkIcon: true),

              SizedBox(height: 12),

              // work task row (black badge)
              taskRow(icon: Icons.work_outline, title: 'Work Task', count: workCount, badgeColor: Colors.black, iconBg: Colors.black),

              // spacer to push fab to bottom-right
              Expanded(child: SizedBox()),

              // floating-like add button placed at bottom right
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  margin: EdgeInsets.only(bottom: 6),
                  child: FloatingActionButton(
                    onPressed: () {
                      // هنا ممكن تضيف عملية إضافة مهمة أو تخرج رسالة بسيطة
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Add task pressed')));
                    },
                    backgroundColor: Colors.green[700],
                    child: Icon(Icons.add, size: 28),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // دالة مساعدة ترجع صف لكل مجموعة مهام
  Widget taskRow({
    required IconData icon,
    required String title,
    required int count,
    required Color? badgeColor,
    required Color? iconBg,
    bool usePinkIcon = false,
  }) {
    // أسماء متغيرات بسيطة واضحة
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(color: iconBg ?? Colors.grey[200], borderRadius: BorderRadius.circular(10)),
            child: Icon(icon, color: usePinkIcon ? Colors.pink : Colors.green[700]),
          ),
          SizedBox(width: 14),
          Expanded(child: Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500))),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(color: badgeColor, borderRadius: BorderRadius.circular(8)),
            child: Text('$count', style: TextStyle(fontWeight: FontWeight.w700)),
          ),
        ],
      ),
    );
  }
}
