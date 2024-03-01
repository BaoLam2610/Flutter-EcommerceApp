import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../configs/themes/themes.dart';
import '../../../../../core/bloc/bloc_state.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/extensions/extensions.dart';
import '../../../../../core/widgets/screen/base_screen.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../../../gen/locale_keys.g.dart';
import '../../../../app/presentation/widgets/language_app_bar.dart';
import '../../widgets/footer/login_social.dart';
import '../../widgets/input/email_input_field.dart';
import '../../widgets/input/password_input_field.dart';
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
    _registerCubit = ReadContext(context).read<RegisterCubit>();
  }

  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: _buildAppBar,
      body: _buildBody,
    );
  }

  PreferredSizeWidget get _buildAppBar => LanguageAppBar(
        title: LocaleKeys.register.tr(),
        textStyle: AppTextStyles.bold24.copyWith(
          color: AppColors.current.primary,
        ),
        isShowBack: true,
      );

  Widget get _buildBody => BlocListener<RegisterCubit, RegisterState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) {
          state.observeData(
            context,
            onSuccess: (_, message) {
              AppDialog.showOkDialogCallBack(
                context: context,
                content: message,
              ).then(
                (value) => context.navigator.maybePop(
                  AppKeys.popBackReload,
                ),
              );
            },
          );
        },
        child: SizedBox(
          height: context.height,
          width: context.width,
          child: ScrollColumnExpandable(
            children: [
              SizedBox(height: 18.h),
              Expanded(
                child: _buildRegisterInputArea,
              ),
              SizedBox(height: 20.h),
              LoginSocial.register(),
            ],
          ),
        ),
      );

  Widget get _buildRegisterInputArea => Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _emailInputField,
            SizedBox(height: 20.h),
            _passwordInputField,
            SizedBox(height: 20.h),
            _passwordConfirmInputField,
            SizedBox(height: 48.h),
            _buildRegisterButton,
          ],
        ),
      );

  Widget get _emailInputField => BlocBuilder<RegisterCubit, RegisterState>(
        buildWhen: (previous, current) =>
            previous.emailError != current.emailError,
        builder: (context, state) {
          return EmailInputField(
            controller: _registerCubit.emailController,
            errorText: state.emailError.tr(),
            onTextChanged: (text) => _registerCubit.validateEmail(),
          );
        },
      );

  Widget get _passwordInputField => BlocBuilder<RegisterCubit, RegisterState>(
        buildWhen: (previous, current) =>
            previous.passwordError != current.passwordError,
        builder: (context, state) {
          return PasswordInputField(
            controller: _registerCubit.passwordController,
            errorText: state.passwordError.tr(),
            onTextChanged: (text) => _registerCubit.validatePassword(),
          );
        },
      );

  Widget get _passwordConfirmInputField =>
      BlocBuilder<RegisterCubit, RegisterState>(
        buildWhen: (previous, current) =>
            previous.passwordConfirmError != current.passwordConfirmError,
        builder: (context, state) {
          return PasswordInputField(
            label: LocaleKeys.confirm_password.tr(),
            hint: LocaleKeys.confirm_password_hint.tr(),
            controller: _registerCubit.passwordConfirmController,
            errorText: state.passwordConfirmError.tr(),
            onTextChanged: (text) => _registerCubit.validatePasswordConfirm(),
          );
        },
      );

  Widget get _buildRegisterButton => AppButton.primary(
        text: LocaleKeys.register.tr(),
        onTap: _registerCubit.doRegister,
      );
}
