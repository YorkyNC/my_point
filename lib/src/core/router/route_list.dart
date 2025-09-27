part of 'router.dart';

final leftTabNavigatorKey = GlobalKey<NavigatorState>();
final leftTabTeacherNavigatorKey = GlobalKey<NavigatorState>();
final centerTabNavigatorKey = GlobalKey<NavigatorState>();
final rightTabNavigatorKey = GlobalKey<NavigatorState>();

final st = StorageServiceImpl();

int getCUrrentAcademicYear() {
  final today = DateTime.now();
  return today.month <= 6 ? today.year - 1 : today.year;
}

Page getPage({required Widget child, required GoRouterState state, bool fullscreenDialog = false}) {
  return MaterialPage(maintainState: true, key: state.pageKey, fullscreenDialog: fullscreenDialog, child: child);
}

// Initialize user role from token data.
// UserTokenEntity getCurrentRole() {
//   final token = st.getToken();
//   if (token == null || token.isEmpty) {
//     return UserTokenEntity.fromJson({});
//   }
//   return UserTokenEntity.fromJson(Jwt.parseJwt(token));
// }

// Create a role provider or notifier to manage role state
// class RoleProvider extends ChangeNotifier {
//   UserTokenEntity? _role;

//   RoleProvider() : _role = getCurrentRole();

//   UserTokenEntity? get role => _role;

//   void updateRole() {
//     _role = getCurrentRole();
//     notifyListeners();
//   }

//   void clearRole() {
//     _role = null;
//     notifyListeners();
//   }
// }

// final roleNotifier = RoleNotifier();
// String schoolId = roleNotifier.getCurrentSchoolId()!;
int currentYear = getCUrrentAcademicYear();

// final dataSource = TimetableLocalDataSource();
// final repository = TimetableRepositoryImpl(localDataSource: dataSource);
// final useCase = GetTimetableEntries(repository);
// final bloc = TimetableBloc(getTimetableEntriesUseCase: useCase);

//pages paths

final List<RouteBase> _routes = [
  StatefulShellRoute.indexedStack(
    builder: (context, state, navigationShell) {
      return AppNavigationWrapper(
        currentIndex: navigationShell.currentIndex,
        onTap: navigationShell.goBranch,
        child: navigationShell,
      );
    },
    branches: [
      // Tab 0 - Home
      StatefulShellBranch(
        routes: [
          GoRoute(path: RoutePaths.initial, redirect: (context, state) => RoutePaths.main),
          GoRoute(
            path: RoutePaths.main,
            pageBuilder: (context, state) => getPage(child: const ReviewPage(), state: state),
          ),
        ],
      ),
      // Tab 1 - Create Delivery
      // StatefulShellBranch(
      //   routes: [
      //     GoRoute(
      //       path: RoutePaths.createDelivery,
      //       pageBuilder: (context, state) => getPage(child: CreateDeliveryPage(), state: state),
      //     ),
      //   ],
      // ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: RoutePaths.profile,
            pageBuilder: (context, state) => getPage(child: const ProfilePage(), state: state),
          ),
        ],
      ),
    ],
  ),

  // GoRoute(
  //   path: RoutePaths.createNews,
  //   pageBuilder: (context, state) {
  //     final VoidCallback? refreshPosts = state.extra as VoidCallback?;
  //     return MaterialPage(
  //       child: NewPublicationPage(
  //         refreshPosts: refreshPosts ?? () {},
  //       ),
  //     );
  //   },
  // ),

  // GoRoute(
  //   path: RoutePaths.chatsMessage,
  //   pageBuilder: (context, state) {
  //     final data = state.extra as Map<String, dynamic>;
  //     return getPage(
  //       child: ChatMessagePage(
  //         chatId: data['chatId'],
  //         chatTitle: data['chatTitle'],
  //       ),
  //       state: state,
  //     );
  //   },
  // )
  // In your router.dart file, add this route
  GoRoute(
    path: RoutePaths.login,
    pageBuilder: (context, state) => getPage(child: const LoginPage(), state: state),
  ),
  // GoRoute(
  //   path: RoutePaths.createDelivery,
  //   pageBuilder: (context, state) => getPage(child: CreateDeliveryPage(), state: state),
  // ),

  GoRoute(
    path: RoutePaths.introduction,
    pageBuilder: (context, state) => getPage(child: const IntroductionPage(), state: state),
  ),
  GoRoute(
    path: RoutePaths.loading,
    pageBuilder: (context, state) => getPage(child: const SplashScreen(), state: state),
  ),
  // GoRoute(
  //   path: RoutePaths.authorization,
  //   pageBuilder: (context, state) => getPage(child: const AuthorizationPage(), state: state),
  // ),

  GoRoute(
      path: RoutePaths.otp,
      pageBuilder: (context, state) {
        final data = state.extra as Map<String, dynamic>;
        return getPage(
          child: OtpPage(phone: data['phone']),
          state: state,
        );
      }),

  GoRoute(
    path: RoutePaths.personalIdentification,
    pageBuilder: (context, state) => getPage(child: const PersonalIdentificationPage(), state: state),
  ),
  GoRoute(
    path: RoutePaths.documentSelection,
    pageBuilder: (context, state) => getPage(child: const DocumentSelectionPage(), state: state),
  ),
  GoRoute(
    path: RoutePaths.identification,
    pageBuilder: (context, state) => getPage(child: const IdentityVerificationPage(), state: state),
  ),
  // GoRoute(
  //   path: RoutePaths.orderDetails,
  //   pageBuilder: (context, state) => getPage(child: const OrderDetailsPage(), state: state),
  // ),
  GoRoute(
    path: RoutePaths.responses,
    pageBuilder: (context, state) => getPage(child: const ResponsesPage(), state: state),
  ),
  GoRoute(
    path: RoutePaths.acceptedOrderDetails,
    pageBuilder: (context, state) => getPage(child: const AcceptedOrderDetailsPage(), state: state),
  ),
  GoRoute(
    path: RoutePaths.support,
    pageBuilder: (context, state) => getPage(child: const SupportPage(), state: state, fullscreenDialog: true),
  ),
  GoRoute(
    path: RoutePaths.languageSelection,
    pageBuilder: (context, state) => getPage(child: const LanguageSelectionPage(), state: state),
  ),
  GoRoute(
    path: RoutePaths.paymentMethod,
    pageBuilder: (context, state) => getPage(child: const PaymentMethodPage(), state: state),
  ),
  GoRoute(
    path: RoutePaths.currency,
    pageBuilder: (context, state) => getPage(child: const CurrencySelectionPage(), state: state),
  ),
  GoRoute(
    path: RoutePaths.accountDetails,
    pageBuilder: (context, state) => getPage(child: const AccountDetailsPage(), state: state),
  ),
];
