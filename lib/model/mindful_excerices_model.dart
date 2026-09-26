class MindfulnessExcericesModel {
  final String category;
  final String name;
  final String description;
  final List<String> instructions;
  final int duration;
  final String instructionsUrl;
  final String imagePath;

  MindfulnessExcericesModel({
    required this.category,
    required this.name,
    required this.description,
    required this.instructions,
    required this.duration,
    required this.instructionsUrl,
    required this.imagePath,
  });

  //method to convert json data in to the dart object
  factory MindfulnessExcericesModel.fromJson(Map<String, dynamic> json) {
    return MindfulnessExcericesModel(
      category: json['categroy'],
      name: json['name'],
      description: json['description'],
      instructions: List<String>.from(json['instruction']),
      duration: json['duration'],
      instructionsUrl: json['instruction_url'],
      imagePath: json['image_path'],
    );
  }

  //convert the dart object to the json data
  Map<String, dynamic> toJson() {
    return {
      'categroy':category,
      'name':name,
      'description':description,
      'instruction':instructions,
      'duration':duration,
      'instruction_url':instructionsUrl,
      'image_path':imagePath
    };
  }
}
