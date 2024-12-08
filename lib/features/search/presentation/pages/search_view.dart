import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sup_labs_task/core/common/widgets/utility_widgets/generic_button.dart';
import 'package:sup_labs_task/core/themes/colors.dart';
import 'package:sup_labs_task/features/search/presentation/bloc/search_bloc.dart';
import 'package:sup_labs_task/features/search/presentation/widgets/product_card.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    context.read<SearchBloc>().add(const SearchLoadProducts());
    super.initState();
  }

  void _performSearch() {
    final keyWord = _searchController.text.trim();
    context.read<SearchBloc>().add(SearchEventLocalSearch(keyWord: keyWord));
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    log("message");
    return Scaffold(
      backgroundColor: AppColors.pearlWhite,
      appBar: AppBar(
        backgroundColor: AppColors.pearlWhite,
        title: TextField(
          onChanged: (value) {
            _performSearch();
          },
          enabled: context.watch<SearchBloc>().state is! SearchLoading &&
              context.watch<SearchBloc>().state is! SearchFailure,
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search products...',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 20.h),
          Expanded(
            child: BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                switch (state) {
                  case SearchInitial():
                    return const SizedBox.shrink();
                  case SearchLoading():
                    return SizedBox(
                      height: ScreenUtil().screenHeight,
                      width: ScreenUtil().screenWidth,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  case SearchSuccess():
                    return Container(
                      margin: EdgeInsets.only(top: 10.h, bottom: 20.h),
                      child: GridView.builder(
                        padding: const EdgeInsets.all(10),
                        itemCount: state.products.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 200 / 240, crossAxisCount: 2),
                        itemBuilder: (context, index) => ProductCard(
                          product: state.products[index],
                          onTap: (object) {
                            log(object.toString());
                          },
                          onFavourite: (object) {
                            context
                                .read<SearchBloc>()
                                .add(SearchToggleFavourite(product: object));
                          },
                        ),
                      ),
                    );
                  case SearchFailure():
                    return Center(
                      child: GenericButton(
                        buttonDimensions:
                            Size(ScreenUtil().screenWidth * 0.7, 60.h),
                        buttonData: "",
                        buttonTitle: "Loading failed..click to retry",
                      ),
                    );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
