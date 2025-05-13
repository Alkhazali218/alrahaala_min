import 'dart:typed_data';
import 'dart:ui';
import 'package:alrahaala/core/utils/helper/constant.dart';
import 'package:alrahaala/features/money%20transfer/Presentation/widgets/custom_notifiaction_body.dart';
import 'package:alrahaala/features/money%20transfer/data/data%20get%20transfer/cubit/get_transfer_cubit.dart';
import 'package:alrahaala/features/money%20transfer/data/data%20get%20transfer/models/get_transfer_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class CustomNotification extends StatefulWidget {
  const CustomNotification({super.key});
  static String id = 'custom_notification';

  @override
  State<CustomNotification> createState() => _CustomNotificationState();
}

class _CustomNotificationState extends State<CustomNotification> {
  final GlobalKey _globalKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetTransferCubit>(context).getTransfer();
  }

  Future<void> _captureAndShareScreenshot() async {
    RenderRepaintBoundary boundary =
        _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    var image = await boundary.toImage(pixelRatio: 3.0);
    ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();

    final directory = await getTemporaryDirectory();
    final imagePath = File('${directory.path}/screenshot.png');
    await imagePath.writeAsBytes(pngBytes);

    await Share.shareXFiles([XFile(imagePath.path)]);
  }

  @override
  Widget build(BuildContext context) {
    var data =
        ModalRoute.of(context)!.settings.arguments as DataGetTransferModel;

    return RepaintBoundary(
      key: _globalKey,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kcolor,
          foregroundColor: kprimaryColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(FontAwesomeIcons.share),
                onPressed: _captureAndShareScreenshot,
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: CustomNotifiactionBody(data: data),
        ),
      ),
    );
  }
}
