class EquipmentAndSupplies
{
  late String id;
  late String name;
  late String brand;
  late String weight;
  late String price;
  late String description;
  late String image;
  String? docId;
  EquipmentAndSupplies({required this.id , required this.name,required this.brand , required this.image,required this.description , required this.weight , required this.price});

  EquipmentAndSupplies.fromJson(Map<String,dynamic> map)
  {
    if(map==null)
    {
      return;
    }
    else
    {
      id = map['id'];
      name=map['name'];
      description=map['description'];
      weight=map['weight'];
      price=map['price'];
      brand=map['brand'];
      image = map['image'];
    }
  }

  toJson()
  {
    return {
      'id' : id,
      'name' : name,
      'description' : description,
      'weight' : weight,
      'price': price,
      'brand' : brand,
      'image' : image,
    };
  }
}