import 'dart:convert';

class Movies {
  String? title;
  String? image;
  int? index;
  Movies({required this.title, required this.image, required this.index});

  @override
  String toString() => 'Movies(title: $title, image: $image, index: $index)';

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'title': title});
    result.addAll({'image': image});
    result.addAll({'index': index});

    return result;
  }

  factory Movies.fromMap(Map<String, dynamic> map) {
    return Movies(
      title: map['title'] ?? '',
      image: map['image'] ?? '',
      index: map['index']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Movies.fromJson(String source) => Movies.fromMap(json.decode(source));
}

List<Map<String, dynamic>> rawData = [
  {
    'tile': 'The best Player',
    'image': 'assets/images/53bEk_jDKu7AEiVKzo4sqO.jpg',
    'index': 1
  },
  {
    'tile': 'The best Player',
    'image': 'assets/images/58df4c24daee86aca32d072bf9a674e3.jpg',
    'index': 2
  },
  {
    'tile': 'The best Player',
    'image': 'assets/images/3513005-71607268-2560-1440.png',
    'index': 3
  },
  {
    'tile': 'The best Player',
    'image': 'assets/images/gettyimages-81188838-612x612.jpg',
    'index': 4
  },
  {
    'tile': 'The best Player',
    'image': 'assets/images/gettyimages-493651899-612x612.jpg',
    'index': 5
  },
  {
    'tile': 'The best Player',
    'image': 'assets/images/gettyimages-1344015600-612x612.jpg',
    'index': 6
  },
  {
    'tile': 'The best Player',
    'image':
        'assets/images/ita-cristiano-ronaldo-elit-le-meilleur-joueur-quelle-surprise-ronaldo-136,273835.jpg',
    'index': 7
  }
];
// gettyimages-1344015600-612x612

