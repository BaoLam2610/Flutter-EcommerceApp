import 'package:equatable/equatable.dart';

class Discount extends Equatable {
  final String id;
  final String title;
  final String description;
  final String image;
  
  const Discount({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
  });


  @override
  List<Object> get props => [id, title, description, image];
}
