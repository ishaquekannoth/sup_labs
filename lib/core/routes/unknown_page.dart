import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sup_labs_task/core/common/widgets/utility_widgets/image_widget.dart';

import '../constants/constants.dart';

class UnknownPage extends StatelessWidget {
  const UnknownPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(CupertinoIcons.back),
        title: const Text('Unknown Page'),
      ),
      body: Column(
        children: [
          const Spacer(flex: 2),
          Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: const AspectRatio(
                  aspectRatio: 1 / 1,
                  child: ImageWidget<String>(
                      imageUrl: 'https://i.imgur.com/mVeoFh5.png',
                      height: 350,
                      data: "")),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppDefaults.padding),
            child: Column(
              children: [
                Text(
                  'oppss!! something wrong',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: AppDefaults.padding),
                  child: Text(
                    'Sorry, something went wrong\nplease try again .',
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(AppDefaults.padding * 2),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Try Again'),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
