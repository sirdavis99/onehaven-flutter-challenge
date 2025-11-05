import 'image_const.dart';

class OnboardingModel {
  final String image;
  final String title;
  final String subtitle;

  OnboardingModel(
      {required this.image, required this.title, required this.subtitle});
}

List<OnboardingModel> onboardingList = [
  OnboardingModel(
      image: onboarding1,
      title: "Lorem Ipsum is sim dummy text of there",
      subtitle:
          "Lorem Ipsum is simply dummy text of the printing and typesetting"),
  OnboardingModel(
      image: onboarding2,
      title: "Lorem Ipsum is sim dummy text of there",
      subtitle:
          "Lorem Ipsum is simply dummy text of the printing and typesetting"),
  OnboardingModel(
      image: onboarding3,
      title: "Lorem Ipsum is sim dummy text of there",
      subtitle:
          "Lorem Ipsum is simply dummy text of the printing and typesetting"),
  OnboardingModel(
      image: onboarding4,
      title: "Lorem Ipsum is sim dummy text of there",
      subtitle:
          "Lorem Ipsum is simply dummy text of the printing and typesetting"),
];
