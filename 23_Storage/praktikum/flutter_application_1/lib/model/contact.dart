import 'dart:convert';

class Contact {
  String? name;
  String? phoneNumber;

  Contact({
    this.name,
    this.phoneNumber,
  });

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      name: json['name'],
      phoneNumber: json['phoneNumber'],
    );
  }

  static Map<String, dynamic> toJson(Contact contact) => {
        'name': contact.name,
        'phoneNumber': contact.phoneNumber,
      };

  static String encode(List<Contact> contacts) => json.encode(
        contacts
            .map<Map<String, dynamic>>((contact) => Contact.toJson(contact))
            .toList(),
      );

  static List<Contact> decode(String contacts) =>
      (json.decode(contacts) as List<dynamic>)
          .map<Contact>((item) => Contact.fromJson(item))
          .toList();
}
