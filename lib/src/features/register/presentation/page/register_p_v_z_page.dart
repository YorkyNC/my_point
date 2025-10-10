import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';
import 'package:my_point/src/core/router/router.dart';
import 'package:my_point/src/core/services/injectable/injectable_service.dart';
import 'package:my_point/src/features/login/presentation/components/custom_snack_bar.dart';
import 'package:my_point/src/features/register/presentation/components/first_step_view.dart';
import 'package:my_point/src/features/register/presentation/components/second_step_view.dart';
import 'package:my_point/src/features/register/presentation/page/bloc/register_pvz_bloc.dart';

class RegisterPVZPage extends StatefulWidget {
  const RegisterPVZPage({super.key});

  @override
  State<RegisterPVZPage> createState() => _RegisterPVZPageState();
}

class _RegisterPVZPageState extends State<RegisterPVZPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final int _totalPages = 2;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _totalAreaController = TextEditingController();
  final TextEditingController _entranceController = TextEditingController();
  final TextEditingController _apartmentController = TextEditingController();
  final TextEditingController _floorController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _commentController = TextEditingController();

  @override
  void dispose() {
    _pageController.dispose();
    _nameController.dispose();
    _totalAreaController.dispose();
    _entranceController.dispose();
    _apartmentController.dispose();
    _floorController.dispose();
    _phoneController.dispose();
    _commentController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < _totalPages - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<RegisterPvzBloc>(),
      child: BlocListener<RegisterPvzBloc, RegisterPvzState>(
        listener: (context, state) {
          // Handle success
          if (state.successMessage != null && state.successMessage!.isNotEmpty) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              CustomSnackBar.show(
                color: context.colors.success500,
                title: 'ПВЗ успешно зарегистрирован',
                seconds: 3,
                context: context,
              ),
            );
            context.go(RoutePaths.login);
            // Navigate back or to success page
            // Future.delayed(const Duration(seconds: 2), () {
            //   if (context.mounted) {
            //     context.pop();
            //   }
            // });
          }

          // Handle error
          if (state.errorMessage != null && state.errorMessage!.isNotEmpty) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              CustomSnackBar.show(
                color: context.colors.error500,
                title: state.errorMessage!,
                seconds: 4,
                context: context,
              ),
            );
          }
        },
        child: Scaffold(
          backgroundColor: context.colors.white,
          appBar: AppBar(
            elevation: 0,
            leading: IconButton(
              onPressed: _previousPage,
              icon: Icon(
                context.icons.chevron_left,
                color: context.colors.textprimary,
              ),
            ),
            backgroundColor: context.colors.white,
            title: Text('Шаг ${_currentPage + 1}'),
            titleTextStyle: context.typography.mediumParagraph.copyWith(color: context.colors.black),
            actions: [
              TextButton(
                onPressed: () => context.go(RoutePaths.login),
                child: Text(
                  'закрыть'.toUpperCase(),
                  style: context.typography.smallParagraphMedium2.copyWith(
                    color: context.colors.accent2,
                  ),
                ),
              ),
            ],
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(4.0),
              child: LinearProgressIndicator(
                value: (_currentPage + 1) / _totalPages,
                color: context.colors.mainAccent,
                backgroundColor: context.colors.gray100,
                minHeight: 2,
              ),
            ),
          ),
          body: BlocBuilder<RegisterPvzBloc, RegisterPvzState>(
            builder: (context, state) {
              return PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                children: [
                  FirstStepView(
                    nameController: _nameController,
                    totalAreaController: _totalAreaController,
                    entranceController: _entranceController,
                    apartmentController: _apartmentController,
                    floorController: _floorController,
                    phoneController: _phoneController,
                    commentController: _commentController,
                    onNext: _nextPage,
                  ),
                  SecondStepView(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
