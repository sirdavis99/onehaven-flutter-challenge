import 'package:ride_hailing/utils/constants.dart';

getAvatarUrl(String? url) {
  return url == null ? avatarPlaceholderImage : imagePath + url;
}

getImageUrl(String? url, {bool usePlaceholder = true}) {
  return url == null
      ? usePlaceholder
          ? placeholderImg
          : null
      : imagePath + url;
}
