import 'package:flutter/material.dart';
import 'package:kld/comps/containter.dart';
import 'package:kld/comps/form.dart';
import 'package:kld/comps/rich_text.dart';
import 'package:kld/comps/text.dart';
import 'package:kld/comps/button.dart';
import 'package:kld/comps/text_field.dart';

class MCommon extends StatelessWidget {
  const MCommon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("通用组件"),
      ),
      body: ListView(
        children: const [
          MContainer(),
          MText(),
          MRichText(),
          MButton(),
          MInput(),
          MForm()
        ],
      ),
    );
  }
}
