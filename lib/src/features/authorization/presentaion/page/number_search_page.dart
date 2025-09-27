import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';

class NumberSearchPage extends StatelessWidget {
  final String phoneHeroTag;
  const NumberSearchPage({super.key, required this.phoneHeroTag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      style: context.typography.inter16Medium.copyWith(
                        color: context.colors.black,
                      ),
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        filled: true,
                        fillColor: context.colors.gray100,
                        prefixIcon: Icon(
                          Icons.search,
                          size: 24,
                          color: context.colors.textGray,
                        ),
                        hintText: 'Country',
                        hintStyle: context.typography.interText16.copyWith(
                          color: context.colors.textGray,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: context.colors.blue,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  TextButton(
                    onPressed: () {
                      context.pop();
                    },
                    child: Text(
                      'Отмена',
                      style: context.typography.inter16Medium.copyWith(
                        color: context.colors.textGray,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
