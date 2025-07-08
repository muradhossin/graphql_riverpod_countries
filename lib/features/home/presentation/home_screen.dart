import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_riverpod_countries/features/countries/presentation/countries_list_screen.dart';
import 'package:graphql_riverpod_countries/features/favorites/presentation/favorites_screen.dart';
import 'package:graphql_riverpod_countries/features/settings/providers/theme_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  
  final _pages = [
    CountriesListScreen(),
    FavoritesScreen(),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Countries App'),
        actions: [
          Consumer(
            builder: (context, ref, child) {
              final isDark = ref.watch(isDarkModeProvider);
              return Switch(
                value: isDark,
                onChanged: (value) {
                  ref.read(isDarkModeProvider.notifier).state = value;
                },
              );
            },
          ),
        ],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.public), label: 'All'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
