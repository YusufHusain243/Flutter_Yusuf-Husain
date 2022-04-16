import 'dart:convert';

class Contact {
  int? id;
  String? name;
  String? phone;

  Contact({
    this.id,
    this.name,
    this.phone,
  });

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
    );
  }

  static Map<String, dynamic> toJson(Contact contact) => {
        'id': contact.id,
        'name': contact.name,
        'phone': contact.phone,
      };

  // static String encode(List<Contact> contacts) => json.encode(
  //       contacts
  //           .map<Map<String, dynamic>>((contact) => Contact.toJson(contact))
  //           .toList(),
  //     );

  // static List<Contact> decode(String contacts) =>
  //     (json.decode(contacts) as List<dynamic>)
  //         .map<Contact>((item) => Contact.fromJson(item))
  //         .toList();
}
