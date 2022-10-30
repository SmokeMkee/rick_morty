import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson3/bloc/persons/bloc_persons.dart';
import 'package:lesson3/constants/app_styles.dart';
import '../../bloc/persons/states.dart';
import '../../generated/l10n.dart';
import '../widgets/not_found_widget.dart';
import '../widgets/search_field.dart';
import 'widgets/is_grid_view.dart';
import 'widgets/is_list_view.dart';

enum ViewType { grid, list }

class PersonScreen extends StatelessWidget {
  const PersonScreen({Key? key}) : super(key: key);

  static final isListView = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SearchField(
                onChanged: (value) {
                  BlocProvider.of<BlocPersons>(context).add(
                    EventPersonsFilterByName(value),
                  );
                },
                title: S.of(context).searchPerson,
              ),
              BlocBuilder<BlocPersons, StateBlocPersons>(
                builder: (context, state) {
                  var personsTotal = 0;
                  if (state is StatePersonData) {
                    personsTotal = state.data.length;
                  }
                  return Row(
                    children: [
                      Expanded(
                        child: Text(
                          S.of(context).countPersons + personsTotal.toString(),
                          style: AppStyles.s210w500,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.grid_view,
                          size: 30,
                        ),
                        onPressed: () {
                          isListView.value = !isListView.value;
                        },
                      ),
                    ],
                  );
                },
              ),
              BlocBuilder<BlocPersons, StateBlocPersons>(
                builder: (context, state) {
                  return state.map(
                    initial: (_) => const SizedBox.shrink(),
                    loading: (_) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    data: (state) {
                      if (state.data.isEmpty) {
                        return Row(
                          children: [Text(S.of(context).listIsEmpty)],
                        );
                      } else {
                        return ValueListenableBuilder<bool>(
                          valueListenable: isListView,
                          builder: (context, isListViewMode, _) {
                            return isListViewMode
                                ? IsListView(itemList: state.data)
                                : IsGridView(itemList: state.data);
                          },
                        );
                      }
                    },
                    error: (error) {
                      return NotFoundWidget(
                        notFoundText: S.of(context).characterNotFound,
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
