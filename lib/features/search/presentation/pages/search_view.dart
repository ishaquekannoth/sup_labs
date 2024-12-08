import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10.w),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      enabled:
                          context.watch<SearchBloc>().state is! SearchLoading,
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search products...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                      onSubmitted: (_) => _performSearch(),
                    ),
                  ),
                  SizedBox(width: 10.w),
                ],
              ),
            ),
            // Results Section
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
                                  childAspectRatio: 200 / 240,
                                  crossAxisCount: 2),
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
                        child: ElevatedButton(
                          onPressed: () {
                            context
                                .read<SearchBloc>()
                                .add(const SearchLoadProducts());
                          },
                          child: const Text("Fetch"),
                        ),
                      );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
