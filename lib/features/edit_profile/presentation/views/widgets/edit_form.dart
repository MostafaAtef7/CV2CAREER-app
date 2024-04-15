import 'package:flutter/material.dart';

import 'edit_text_field.dart';
import 'label_text.dart';

class EditForm extends StatelessWidget {
  const EditForm({super.key});
  static late String firstName;
  static late String lastName;
  static late String email;
  static late String currentPassword;
  static late String updatePassword;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const LabelText(labelText: 'First Name'),
        const SizedBox(
          height: 5,
        ),
        EditTextField(
          hintText: 'user name',
          onSumbitted: (value) {
            firstName = value;
          },
        ),
        const SizedBox(
          height: 28,
        ),
        const LabelText(labelText: 'Last Name'),
        const SizedBox(
          height: 5,
        ),
        EditTextField(
          hintText: 'user name',
          onSumbitted: (value) {
            lastName = value;
          },
        ),
        const SizedBox(
          height: 28,
        ),
        const LabelText(labelText: 'Email'),
        const SizedBox(
          height: 5,
        ),
        EditTextField(
          hintText: 'user email',
          onSumbitted: (value) {
            email = value;
          },
        ),
        const SizedBox(
          height: 28,
        ),
        const LabelText(labelText: 'Current Password'),
        const SizedBox(
          height: 5,
        ),
        EditTextField(
          hintText: 'password',
          onSumbitted: (value) {
            currentPassword = value;
          },
        ),
        const SizedBox(
          height: 28,
        ),
        const LabelText(labelText: 'Update Password'),
        const SizedBox(
          height: 5,
        ),
        EditTextField(
          hintText: 'password',
          onSumbitted: (value) {
            updatePassword = value;
          },
        ),
        const SizedBox(
          height: 28,
        ),
      ],
    );
  }
}
