import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';

class DocumentSelectionPage extends StatelessWidget {
  const DocumentSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.white,
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
                      color: context.colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),

              // Main title
              Text(
                'Выберите страну выдачи документа.',
                style: context.typography.interTitlle20Semibold.copyWith(
                  color: context.colors.black,
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 24),

              // Country Selection
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: context.colors.gray50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: context.colors.gray200,
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    // Flag icon (you can replace with actual flag asset)
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: context.colors.blue,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Center(
                        child: Text(
                          'KZ',
                          style: context.typography.interText12.copyWith(
                            color: context.colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Казахстан',
                        style: context.typography.inter16Medium.copyWith(
                          color: context.colors.black,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: context.colors.gray400,
                      size: 16,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),

              // Document type subtitle
              Text(
                'Выберите тип документа',
                style: context.typography.inter16Medium.copyWith(
                  color: context.colors.black,
                ),
              ),
              SizedBox(height: 16),

              // Document Type Options
              _buildDocumentOption(
                context,
                icon: Icons.public,
                title: 'Паспорт',
                subtitle: 'Passport',
              ),
              SizedBox(height: 12),
              _buildDocumentOption(
                context,
                icon: Icons.home_outlined,
                title: 'Вид на жительство',
                subtitle: 'Residence Permit',
              ),
              SizedBox(height: 12),
              _buildDocumentOption(
                context,
                icon: Icons.credit_card_outlined,
                title: 'ID карта',
                subtitle: 'ID Card',
              ),
              SizedBox(height: 24),

              // Help text
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: context.colors.gray50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: RichText(
                  text: TextSpan(
                    style: context.typography.interText14.copyWith(
                      color: context.colors.gray500,
                      height: 1.4,
                    ),
                    children: [
                      TextSpan(
                        text: 'Если вы не видите нужной страны или документа, обратитесь в ',
                      ),
                      TextSpan(
                        text: 'поддержку',
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
              Spacer(),

              // Footer
              Center(
                child: Text(
                  'Основано на технологии Sumsub',
                  style: context.typography.interText12.copyWith(
                    color: context.colors.gray400,
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

  Widget _buildDocumentOption(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colors.gray50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: context.colors.gray200,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: context.colors.blue,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: context.colors.white,
              size: 20,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: context.typography.inter16Medium.copyWith(
                    color: context.colors.black,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  subtitle,
                  style: context.typography.interText12.copyWith(
                    color: context.colors.gray500,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: context.colors.gray400,
            size: 16,
          ),
        ],
      ),
    );
  }
}
