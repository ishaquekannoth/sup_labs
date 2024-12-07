import 'dummy_classes.dart';

class DummyData {
  static List<FeaturedImage> imagesWithProviderId = List.generate(
      DummyImages().images.length,
      (index) => FeaturedImage(
          imageUrl: DummyImages().images[index],
          serviceProviderId: index,
          serviceTitle: "Servicer"));
  static List<FeaturedService> servicesList = List.generate(
      DummyImages().images.length,
      (index) => FeaturedService(
          serviceImageUrl: DummyImages().images.reversed.toList()[index],
          serviceProviderId: index,
          serviceType: DummyImages().serviceTypes[index],
          serviceTitle: "Servicer"));
}

class DummyImages {
  static final DummyImages _instance = DummyImages._internal();
  factory DummyImages() => _instance;
  DummyImages._internal();
  List<String> images = [
    'https://images.freeimages.com/images/large-previews/56d/peacock-1169961.jpg',
    'https://images.freeimages.com/images/large-previews/355/poppies-2-1334190.jpg?fmt=webp&w=500',
    'https://images.freeimages.com/images/large-previews/bc4/curious-bird-1-1374322.jpg?fmt=webp&w=500',
    'https://images.freeimages.com/images/large-previews/39a/spring-1377434.jpg?fmt=webp&w=500',
    'https://images.freeimages.com/images/large-previews/321/water-drop-1386547.jpg?fmt=webp&w=500',
    'https://images.freeimages.com/images/large-previews/cf6/jellyfish-1459351.jpg?fmt=webp&w=500',
    'https://images.freeimages.com/images/large-previews/bc4/curious-bird-1-1374322.jpg?fmt=webp&w=500'
  ];
  List<String> serviceTypes = [
    "Beauty",
    "Decoration",
    "Relegious",
    "Pantry",
    "Songs",
    "Cultural",
    "Art",
  ];
}
