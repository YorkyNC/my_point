import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';
import 'package:my_point/src/features/review/presentation/components/reposnse_item_widget.dart';

class ResponsesPage extends StatelessWidget {
  const ResponsesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.bgWhite,
      appBar: AppBar(
        title: Text(
          context.loc.responses,
          style: context.typography.inter16Medium.copyWith(color: context.colors.black),
        ),
        centerTitle: true,
        backgroundColor: context.colors.bgWhite,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(context.icons.chevron_left, color: context.colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.separated(
          itemCount: 10,
          itemBuilder: (context, index) => ReposnseItemWidget(),
          separatorBuilder: (context, index) => SizedBox(height: 16),
        ),
      ),
    );
  }
}
