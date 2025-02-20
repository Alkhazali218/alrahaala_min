import 'package:alrahaala/features/user/Presentation/widgets/user_view_body.dart';
import 'package:alrahaala/features/user/data/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserView extends StatefulWidget {
  const UserView({super.key});
  static String id = 'user View';

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<UserCubit>(context).getUser();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: UserViewBody(),
    );
  }
}
