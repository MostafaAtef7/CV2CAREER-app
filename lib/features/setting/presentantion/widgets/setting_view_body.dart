import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_app/core/utils/functions/open_pdf.dart';
import 'package:gp_app/core/widgets/custom_buttom.dart';
import 'package:gp_app/features/auth/presentation/manager/auth_cubits/auth_cubit.dart';
import 'package:gp_app/features/cv_view/data/cv_data.dart';

class SettingViewBody extends StatelessWidget {
  const SettingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(120.0),
          child: Column(
            children: [
              CustomButton(
                width: 200,
                height: 50,
                onPressed: () =>
                    BlocProvider.of<AuthCubit>(context).signOut(context),
                text: 'Log out',
              ),
              const SizedBox(
                height: 4,
              ),
              CustomButton(
                width: 200,
                height: 50,
                onPressed: () =>
                    BlocProvider.of<AuthCubit>(context).retrieveData(),
                text: 'info',
              ),
              CustomButton(
                width: 200,
                height: 50,
                onPressed: () async{
                    const url = 'users/Lecture 3_Polygon Fill Area.pdf';
                  final file = await CvApi.loadFirebasePdf(url: url);
                  openPdf(file: file, context: context);
                   },
                text: 'View CV',
              ),
            ],
          ),
        );
      },
    );
  }
}
