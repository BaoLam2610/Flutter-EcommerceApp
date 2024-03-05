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
  final TextStyle? _hintStyle;
  final TextStyle? _textStyle;
  final VoidCallback? _onTap;
  final void Function(PointerDownEvent)? _onTapOutSide;

  const SearchField({
    super.key,
    String? label,
    String? hint,
    TextInputType? inputType,
    TextEditingController? controller,
    dynamic Function(String)? onChanged,
    String? errors,
    bool? enabled,
    bool? readOnly,
    TextStyle? hintStyle,
    TextStyle? textStyle,
    void Function(PointerDownEvent)? onTapOutSide,
    VoidCallback? onTap,
  })  : _onTapOutSide = onTapOutSide,
        _errorText = errors,
        _inputType = inputType,
        _hint = hint,
        _label = label,
        _controller = controller,
        _onChanged = onChanged,
        _enabled = enabled,
        _readOnly = readOnly,
        _hintStyle = hintStyle,
        _textStyle = textStyle,
        _onTap = onTap;

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
      prefixIcon: Assets.icons.icSearch.svg(),
      onTap: _onTap,
      onTapOutSide: _onTapOutSide,
      enabledBorder: _buildBorder,
      focusedBorder: _buildBorder,
    );
  }

  InputBorder get _buildBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.r),
        borderSide: const BorderSide(color: Colors.transparent),
      );
}
