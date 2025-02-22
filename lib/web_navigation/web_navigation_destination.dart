import 'package:flutter/material.dart';

/// [WebNavigationDestination] is a class that represents a web navigation destination.
///
/// It's used by [NavigationWeb] to display the navigation items.
///
/// The properties are:
/// - [label] is the label of the navigation item.
/// - [icon] is the icon of the navigation item.
/// - [selectedIcon] is the icon of the navigation item when selected.
/// - [isVisible] is whether the navigation item should be visible or not.
///
/// [isVisible] is mainly used by [NavigationWeb] to omit the creation of the Home navigation item.
///
/// [WebNavigationDestination] is composed by a [TextButton] were inside is a [Row] with an [Icon] and a [Text].
class WebNavigationDestination {
  const WebNavigationDestination({
    required this.label,
    this.icon,
    this.selectedIcon,
    required this.isVisible,
  });

  final String label;
  final Widget? icon;
  final Widget? selectedIcon;
  final bool isVisible;

  Widget build(
    BuildContext context, {
    required bool isSelected,
    required VoidCallback? onPressed,
  }) {
    final theme = Theme.of(context);

    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor:
            isSelected ?  Colors.grey.withOpacity(0.15) : null,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            IconTheme(
              data: IconThemeData(
                color:
                    isSelected ? const Color.fromARGB(255, 245, 144, 12) : null,
                size: 24,
              ),
              child: isSelected ? (selectedIcon ?? icon!) : icon!,
            ),
            const SizedBox(width: 8),
          ],
          Text(
            label,
            style: theme.textTheme.labelLarge?.copyWith(
              color: isSelected ? const Color.fromARGB(255, 245, 144, 12) : null,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
