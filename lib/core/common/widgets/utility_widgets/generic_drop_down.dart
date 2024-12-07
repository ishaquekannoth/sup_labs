
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sup_labs_task/core/common/extensions/generic_declarations.dart';

class GenericDropDown<T extends ChoiceItem> extends StatelessWidget {
  GenericDropDown({
    super.key,
    required this.dropDownObjects,
    this.onSelected,
    this.initialState,
    this.height,
    this.borderRadius,
    this.padding,
    this.label,
    this.expandinset,
  }) : assert(dropDownObjects.isNotEmpty);
  final WidgetDataExporterNullable<T> onSelected;
  final List<T> dropDownObjects;
  final double? height;
  final T? initialState;
  final BorderRadius? borderRadius;
  final EdgeInsets? padding;
  final EdgeInsets? expandinset;
  final String? label;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      child: DropdownMenu<T>(
        label: label != null ? Text(label!) : null,
        trailingIcon: Icon(
          Icons.arrow_drop_down,
          size: 22.h,
        ),
        selectedTrailingIcon: Icon(
          Icons.arrow_drop_up,
          size: 22.h,
        ),
        enableSearch: true,
        menuHeight: 200.h,
        expandedInsets: expandinset,
        width: 185.w,
        inputDecorationTheme: InputDecorationTheme(
            contentPadding: const EdgeInsets.only(bottom: 10, left: 15),
            border: OutlineInputBorder(
                gapPadding: 0,
                borderRadius: borderRadius ?? BorderRadius.circular(10.r),
                borderSide: const BorderSide(color: Colors.black))),
        initialSelection: initialState ?? dropDownObjects.first,
        onSelected: onSelected,
        dropdownMenuEntries:
            dropDownObjects.map<DropdownMenuEntry<T>>((T state) {
          return DropdownMenuEntry<T>(
            value: state,
            label: state.name,
            enabled: true,
            style: MenuItemButton.styleFrom(
              foregroundColor: Colors.black,
            ),
          );
        }).toList(),
      ),
    );
  }
}

class CustomDropDown<T extends ChoiceItem> extends StatefulWidget {
  final List<T> dropDownObjects;
  final WidgetDataExporterNullable<T> onSelected;
  final T? initialState;
  final double? height;
  final BorderRadius? borderRadius;
  final EdgeInsets? padding;

  const CustomDropDown({
    super.key,
    required this.dropDownObjects,
    required this.onSelected,
    this.initialState,
    this.height,
    this.borderRadius,
    this.padding,
  });

  @override
  State<CustomDropDown<T>> createState() => _CustomDropDownState<T>();
}

class _CustomDropDownState<T extends ChoiceItem>
    extends State<CustomDropDown<T>> {
  late T selectedItem;
  bool isDropdownOpen = false;

  @override
  void initState() {
    super.initState();
    selectedItem = widget.initialState ?? widget.dropDownObjects.first;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("I recieve my Salary"),
          GestureDetector(
            onTap: () {
              setState(() {
                isDropdownOpen = !isDropdownOpen;
              });
            },
            child: Container(
              height: widget.height ?? 60.h,
              padding: widget.padding ?? EdgeInsets.symmetric(horizontal: 8.w),
              decoration: BoxDecoration(
                borderRadius: widget.borderRadius ?? BorderRadius.circular(8.r),
                border: Border.all(color: Colors.black),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    selectedItem.name,
                    style: TextStyle(fontSize: 16.sp, color: Colors.black),
                  ),
                  Icon(
                    isDropdownOpen
                        ? Icons.arrow_drop_up
                        : Icons.arrow_drop_down,
                    size: 22.h,
                  ),
                ],
              ),
            ),
          ),
          if (isDropdownOpen)
            Container(
              constraints: BoxConstraints(maxHeight: 200.h),
              decoration: BoxDecoration(
                borderRadius: widget.borderRadius ?? BorderRadius.circular(8.r),
                border: Border.all(color: Colors.black),
                color: Colors.white,
              ),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: widget.dropDownObjects.length,
                itemBuilder: (context, index) {
                  T item = widget.dropDownObjects[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedItem = item;
                        isDropdownOpen = false;
                      });
                      widget.onSelected!(item);
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
                      decoration: BoxDecoration(
                        color: selectedItem == item
                            ? Colors.grey[300]
                            : Colors.transparent,
                      ),
                      child: Text(
                        item.name,
                        style: TextStyle(fontSize: 16.sp, color: Colors.black),
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}

abstract class ChoiceItem {
  final String name;
  ChoiceItem({
    required this.name,
  });
  @override
  String toString() {
    return name;
  }
}
