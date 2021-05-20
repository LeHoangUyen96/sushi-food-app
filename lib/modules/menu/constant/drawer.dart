import 'package:flutter/material.dart';

List<Map<String, dynamic>> drawer = [
  {
    'icon': Icons.favorite_border,
    'title': 'Favorited',
    'nextRoute': 'favorited',
  },
  {
    'icon': Icons.shopping_basket,
    'title': 'Cart',
    'nextRoute': 'order',
  },
  {
    'icon': Icons.phone,
    'title': 'Contact',
    'nextRoute': 'contact',
  },
  {
    'icon': Icons.logout,
    'title': 'Logout',
    'nextRoute': 'logout',
  },
];
