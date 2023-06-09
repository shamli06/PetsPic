import 'package:get/get.dart';
import 'package:petspic/home/binding/home_binding.dart';
import 'package:petspic/home/view/home_view.dart';
import 'package:petspic/login/binding/login_binding.dart';
import 'package:petspic/login/view/login_view.dart';
import 'package:petspic/onboarding/binding/onboarding_binding.dart';
import 'package:petspic/onboarding/view/onboarding_view.dart';
import 'package:petspic/pet_details/binding/pet_details_binding.dart';
import 'package:petspic/pet_details/view/pet_details_view.dart';
import '../splash_screen.dart';
import 'routes.dart';

 getPages() => [
  GetPage(name: Routes.initial_route, page: () => const SplashScreen()),

  GetPage(
    name: Routes.home,
    page: () => const HomeView(),
    binding: HomeBinding()
  ),
  GetPage(
    name: Routes.onboarding,
    page: () => const OnboardingView(),
    binding: OnboardingBinding()
  ),
  GetPage(
    name: Routes.login,
    page: () => const LoginView(),
    binding: LoginBinding()
  ),
  GetPage(
    name: Routes.pet_details,
    page: () => const PetDetailsView(),
    binding: PetDetailsBinding()
  ),
];