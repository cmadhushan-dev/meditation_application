class MindfulnessExcericesModel {
  final String categroy;
  final String name;
  final String description;
  final List<String> instruction;
  final int duration;
  final String instructionUrl;
  final String imagePath;

  MindfulnessExcericesModel({
    required this.categroy,
    required this.name,
    required this.description,
    required this.instruction,
    required this.duration,
    required this.instructionUrl,
    required this.imagePath,
  });

  //method to convert json data in to the dart object
  factory MindfulnessExcericesModel.fromJson(Map<String, dynamic> json) {
    return MindfulnessExcericesModel(
      categroy: json['categroy'],
      name: json['name'],
      description: json['description'],
      instruction: List<String>.from(json['instruction']),
      duration: json['duration'],
      instructionUrl: json['instruction_url'],
      imagePath: json['image_path'],
    );
  }

  //convert the dart object to the json data
  Map<String, dynamic> toJson() {
    return {
      'categroy':categroy,
      'name':name,
      'description':description,
      'instruction':instruction,
      'duration':duration,
      'instruction_url':instructionUrl,
      'image_path':imagePath
    };
  }
}
