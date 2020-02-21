class Product {
	int id;
	String image;
	String name;
	String contents;

	Product({
		this.id,
		this.image,
		this.name,
		this.contents,
	});

	factory Product.fromJson(Map<String, dynamic> json) => Product(
		id: json["id"],
		image: json["image"],
		name: json["name"],
		contents: json["contents"],
	);

	Map<String, dynamic> toJson() => {
		"id": id,
		"image": image,
		"name": name,
		"contents": contents,
	};
}