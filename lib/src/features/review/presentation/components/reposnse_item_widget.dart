import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';

class ReposnseItemWidget extends StatelessWidget {
  const ReposnseItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(color: context.colors.white, borderRadius: BorderRadius.circular(16)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: context.colors.gray,
                radius: 20,
                child: Text('A', style: context.typography.interText14.copyWith(color: context.colors.white)),
              ),
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Иван Иванов', style: context.typography.interText14.copyWith(color: context.colors.black)),
                  SizedBox(height: 4),
                  Row(
                    spacing: 4,
                    children: [
                      Icon(Icons.star, size: 16, color: Colors.amber),
                      Text('5.0', style: context.typography.interText12.copyWith(color: context.colors.black)),
                      Text('10 доставок', style: context.typography.interText12.copyWith(color: context.colors.gray)),
                    ],
                  ),
                ],
              ),
              Spacer(),
              Text('7500 ₸', style: context.typography.interTitlle20Semibold.copyWith(color: context.colors.black)),
            ],
          ),
          SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: context.colors.gray100,
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            child: Row(
              children: [
                Text('FlyArystan', style: context.typography.inter14Bold.copyWith(color: context.colors.redBold)),
                SizedBox(width: 8),
                Text('IQ 360 ₸', style: context.typography.inter14Bold.copyWith(color: context.colors.black)),
                SizedBox(width: 8),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('07/06/2025', style: context.typography.interText12.copyWith(color: context.colors.gray)),
                    Text('08/06/2025', style: context.typography.interText12.copyWith(color: context.colors.gray)),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(onPressed: () {}, child: Text('Принять')),
              ),
            ],
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}

// TODO fix one general appbar
