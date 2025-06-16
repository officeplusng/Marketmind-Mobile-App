class EmailDto{
  final String email;
  const EmailDto({required this.email});

  Map<String,dynamic> toJson() => {
    'email':email
  };
}