import 'package:flutter/material.dart';

List expenses = [
  {"name": "Groceries", "amount": 500.0},
  {"name": "Online Shipping", "amount": 130.6},
  {"name": "Eating Out", "amount": 200},
  {"name": "Bills", "amount": 80},
  {"name": "Subscriptions", "amount": 100},
  {"name": "Fees", "amount": 30},
];

List pieColors = [
  Colors.indigo[400],
  Colors.blue,
  Colors.green,
  Colors.amber,
  Colors.deepOrange,
  Colors.brown,
];

List parcelServices = [
  {
    "name": "Add parcel",
    "icon": Icons.post_add_rounded,
    "image": "images/tracking-app.png"
  },
  {
    "name": "Track parcel",
    "icon": Icons.manage_search_sharp,
    "image": "images/scanning.png"
  },
  {
    "name": "View History",
    "icon": Icons.work_history_sharp,
    "image": "images/order-tracking-boxes.png"
  },
];
