// import 'package:flutter/material.dart';
// import 'package:form_builder_validators/form_builder_validators.dart';

// extension FormValidators on FormBuilderValidators {
//   static FormFieldValidator<String> passwordValidator({String? text}) {
//     return FormBuilderValidators.compose([
//       FormBuilderValidators.required(
//         errorText: text ?? 'Please enter a password',
//       ),
//       FormBuilderValidators.minLength(6, errorText: 'Please enter min 6 digit'),
//     ]);
//   }

//   static FormFieldValidator<String> get validateEmail {
//     return FormBuilderValidators.compose([
//       FormBuilderValidators.required(errorText: 'Please enter your e-mail'),
//       FormBuilderValidators.email(errorText: 'Please enter valid e-mail'),
//     ]);
//   }
// }
