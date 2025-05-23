import 'package:flutter/material.dart';
import 'package:ovodrive_app/widgets/custon_page_view.dart';

class SliderPageView extends StatefulWidget {
  const SliderPageView({super.key});

  @override
  State<SliderPageView> createState() => _SliderPageViewState();
}

class _SliderPageViewState extends State<SliderPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(children: [Expanded(child: CustomPageView())]),
      ),
    );
  }
}
