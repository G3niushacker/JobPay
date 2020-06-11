import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Destination{
  final String title;
  final IconData icon;
  const Destination(this.title,this.icon);

}

const List<Destination> allDestination = <Destination>[
  Destination('Job Feed', Icons.work,),
  Destination('Message', Icons.message),
  Destination('Profile', Icons.person),
  Destination('Invitation', Icons.call_made)

];