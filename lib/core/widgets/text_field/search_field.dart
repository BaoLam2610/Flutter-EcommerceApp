import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../gen/gen.dart';
import '../../core.dart';

class SearchField extends StatelessWidget {
  final Function(String text)? _onChanged;
  final TextEditingController? _controller;
  final String? _label;
  final String? _hint;
  final TextInputType? _inputType;
  final String? _errorText;
  final bool? _enabled;
  final bool? _readOnly;
  final bool? _isDense;
  final TextStyle? _hintStyle;
  final TextStyle? _textStyle;
  final EdgeInsets? _contentPadding;
  final VoidCallback? _onTap;
  final void Function(PointerDownEvent)? _onTapOutSide;
  final Color? _searchIconColor;

  factory SearchField.small({
    Key? key,
    String? label,
    String? hint,
    TextInputType? inputType,
    TextEditingController? controller,
    dynamic Function(String)? onChanged,
    String? errorText,
    bool? enabled,
    bool? readOnly,
    bool? isDense,
    TextStyle? hintStyle,
    TextStyle? textStyle,
    void Function(PointerDownEvent)? onTapOutSide,
    VoidCallback? onTap,
    Color? searchIconColor,
  }) {
    return SearchField(
      key: key,
      label: label,
      hint: hint,
      inputType: inputType,
      controller: controller,
      onChanged: onChanged,
      errorText: errorText,
      enabled: enabled,
      readOnly: readOnly,
      isDense: SearchFieldType.small.isDense,
      hintStyle: hintStyle,
      textStyle: textStyle,
      onTapOutSide: onTapOutSide,
      onTap: onTap,
      contentPadding: SearchFieldType.small.contentPadding,
      searchIconColor: searchIconColor,
    );
  }

  factory SearchField.normal({
    Key? key,
    String? label,
    String? hint,
    TextInputType? inputType,
    TextEditingController? controller,
    dynamic Function(String)? onChanged,
    String? errorText,
    bool? enabled,
    bool? readOnly,
    bool? isDense,
    TextStyle? hintStyle,
    TextStyle? textStyle,
    void Function(PointerDownEvent)? onTapOutSide,
    VoidCallback? onTap,
    Color? searchIconColor,
  }) {
    return SearchField(
      key: key,
      label: label,
      hint: hint,
      inputType: inputType,
      controller: controller,
      onChanged: onChanged,
      errorText: errorText,
      enabled: enabled,
      readOnly: readOnly,
      isDense: SearchFieldType.normal.isDense,
      hintStyle: hintStyle,
      textStyle: textStyle,
      onTapOutSide: onTapOutSide,
      onTap: onTap,
      contentPadding: SearchFieldType.normal.contentPadding,
      searchIconColor: searchIconColor,
    );
  }

  const SearchField({
    super.key,
    String? label,
    String? hint,
    TextInputType? inputType,
    TextEditingController? controller,
    dynamic Function(String)? onChanged,
    String? errorText,
    bool? enabled,
    bool? readOnly,
    bool? isDense,
    TextStyle? hintStyle,
    TextStyle? textStyle,
    EdgeInsets? contentPadding,
    void Function(PointerDownEvent)? onTapOutSide,
    VoidCallback? onTap,
    Color? searchIconColor,
  })  : _onTapOutSide = onTapOutSide,
        _errorText = errorText,
        _inputType = inputType,
        _hint = hint,
        _label = label,
        _controller = controller,
        _onChanged = onChanged,
        _enabled = enabled,
        _readOnly = readOnly,
        _isDense = isDense,
        _hintStyle = hintStyle,
        _textStyle = textStyle,
        _contentPadding = contentPadding,
        _onTap = onTap,
        _searchIconColor = searchIconColor;

  @override
  Widget build(BuildContext context) {
    return LabelTextField(
      readOnly: _readOnly,
      label: _label,
      hint: _hint,
      hintStyle: _hintStyle,
      textStyle: _textStyle,
      controller: _controller,
      inputType: _inputType,
      errorText: _errorText,
      enabled: _enabled,
      onChanged: _onChanged,
      prefixIcon: Assets.icons.icSearch.svg(
        colorFilter: _searchIconColorFilter,
      ),
      onTap: _onTap,
      onTapOutSide: _onTapOutSide,
      enabledBorder: _buildBorder,
      focusedBorder: _buildBorder,
      isDense: _isDense,
      contentPadding: _contentPadding,
    );
  }

  InputBorder get _buildBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.r),
        borderSide: const BorderSide(color: Colors.transparent),
      );

  ColorFilter? get _searchIconColorFilter {
    if (_searchIconColor == null) {
      return null;
    }
    return ColorFilter.mode(_searchIconColor!, BlendMode.srcIn);
  }
}

enum SearchFieldType {
  normal,
  small,
}

extension SearchFieldExtension on SearchFieldType {
  EdgeInsets? get contentPadding {
    switch (this) {
      case SearchFieldType.small:
        return EdgeInsets.symmetric(vertical: 8.h, horizontal: 20.w);
      case SearchFieldType.normal:
        return null;
    }
  }

  bool? get isDense {
    switch (this) {
      case SearchFieldType.small:
        return true;
      case SearchFieldType.normal:
        return null;
    }
  }
}
