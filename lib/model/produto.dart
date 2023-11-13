class Produto {
  final String uid;
  final String categoty;
  final String expiryDate;
  final String name;
 
  Produto(this.uid, this.categoty, this.expiryDate, this.name);
 
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'uid': uid,
      'Name': name,
      'Data de expedição': expiryDate,
      'Categoria': categoty
    };
  }
 
  factory Produto.fromJson(Map<String, dynamic> json) {
    return Produto(
      json['uid'],
      json['category'],
      json['expiryDate'],
      json['name'],
    );
  }
}