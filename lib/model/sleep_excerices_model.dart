class SleepExcericesModel {
  final String category;
  final String name;
  final String description;
  final int duration;
  final String audioUrl;

  SleepExcericesModel({
    required this.category,
    required this.name,
    required this.description,
    required this.duration,
    required this.audioUrl,
  });

  //dart object to json format
  factory SleepExcericesModel.fromJson(Map<String, dynamic> json) {
    return SleepExcericesModel(
      category: json['category'],
      name: json['name'],
      description: json['description'],
      duration: json['duration'],
      audioUrl: json['audio_url'],
    );
  }

  //json object to dart object
  Map<String, dynamic> toJson() {
    return 
    {
      'category':category,
      'name':name,
      'description':description,
      'duration':duration,
      'audio_url':audioUrl,
    };
  }
}
