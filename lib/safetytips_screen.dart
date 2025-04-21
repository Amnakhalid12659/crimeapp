import 'package:flutter/material.dart';
import 'package:project/utils/constants/colors.dart';
import 'package:project/utils/constants/text_strings.dart';

class SafetyTipsScreen extends StatelessWidget {
  const SafetyTipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final titles = [
      TextStrings.safetyTipsTitle1,
      TextStrings.safetyTipsTitle2,
      TextStrings.safetyTipsTitle3,
      TextStrings.safetyTipsTitle4,
      TextStrings.safetyTipsTitle5,
    ];

    final contents = [
      TextStrings.safetyTipsContent1,
      TextStrings.safetyTipsContent2,
      TextStrings.safetyTipsContent3,
      TextStrings.safetyTipsContent4,
      TextStrings.safetyTipsContent5,
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("Safety Tips & Guidelines",
            style: TextTheme.of(context)
                .titleLarge
                ?.copyWith(color: Colors.white)),
        backgroundColor: MyColors.primaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 26, horizontal: 24),
          child: Column(
            children: [
              for (int i = 0; i < 5; i++)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
                    Text(
                      titles[i],
                      style: TextTheme.of(context)
                          .titleLarge
                          ?.copyWith(color: MyColors.primaryColor),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(contents[i], style: TextTheme.of(context).titleMedium),
                    const SizedBox(height: 16),
                    const Divider(),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
