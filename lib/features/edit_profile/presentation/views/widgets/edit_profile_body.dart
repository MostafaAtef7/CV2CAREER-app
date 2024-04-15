import 'package:flutter/material.dart';
import 'package:gp_app/features/edit_profile/presentation/views/widgets/custom_save_button.dart';
import 'package:gp_app/features/edit_profile/presentation/views/widgets/edit_form.dart';

class EditProfileBody extends StatelessWidget {
  const EditProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 75),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: 10,
                  left: 70,
                  child: Container(
                    height: 560,
                    width: 298,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 18,
                          spreadRadius: 0,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Card(
                      color: Theme.of(context).colorScheme.primary,
                      elevation: 1,
                      child: const Padding(
                        padding: EdgeInsets.only(top: 36, right: 29, left: 23),
                        child: EditForm(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          CustomSaveButton(
            firstName: EditForm.firstName,
            lastName: EditForm.lastName,
            email: EditForm.email,
            currentPassword: EditForm.currentPassword,
            updatePassword: EditForm.updatePassword,
          )
        ],
      ),
    );
  }
}
