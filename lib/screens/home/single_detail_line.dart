import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:my_online_buddies/widgets/my_text.dart';

class SingleDetailLine extends StatelessWidget {
  final String name;
  final String details;
  const SingleDetailLine({
    super.key,
    required this.name,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 3,
          child: MyText(
            text: name,
            weight: FontWeight.bold,
            size: 17.0,
          ),
        ),
        const SizedBox(
          width: 20.0,
        ),
        Expanded(
          flex: 5,
          child: MyText(
            text: details,
            size: 16.0,
            maxLines: 15,
            overFlow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
