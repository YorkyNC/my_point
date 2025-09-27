// import 'package:photo_manager/photo_manager.dart';

import 'package:my_point/src/features/authorization/presentaion/page/number_search_page.dart';
import 'package:my_point/src/features/introduction/presentation/introduction_page.dart';
import 'package:my_point/src/features/loading/presentation/splash_page.dart';
import 'package:my_point/src/features/login/presentation/login_page.dart';
import 'package:my_point/src/features/otp/presentation/otp_page.dart';
import 'package:my_point/src/features/payment/presentation/page/payment_method_page.dart';
import 'package:my_point/src/features/personal%20identification/presentation/document_selection_page.dart';
import 'package:my_point/src/features/personal%20identification/presentation/identity_verification_page.dart';
import 'package:my_point/src/features/personal%20identification/presentation/personal_identification_page.dart';
import 'package:my_point/src/features/profile/presentation/page/account_details_page.dart';
import 'package:my_point/src/features/profile/presentation/page/currency_selection_page.dart';
import 'package:my_point/src/features/profile/presentation/page/language_selection_page.dart';
import 'package:my_point/src/features/profile/presentation/page/profile_page.dart';
import 'package:my_point/src/features/review/presentation/page/accepted_order_details_page.dart';
import 'package:my_point/src/features/review/presentation/page/responses_page.dart';
import 'package:my_point/src/features/review/presentation/page/review_page.dart';
import 'package:my_point/src/features/review/presentation/page/support_page.dart';

import '../../app/app_navigation_wrapper.dart';
import '../../app/imports.dart';
import '../services/storage/storage_service_impl.dart';

part 'route_list.dart';
part 'route_transitions.dart';
part 'router_names.dart';
part 'router_paths.dart';

GoRouter routerProvider() {
  final StorageServiceImpl st = StorageServiceImpl();
  final String? token = st.getToken();
  final bool hasSeenIntroduction = st.hasSeenIntroduction();

  return GoRouter(
    refreshListenable: st,
    // initialLocation: hasSeenIntroduction ? RoutePaths.authorization : RoutePaths.introduction,
    // initialLocation: RoutePaths.
    // initialLocation: RoutePaths.main,
    initialLocation: RoutePaths.loading,
    debugLogDiagnostics: true,
    routes: _routes,
  );
}
