import 'package:equatable/equatable.dart';

class FeaturedImage extends Equatable {
  final String imageUrl;
  final int serviceProviderId;
  final String serviceTitle;
  const FeaturedImage(
      {required this.imageUrl,
      required this.serviceProviderId,
      required this.serviceTitle});
  @override
  List<Object?> get props => [imageUrl, serviceProviderId, serviceTitle];
}

class FeaturedService extends Equatable {
  final String serviceImageUrl;
  final int serviceProviderId;
  final String serviceTitle;
  final String serviceType;
  const FeaturedService(
      {required this.serviceImageUrl,
      required this.serviceProviderId,
      required this.serviceType,
      required this.serviceTitle});
  @override
  List<Object?> get props =>
      [serviceImageUrl, serviceProviderId, serviceTitle, serviceType];
}

