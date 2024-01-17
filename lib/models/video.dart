






class Video{

  final String name;
  final String key;
  final String id;

  Video({
    required this.name,
    required this.id,
    required this.key
});

  factory Video.fromJson(Map<String, dynamic> json){
    return Video(
        name: json['name'],
        id: json['id'],
        key: json['key']
    );
  }



}