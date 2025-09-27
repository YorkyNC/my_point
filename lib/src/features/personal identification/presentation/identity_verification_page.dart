import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';
import 'package:my_point/src/core/router/router.dart';

class IdentityVerificationPage extends StatelessWidget {
  const IdentityVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900], // Dark background
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with close button
              Row(
                children: [
                  Spacer(),
                  IconButton(
                    onPressed: () => context.pop(),
                    icon: Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),

              // Main title
              Text(
                'Подтверждение личности',
                style: context.typography.interTitlle20Semibold.copyWith(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 8),

              // Subtitle
              Text(
                'Это займет не более 2 минут',
                style: context.typography.interText16.copyWith(
                  color: Colors.white70,
                ),
              ),
              SizedBox(height: 32),

              // Identity Document Option
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: context.colors.blue,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.description_outlined,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'Удостоверение личности',
                            style: context.typography.inter16Medium.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Сфотографируйте ваше удостоверение личности',
                      style: context.typography.interText14.copyWith(
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),

              // Selfie Option
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: context.colors.blue,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.person_outline,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'Селфи',
                            style: context.typography.inter16Medium.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Сделайте селфи',
                      style: context.typography.interText14.copyWith(
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),

              // Legal consent text
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: RichText(
                  text: TextSpan(
                    style: context.typography.interText12.copyWith(
                      color: Colors.grey[400],
                      height: 1.4,
                    ),
                    children: [
                      TextSpan(
                        text: 'By selecting continue, you confirm that you have read the ',
                      ),
                      TextSpan(
                        text: 'Notification to Processing of Personal Data',
                        style: TextStyle(
                          color: context.colors.blue,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text:
                            '. If you are a US resident, by selecting continue, you confirm that you consent to the processing of your personal data, including biometrics, as described in the ',
                      ),
                      TextSpan(
                        text: 'Privacy User Acknowledgement and Consent',
                        style: TextStyle(
                          color: context.colors.blue,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: '.',
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Continue button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: context.colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    // Navigate to document selection page
                    context.push(RoutePaths.documentSelection);
                  },
                  child: Text(
                    'Продолжить',
                    style: context.typography.inter16Medium.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Footer
              Center(
                child: Text(
                  'Основано на технологии Sumsub',
                  style: context.typography.interText12.copyWith(
                    color: Colors.grey[500],
                  ),
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
