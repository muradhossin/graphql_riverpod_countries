import 'package:flutter/material.dart';
import 'package:graphql_riverpod_countries/features/countries/domain/country_model.dart';

class CountryDetailsScreen extends StatelessWidget {
  final Country country;
  const CountryDetailsScreen({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(country.name ?? '')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(country.emoji ?? '', style: TextStyle(fontSize: 64)),
            SizedBox(height: 16),
            Text('Capital: ${country.capital}', style: TextStyle(fontSize: 20)),
            SizedBox(height: 8),
            Text('Code: ${country.code}', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
