import 'package:flutter/material.dart';

class TProductPriceText extends StatelessWidget {
  TProductPriceText({
    super.key,
    this.currencySign = 'DZ',
    this.min = 100,
    this.max = 500,
    this.divider = 1,
    required this.price,
    this.isLarge = false,
    this.maxLines = 1,
    this.lineThrough = false,
  });

  final String currencySign, price;
  int min;
  int max;
  double divider;
  final int maxLines;
  final bool isLarge;
  final bool lineThrough;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          currencySign +
              " " +
              "${(double.parse(price) * divider).toStringAsFixed(2)}",
          maxLines: maxLines,
          overflow: TextOverflow.ellipsis,
          style: isLarge
              ? Theme.of(context).textTheme.headlineMedium!.apply(
                  decoration: lineThrough ? TextDecoration.lineThrough : null)
              : Theme.of(context).textTheme.titleLarge!.apply(
                  decoration: lineThrough ? TextDecoration.lineThrough : null),
        ),
        Text(min.toString() + ' - ' + max.toString(),
            maxLines: maxLines,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall!.apply(
                decoration: lineThrough ? TextDecoration.lineThrough : null)),
      ],
    );
  }
}
