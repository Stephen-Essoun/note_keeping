// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class NoteUser {
  final String name;
  final String email;

  NoteUser(
    this.name,
    this.email,
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
    };
  }

  factory NoteUser.fromMap(Map<String, dynamic> map) {
    return NoteUser(
      map['name'] as String,
      map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory NoteUser.fromJson(String source) => NoteUser.fromMap(json.decode(source) as Map<String, dynamic>);
}
