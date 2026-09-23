class MeditationExcericeModel {
  final String category;
  final String name;
  final String descrption;
  final int duration;
  final String audioUrl;
  final String videoUrl;

  MeditationExcericeModel({
    required this.category,
    required this.name,
    required this.descrption,
    required this.duration,
    required this.audioUrl,
    required this.videoUrl,
  });

  //method to convert json to dart objcet
  factory MeditationExcericeModel.fromjson(Map<String, dynamic> json) {
    return MeditationExcericeModel(
      category: json['category'],
      name: json['name'],
      descrption: json['description'],
      duration: json['duration'],
      audioUrl: json['audio_url'],
      videoUrl: json['video_url'],
    );
  }

  //method to dart oject to json
  Map<String, dynamic> toJson() {
    return {
      'category':category,
      'name':name,
      'description':descrption,
      'duration':duration,
      'audio_url':audioUrl,
      'video_url':videoUrl,
    };
  }
}
