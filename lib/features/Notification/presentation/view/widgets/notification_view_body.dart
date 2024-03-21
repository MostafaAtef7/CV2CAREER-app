import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp_app/constants.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Notifications",
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF78EA79), Color(0xFF3FC3AE)],
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              stops: [0.0, 0.9],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 30,
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
              gradient: LinearGradient(
                colors: [Color(0xFF78EA79), Color(0xFF3FC3AE)],
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                stops: [0.0, 0.9],
              ),
            ),
            child: const Text(""),
          ),
          const SizedBox(
            height: 20,
          ),
          StreamBuilder(
            stream: _chatservisrs.getUserStream(),
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
