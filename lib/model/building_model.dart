class Building {
  final String id;
  final String name;
  final String address;
  final String description;

  Building({
    required this.id,
    required this.name,
    required this.address,
    required this.description,
  });

  factory Building.fromJson(Map<String, dynamic> json) {
    return Building(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      description: json['description'],
    );
  }
}
