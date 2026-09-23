class SleepExcericesModel {
  final String categroy;
  final String name;
  final String description;
  final int duration;
  final String audioUrl;

  SleepExcericesModel({
    required this.categroy,
    required this.name,
    required this.description,
    required this.duration,
    required this.audioUrl,
  });

  //dart object to json format
  factory SleepExcericesModel.fromJson(Map<String, dynamic> json) {
    return SleepExcericesModel(
      categroy: json['category'],
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
      'category':categroy,
      'name':name,
      'description':description,
      'duration':duration,
      'audio_url':audioUrl,
    };
  }
}
