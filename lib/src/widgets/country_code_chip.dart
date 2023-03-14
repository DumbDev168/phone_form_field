import 'package:circle_flags/circle_flags.dart';
import 'package:flutter/material.dart';
import 'package:phone_form_field/src/models/iso_code.dart';

import '../models/country.dart';

class CountryCodeChip extends StatelessWidget {
  final Country country;
  final bool showFlag;
  final bool showDialCode;
  final TextStyle textStyle;
  final EdgeInsets padding;
  final double flagSize;
  final TextDirection? textDirection;

  /// Set flag to square instead of circle
  final bool isFlagSquare;

  /// Set borderRadius when flag is square
  final double flagSquareBorderRadius;

  CountryCodeChip({
    Key? key,
    required IsoCode isoCode,
    this.textStyle = const TextStyle(),
    this.showFlag = true,
    this.showDialCode = true,
    this.padding = const EdgeInsets.all(20),
    this.flagSize = 20,
    this.flagSquareBorderRadius = 5,
    this.isFlagSquare = false,
    this.textDirection,
  })  : country = Country(isoCode, ''),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showFlag) ...[
          CircleFlag(
            country.isoCode.name,
            size: flagSize,
            borderRadius: flagSquareBorderRadius,
            isSquare: isFlagSquare,
          ),
          const SizedBox(width: 8),
        ],
        if (showDialCode)
          Text(
            country.displayCountryCode,
            style: textStyle,
            textDirection: textDirection,
          ),
      ],
    );
  }
}
