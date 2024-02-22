import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../configs/themes/themes.dart';
import '../../../../../core/extensions/extensions.dart';
import '../../../../../core/screen/base_screen.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../../../gen/locale_keys.g.dart';
import '../../widgets/email_input/email_input_field.dart';
import '../../widgets/password_input/password_input_field.dart';
import 'bloc/register_cubit.dart';

class RegisterScreen extends BaseScreen {
  const RegisterScreen({super.key});

  @override
  BaseScreenState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends BaseScreenState<RegisterScreen> {
  late RegisterCubit _registerCubit;

  @override
  void initState() {
    super.initState();
    _registerCubit = ReadContext(context).read<RegisterCubit>()..init(context);
  }

  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: _buildBody,
    );
  }

  Widget get _buildBody => BlocListener<RegisterCubit, RegisterState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) {
          // state.status.observeData<LoginInfoEntity>(
          //   context,
          //   onSuccess: (data, message) {
          //     /*
          //         * Navigate to home screen
          //         * */
          //   },
          // );
        },
        child: SizedBox(
          height: context.height,
          width: context.width,
          child: ScrollColumnExpandable(
            children: [
              Expanded(
                flex: 1,
                child: _buildTitle,
              ),
              Expanded(
                flex: 4,
                child: _buildRegisterInputArea,
              ),
            ],
          ),
        ),
      );

  Widget get _buildTitle => Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 12.h),
            Text(
              LocaleKeys.register.tr(),
              style: AppTextStyles.bold32.copyWith(
                color: AppColors.current.primary,
              ),
            ),
          ],
        ),
      );

  Widget get _buildRegisterInputArea => Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const EmailInputField(),
            SizedBox(height: 20.h),
            const PasswordInputField(),
            SizedBox(height: 32.h),
            _buildRegisterButton,
          ],
        ),
      );

  Widget get _buildRegisterButton => AppButton.primary(
        text: LocaleKeys.register.tr(),
        onTap: () {}, //_registerCubit.doLogin,
      );
}
