import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sup_labs_task/features/search/presentation/bloc/search_bloc.dart';
import 'package:sup_labs_task/features/search/presentation/widgets/product_card.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              switch (state) {
                case SearchInitial():
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            context
                                .read<SearchBloc>()
                                .add(const SearchEventFireSearch(keyWord: ""));
                          },
                          child: const Text("Fetch")),
                    ],
                  );
                case SearchLoading():
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case SearchSuccess():
                  return Column(
                    children: List.generate(state.products.length,
                        (index) => ProductCard(product: state.products[index])),
                  );
                case SearchFailure():
                  return const Center(
                    child: Icon(Icons.error),
                  );
              }
            },
          ),
        ),
      ),
    );
  }
}
