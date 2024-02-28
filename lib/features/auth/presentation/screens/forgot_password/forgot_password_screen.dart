// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// class ForgotPasswordScreen extends StatefulHookWidget {
//   static const String route = '/forgot_password_screen';
//
//   const ForgotPasswordScreen({super.key});
//
//   @override
//   State<ForgotPasswordScreen> createState() => _ForgotPasswordPageState();
// }
//
// class _ForgotPasswordPageState extends State<ForgotPasswordScreen> {
//   final _emailTextController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       /* appBar: _buildAppBar(),
//       body: _buildBody(),*/
//     );
//   }
// /*
//   _buildAppBar() => AppBar(
//         title: Text(
//           text_forgot_password,
//           style: context.labelLarge,
//         ),
//       );
//
//   _buildBody() => BlocListener<ForgotPasswordBloc, BlocState>(
//         listener: (context, state) async {
//           if (state is Error) {
//             await context.showAlertDialog(
//               title: text_error,
//               content: state.message,
//             );
//           }
//         },
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 18),
//           child: SizedBox(
//             width: double.infinity,
//             height: double.infinity,
//             child: Column(
//               children: [
//                 Expanded(
//                   flex: 1,
//                   child: _buildTitle(),
//                 ),
//                 Expanded(
//                   flex: 2,
//                   child: _buildForgotInput(),
//                 ),
//                 Expanded(
//                   flex: 1,
//                   child: _buildFooterArea(),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
//
//   _buildTitle() => Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             text_dont_worry,
//             style: context.headlineLarge?.copyWith(color: context.primary),
//           ),
//           const SizedBox(height: 12),
//           Text(
//             text_forgot_password_description,
//             textAlign: TextAlign.center,
//             style: context.bodyMedium?.copyWith(
//               color: textColorGrey,
//             ),
//           ),
//         ],
//       );
//
//   _buildForgotInput() => Column(
//         children: [
//           LabelTextField(
//             controller: _emailTextController,
//             label: text_email,
//             hint: text_email_hint,
//             suffixIcon: const Icon(Icons.email_outlined),
//           ),
//           const SizedBox(height: 32),
//           _buildSubmitButton()
//         ],
//       );
//
//   _buildSubmitButton() => SizedBox(
//         height: buttonHeightLarge,
//         width: double.infinity,
//         child: ElevatedButton(
//           onPressed: _onSubmitButtonPressed,
//           style: primaryDefaultRoundedButtonTheme,
//           child: Text(
//             text_submit,
//             style: context.buttonTextTheme,
//           ),
//         ),
//       );
//
//   _buildFooterArea() => Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           _buildSignUpText(),
//           const SizedBox(height: 30),
//         ],
//       );
//
//   _buildSignUpText() => Text.rich(
//         TextSpan(
//           children: [
//             TextSpan(
//               text: text_dont_have_an_account,
//               style: context.bodyMedium?.copyWith(color: textColorGrey),
//             ),
//             TextSpan(
//               text: text_sign_up,
//               style: context.bodyMedium?.copyWith(color: context.primary),
//             ),
//           ],
//         ),
//       );
//
//   void _onSubmitButtonPressed() {
//     context.read<ForgotPasswordBloc>().add(
//           ValidateEmail(_emailTextController.text),
//         );
//   }*/
// }
