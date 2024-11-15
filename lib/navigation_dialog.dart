import 'package:flutter/material.dart';

class NavigationDialogScreen extends StatefulWidget {
  const NavigationDialogScreen({super.key});

  @override
  State<NavigationDialogScreen> createState() => _NavigationDialogScreenState();
}

class _NavigationDialogScreenState extends State<NavigationDialogScreen> {
  Color color = Colors.blue.shade700;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: color,
        appBar: AppBar(
          title: const Text('Navigation Dialog Screen Yoga'),
        ),
        body: Center(
          child: ElevatedButton(
              child: const Text('Change Color'), 
              onPressed: () {
                _showColorDialog(context);
              }),
        ));
  }

  Future _showColorDialog(BuildContext context) async {
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Very Important Question'),
          content: const Text('Please choose a color'),
          actions: <Widget>[
            TextButton(
              child: const Text('Red'),
              onPressed: () {
                color = const Color.fromARGB(255, 132, 182, 149);
                Navigator.pop(context, color);
              },
            ),
            TextButton(
              child: const Text('Green'),
              onPressed: () {
                color = Colors.green.shade700;
                Navigator.pop(context, color);
              },
            ),
            TextButton(
              child: const Text('Blue'),
              onPressed: () {
                color = const Color.fromARGB(255, 36, 207, 2);
                Navigator.pop(context, color);
              },
            ),
          ],
        );
      },
    );
    setState(() {}); // Memperbarui UI setelah memilih warna
  }

}
