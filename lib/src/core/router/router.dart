// import 'package:photo_manager/photo_manager.dart';

import 'package:my_point/src/features/delivery/presentation/page/delivery_page.dart';
import 'package:my_point/src/features/home/presentation/page/home_page.dart';
import 'package:my_point/src/features/introduction/presentation/introduction_page.dart';
import 'package:my_point/src/features/loading/presentation/splash_page.dart';
import 'package:my_point/src/features/login/presentation/components/success_register_page.dart';
import 'package:my_point/src/features/login/presentation/page/agreement_page.dart';
import 'package:my_point/src/features/login/presentation/page/login_page.dart';
import 'package:my_point/src/features/login/presentation/page/unregistered_user_view.dart';
import 'package:my_point/src/features/login/presentation/page/verification_view.dart';
import 'package:my_point/src/features/order/presentation/page/order_page.dart';
import 'package:my_point/src/features/otp/presentation/page/otp_page.dart';
import 'package:my_point/src/features/profile/presentation/page/profile_page.dart';
import 'package:my_point/src/features/register/presentation/page/register_p_v_z_page.dart';
import 'package:my_point/src/features/scan/presentation/components/manual_barcode_input_widget.dart';
import 'package:my_point/src/features/scan/presentation/page/scan_page.dart';

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
    initialLocation: hasSeenIntroduction ? RoutePaths.loading : RoutePaths.introduction,
    // initialLocation: RoutePaths.agreement,
    // initialLocation: RoutePaths.registerPVZ,
    // initialLocation: RoutePaths.loading,
    // initialLocation: RoutePaths.introduction,
    // initialLocation: RoutePaths.main,
    // initialLocation: RoutePaths.home,
    // initialLocation: RoutePaths.otp,
    // initialLocation: RoutePaths.login,
    debugLogDiagnostics: true,
    routes: _routes,
  );
}
