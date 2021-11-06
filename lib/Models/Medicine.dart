class Medicine
{
  late String id;
  late String name;
  late String companyName;
  late String type;
  late String price;
  late String description;
  late String image;
  String? docId;
  Medicine({required this.id , required this.name ,required this.companyName, required this.image,required this.description , required this.type , required this.price});

  Medicine.fromJson(Map<String,dynamic> map)
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
        type=map['type'];
        price=map['price'];
        companyName=map['companyName'];
        image=map['image'];
      }
  }

  toJson()
  {
    return {
      'id' : id,
      'name' : name,
      'description' : description,
      'type' : type,
      'price': price,
      'companyName' : companyName,
      'image' : image,
    };
  }
}