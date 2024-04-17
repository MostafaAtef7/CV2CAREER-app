import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_app/constants.dart';
import 'package:gp_app/core/widgets/custom_app_bar.dart';
import 'package:gp_app/features/auth/presentation/manager/auth_cubits/auth_cubit.dart';
import 'package:gp_app/features/chat/domain/chat_servises.dart';
import 'package:gp_app/features/chat/presentation/view/widgets/chat_view_body.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class NotificationViewBody extends StatefulWidget {
  const NotificationViewBody({super.key});

  @override
  State<NotificationViewBody> createState() => _NotificationViewBodyState();
}

class _NotificationViewBodyState extends State<NotificationViewBody> {
  final Chatservices _chatservisrs = Chatservices();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CustomAppBar(
          paddingHorizontal: 20,
          paddingVertical: 30,
          widget: Text(
            "Notifications",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
              fontFamily: "Inter",
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            right: 18,
            left: 18,
            top: 65,
          ),
          child: Column(
            children: [
              StreamBuilder(
                stream: _chatservisrs.getUserStream2(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Text("Error+++++++++++++++++");
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Column(
                      children: [
                        const SizedBox(height: 220),
                        Center(
                          child: LoadingAnimationWidget.waveDots(
                            size: 30,
                            color: kPrimaryColor,
                          ),
                        ),
                      ],
                    );
                  }
                  // return SizedBox();
                  return Expanded(
                    child: ListView.builder(
                      itemCount: 1,
                      shrinkWrap: true,
                      itemBuilder: (ctx, i) {
                        return Column(
                          children: snapshot.data!
                              .map<Widget>(
                                  (userData) => _element(userData, context))
                              .toList(),
                        );
                      },
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}

Widget _element(Map<String, dynamic> userData, BuildContext context) {
  return BlocProvider.of<AuthCubit>(context).getCurrentuser()!.email !=
          userData["email"]
      ? GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatViewBody(
                  reciveEmail:
                      userData["email"].toString().split("@")[0].toUpperCase(),
                  reciveID: userData["uid"],
                ),
              ),
            );
          },
          child: Container(
            margin:
                const EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: const Color.fromARGB(255, 233, 240, 237),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(userData["email"].toString().split("@")[0].toUpperCase()),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: unSelectedColor,
                ),
              ],
            ),
          ),
        )
      : Container();
}
