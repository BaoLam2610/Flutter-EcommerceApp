import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../configs/configs.dart';
import '../../../gen/gen.dart';
import '../../core.dart';

class LabelTextField extends StatelessWidget {
  final Function(String text)? _onChanged;
  final TextEditingController? _controller;
  final String? _label;
  final String? _hint;
  final Widget? _prefixIcon;
  final Widget? _suffixIcon;
  final TextInputType? _inputType;
  final String? _errorText;
  final bool? _obscureText;
  final bool? _enabled;
  final bool? _readOnly;
  final bool? _isDense;
  final TextStyle? _hintStyle;
  final TextStyle? _textStyle;
  final InputBorder? _focusedBorder;
  final InputBorder? _enabledBorder;
  final InputBorder? _errorBorder;
  final InputBorder? _border;
  final EdgeInsets? _contentPadding;
  final VoidCallback? _onTap;
  final void Function(PointerDownEvent)? _onTapOutSide;

  const LabelTextField({
    super.key,
    String? label,
    String? hint,
    Widget? prefixIcon,
    Widget? suffixIcon,
    TextInputType? inputType,
    TextEditingController? controller,
    dynamic Function(String)? onChanged,
    String? errorText,
    bool? obscureText,
    bool? enabled,
    bool? readOnly,
    bool? isDense,
    TextStyle? hintStyle,
    TextStyle? textStyle,
    InputBorder? focusedBorder,
    InputBorder? enabledBorder,
    InputBorder? errorBorder,
    InputBorder? border,
    EdgeInsets? contentPadding,
    void Function(PointerDownEvent)? onTapOutSide,
    VoidCallback? onTap,
  })  : _onTapOutSide = onTapOutSide,
        _obscureText = obscureText,
        _errorText = errorText,
        _inputType = inputType,
        _suffixIcon = suffixIcon,
        _prefixIcon = prefixIcon,
        _hint = hint,
        _label = label,
        _controller = controller,
        _onChanged = onChanged,
        _enabled = enabled,
        _readOnly = readOnly,
        _isDense = isDense,
        _hintStyle = hintStyle,
        _textStyle = textStyle,
        _onTap = onTap,
        _border = border,
        _focusedBorder = focusedBorder,
        _enabledBorder = enabledBorder,
        _errorBorder = errorBorder,
        _contentPadding = contentPadding;

  InputBorder get _buildBorder =>
      _border ??
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide(color: AppColors.current.secondary),
      );

  InputBorder get _buildEnabledBorder => _enabledBorder ?? _buildBorder;

  InputBorder get _buildFocusBorder =>
      _focusedBorder ??
      _buildBorder.copyWith(
        borderSide: BorderSide(color: AppColors.current.primary),
      );

  InputBorder get _buildErrorBorder => _errorBorder ?? _buildBorder;

  double get _paddingHorizontalSuffixIcon => 10.w;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!_label.isNullOrEmpty) ...{
          Text(
            _label!,
            style: AppTextStyles.bold16,
          ),
          SizedBox(
            height: 4.h,
          )
        },
        TextFormField(
          readOnly: _readOnly ?? false,
          enabled: _enabled,
          obscureText: _obscureText ?? false,
          onTapOutside:
              _onTapOutSide ?? (_) => FocusScope.of(context).unfocus(),
          onChanged: _onChanged,
          controller: _controller,
          maxLines: 1,
          keyboardType: _inputType,
          style: _textStyle ?? AppTextStyles.regular14,
          decoration: InputDecoration(
            isDense: _isDense,
            fillColor: AppColors.current.background,
            filled: true,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            contentPadding: _contentPadding ??
                EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 14.h,
                ),
            hintText: _hint,
            hintStyle: _hintStyle ??
                AppTextStyles.regular14.copyWith(
                  color: AppColors.current.secondary,
                ),
            suffixIcon: _buildSuffixIcon,
            suffixIconConstraints: _buildSuffixBoxConstraints,
            prefixIcon: _buildPrefixIcon,
            prefixIconConstraints: _buildPrefixBoxConstraints,
            focusedBorder: _buildFocusBorder,
            enabledBorder: _buildEnabledBorder,
            errorBorder: _buildErrorBorder,
          ),
          onTap: _onTap,
        ),
        if (!_errorText.isNullOrEmpty) ...{
          SizedBox(height: 4.h),
          _buildErrorArea,
        }
      ],
    );
  }

  Widget get _buildErrorArea {
    return Row(
      children: [
        SizedBox(width: 2.w),
        Assets.icons.solidCircleError.svg(
          colorFilter: ColorFilter.mode(
            AppColors.current.critical,
            BlendMode.srcIn,
          ),
        ),
        SizedBox(width: 2.w),
        Text(
          _errorText!,
          style: AppTextStyles.regular14.copyWith(
            color: AppColors.current.critical,
          ),
        )
      ],
    );
  }

  Widget? get _buildSuffixIcon =>
      _suffixIcon == null ? null : _buildIcon(_suffixIcon!);

  Widget? get _buildPrefixIcon =>
      _prefixIcon == null ? null : _buildIcon(_prefixIcon!);

  BoxConstraints? get _buildSuffixBoxConstraints =>
      _suffixIcon == null ? null : _buildBoxConstraints;

  BoxConstraints? get _buildPrefixBoxConstraints =>
      _prefixIcon == null ? null : _buildBoxConstraints;

  Widget _buildIcon(Widget child) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: _paddingHorizontalSuffixIcon,
      ),
      child: child,
    );
  }

  BoxConstraints? get _buildBoxConstraints => BoxConstraints(
        maxWidth: 24.r + (_paddingHorizontalSuffixIcon * 2),
        maxHeight: 24.h,
      );
}
