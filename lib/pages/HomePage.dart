import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class GlassCard extends StatelessWidget {
  final String label;
  final IconData icon;
  final Function onTap;

  GlassCard({required this.label, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: GlassmorphicContainer(
        width: MediaQuery.of(context).size.width * 0.4,
        height: MediaQuery.of(context).size.height * 0.2,
        borderRadius: 20,
        blur: 10,
        alignment: Alignment.center,
        border: 2,
        linearGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.blue.withOpacity(0.2),
            Colors.cyan.withOpacity(0.2),
          ],
        ),
        borderGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.blue.withOpacity(0.5),
            Colors.blueAccent.withOpacity(0.2),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Colors.blueAccent),
            SizedBox(height: 10),
            Text(label,
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MERIT | Home'),
      ),
      body: Center(
        child: Wrap(
          spacing: 20,
          runSpacing: 20,
          children: [
            GlassCard(
              label: 'Create Client',
              icon: Icons.person_add_alt_1,
              onTap: () => Navigator.pushNamed(context, '/create-client'),
            ),
            GlassCard(
              label: 'Create Order',
              icon: Icons.add_shopping_cart,
              onTap: () => Navigator.pushNamed(context, '/create-order'),
            ),
            GlassCard(
              label: 'All Clients',
              icon: Icons.people,
              onTap: () => Navigator.pushNamed(context, '/all-clients'),
            ),
            GlassCard(
              label: 'All Orders',
              icon: Icons.shopping_cart,
              onTap: () => Navigator.pushNamed(context, '/all-orders'),
            ),
            GlassCard(
              label: 'Dashboard',
              icon: Icons.dashboard,
              onTap: () => Navigator.pushNamed(context, '/dashboard'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.exit_to_app),
            label: 'Sign-out',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Search',
          ),

        ],
        currentIndex: 0,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/sign-in');
              break;
            case 1:
              Navigator.pushNamed(context, '/settings');
              break;

          }
        },
      ),

    );
  }
}
