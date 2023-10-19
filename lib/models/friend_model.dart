import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FriendModel {
  String? image;
  String? name;
  String? desc;
  String? number;
  String? friendKey;

  FriendModel({this.image, this.name, this.desc, this.number, this.friendKey});

  factory FriendModel.fromQuerySnapshot(DocumentSnapshot snapshot) {
    return FriendModel(
      image: snapshot.data().toString().contains('image')
          ? snapshot.get('image')
          : null,
      name: snapshot.data().toString().contains('name')
          ? snapshot.get('name')
          : 'Dummy',
      number: snapshot.data().toString().contains('number')
          ? snapshot.get('number')
          : 'Dummy',
      desc: snapshot.data().toString().contains('desc')
          ? snapshot.get('desc')
          : 'Dummy',
          friendKey: snapshot.data().toString().contains('key')
          ? snapshot.get('key')
          : null,
    );
  }
}
