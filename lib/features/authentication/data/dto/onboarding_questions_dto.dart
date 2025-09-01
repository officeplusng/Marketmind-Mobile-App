class OnboardingQuestionDto {
  final int id;
  final String question;
  final bool isMultiple;
  final List<OptionDto> options;
  final DateTime createdAt;
  final DateTime updatedAt;

  OnboardingQuestionDto({
    required this.id,
    required this.question,
    required this.isMultiple,
    required this.options,
    required this.createdAt,
    required this.updatedAt,
  });

  factory OnboardingQuestionDto.fromJson(Map<String, dynamic> json) {
    return OnboardingQuestionDto(
      id: json['id'],
      question: json['question'],
      isMultiple: json['isMultiple'],
      options: (json['options'] as List<dynamic>)
          .map((e) => OptionDto.fromJson(e))
          .toList(),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'question': question,
    'isMultiple': isMultiple,
    'options': options.map((e) => e.toJson()).toList(),
    'createdAt': createdAt.toIso8601String(),
    'updatedAt': updatedAt.toIso8601String(),
  };
}

class OptionDto {
  final String label;
  final String? text; // optional

  OptionDto({
    required this.label,
    this.text,
  });

  factory OptionDto.fromJson(Map<String, dynamic> json) {
    return OptionDto(
      label: json['label'],
      text: json['text'], // might be null
    );
  }

  Map<String, dynamic> toJson() => {
    'label': label,
    if (text != null) 'text': text,
  };
}
