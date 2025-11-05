import 'package:hive/hive.dart';
import 'package:onehaven_flutter_challenge/domain/entities/hive/auth_state.dart';
import 'package:onehaven_flutter_challenge/domain/entities/hive/user.dart';
import 'package:onehaven_flutter_challenge/domain/routes/route_generator.dart';
import 'package:onehaven_flutter_challenge/gen/fonts.gen.dart';
import 'package:onehaven_flutter_challenge/presentation/widgets/ui/ui.dart';
import 'package:onehaven_flutter_challenge/services/services.dart';
import 'package:onehaven_flutter_challenge/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:onehaven_flutter_challenge/utils/hive_const.dart';

class DeleteAccountModal extends StatefulWidget {
  final Function()? onSuccess;
  final Function()? onCancel;

  const DeleteAccountModal({
    super.key,
    this.onSuccess,
    this.onCancel,
  });

  @override
  State<DeleteAccountModal> createState() => _DeleteAccountModalState();
}

class _DeleteAccountModalState extends State<DeleteAccountModal> {
  bool _loading = false;
  // AuthResponseModel? _auth;

  var userIdBox = Hive.box<String>(HiveConst.useridBox);
  var userInfoBox = Hive.box<UserHive>(HiveConst.userInfoBox);
  final authBox = Hive.box<AuthStateHive>(HiveConst.authStateBox);

  void _handleLogout() async {
    setState(() {
      _loading = true;
    });

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Provider.of<HttpService>(context, listen: false)
          .auth
          .deleteAccount();
      // ignore: use_build_context_synchronously
      await context.read<AuthService>().clearAuth();
      // ignore: use_build_context_synchronously
      userIdBox.clear();
      userInfoBox.clear();
      authBox.clear();

      // await Navigator.pushNamed(context, RouteGenerator.joinPage);
      // CyberHygieneToast.show('You have successfully logged out');
      setState(() {
        _loading = false;
      });
    });
  }

  void getCurrentUser() {
    setState(() {
      // _auth = context.read<AuthService>().auth;
    });
  }

  @override
  void initState() {
    super.initState();

    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.symmetric(vertical: 20),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0), // Adjust radius here
      ),
      content: const SingleChildScrollView(
        padding: EdgeInsets.all(0),
        child: ViewContainer(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            YMargin(20),
            ThemeText(
              text: 'Deactivate Account',
              textAlign: TextAlign.center,
              fontSize: FontSize.lg,
              fontWeight: FontWeight.w500,
            ),
            YMargin(10),
            ThemeText(
              text:
                  'Are you sure you want to deactivate your account?\n\nYour account will be permanently deleted and all your data will be removed.',
              color: ThemeColors.descriptionText,
              textAlign: TextAlign.center,
            ),
            YMargin(20),
          ],
        ),
      ),
      actionsPadding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ThemeButton(
                'Cancel',
                fontSize: FontSize.sm,
                elevation: 0,
                isDisabled: _loading,
                onPressed: widget.onCancel,
                color: Colors.black87,
                background: ThemeColors.settingsItemBorder,
              ),
            ),
            const XMargin(20),
            Expanded(
              child: ThemeButton(
                'Delete',
                fontSize: FontSize.sm,
                background: Colors.red.shade600,
                elevation: 0,
                isLoading: _loading,
                onPressed: _handleLogout,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
