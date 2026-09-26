import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:meditation_application/model/mindful_excerices_model.dart';
import 'package:meditation_application/model/sleep_excerices_model.dart';
import 'package:meditation_application/utilites/colors.dart';
import 'package:meditation_application/utilites/text_styles.dart';
import 'package:provider/provider.dart';

import '../../providers/filter_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Image.asset(
                "assets/images/meditation.png",
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width * 0.09,
              ),
              const SizedBox(width: 16),
              Text(
                "Meditator",
                style: ApptextTiles.titleStyle.copyWith(
                  color: AppColors.primaryPurple,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: FutureBuilder(
            future: Provider.of<FilterProvider>(
              context,
              listen: false,
            ).getAllData(context),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return const Center(child: Text("Error loading data"));
              }
              return Consumer<FilterProvider>(
                builder: (context, filterdData, child) {
                  final compltedData = filterdData.filterdata;
                  compltedData.shuffle();
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Select a categroy to start exploring",
                          style: ApptextTiles.subtitleStyle.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: AppColors.primaryPurple.withOpacity(0.3),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  FilterChip(
                                    label: Text("All"),
                                    onSelected: (value) {},
                                  ),
                                  const SizedBox(width: 8),
                                  FilterChip(
                                    label: Text("Mindfulness"),
                                    onSelected: (value) {},
                                  ),
                                  const SizedBox(width: 8),
                                  FilterChip(
                                    label: Text("Meditation"),
                                    onSelected: (value) {},
                                  ),
                                  const SizedBox(width: 8),
                                  FilterChip(
                                    label: Text("sleep story"),
                                    onSelected: (value) {},
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        if (compltedData.isNotEmpty)
                          StaggeredGrid.count(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            children: compltedData.map((data) {
                              return GestureDetector(
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: data is MindfulnessExcericesModel
                                        ? AppColors.primaryGreen
                                        : data is SleepExcericesModel
                                        ? AppColors.primaryPurple
                                        : AppColors.primaryBlack.withOpacity(
                                            0.6,
                                          ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data.name,
                                          style: ApptextTiles.titleStyle
                                              .copyWith(
                                                color: AppColors.primaryWhite,
                                              ),
                                        ),
                                        Text(
                                          data.category,
                                          style: ApptextTiles.bodyStyle
                                              .copyWith(
                                                color: AppColors.primaryBlack
                                                    .withOpacity(0.5),
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                        Text(
                                          "${data.duration} minits",
                                          style: ApptextTiles.bodyStyle
                                              .copyWith(
                                                color: AppColors.primaryBlack
                                                    .withOpacity(0.5),
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                        Text(
                                          data.description,
                                          style: ApptextTiles.bodyStyle
                                              .copyWith(
                                                color: AppColors.primaryWhite
                                                    .withOpacity(0.5),
                                                fontWeight: FontWeight.bold,
                                              ),
                                          maxLines:
                                              (data.description.length / 2)
                                                  .toInt(),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
