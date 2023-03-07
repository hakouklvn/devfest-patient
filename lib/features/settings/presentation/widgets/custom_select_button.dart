import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:patient/core/config/config.dart';

class CustomSelectButton extends ConsumerStatefulWidget {
  final Function(String) select;
  final List<String> items;
  final IconData icon;
  final String initText;

  const CustomSelectButton({
    super.key,
    required this.select,
    required this.items,
    required this.icon,
    required this.initText,
  });

  @override
  CustomSelectButtonState createState() => CustomSelectButtonState();
}

class CustomSelectButtonState extends ConsumerState<CustomSelectButton> {
  String? selectedItem;

  @override
  Widget build(BuildContext context) {
    selectedItem = widget.initText;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.defaultPadding,
        vertical: Sizes.defaultPadding * 0.5,
      ),
      decoration: UI.boxDecoration(Theme.of(context).cardColor, 0.2),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          value: selectedItem,
          items: widget.items
              .map(
                (String item) => DropdownMenuItem<String>(
                  value: item,
                  child: Row(
                    children: [
                      Icon(widget.icon),
                      const SizedBox(width: Sizes.defaultPadding),
                      Text(item),
                    ],
                  ),
                ),
              )
              .toList(),
          onChanged: (value) {
            setState(() {
              selectedItem = value.toString();
              widget.select(value.toString());
            });
          },
          isExpanded: true,
          icon: const Icon(Icons.arrow_drop_down_rounded),
          hint: const Text('choose'),
          iconSize: 30,
        ),
      ),
    );
  }
}
