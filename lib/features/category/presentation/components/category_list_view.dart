import 'package:homeservice/config/injector/injector_config.dart';
import 'package:homeservice/core/components/draggable_sheet_widget.dart';
import 'package:homeservice/core/components/text_form_field.dart';
import 'package:homeservice/core/extensions/context_extension.dart';
import 'package:homeservice/core/helpers/common_helpers.dart';
import 'package:homeservice/core/routes/route_exports.dart';
import 'package:homeservice/core/utils/app_images.dart';
import 'package:homeservice/core/utils/app_palettes.dart';
import 'package:homeservice/core/utils/dimens.dart';
import 'package:homeservice/core/utils/sizedBox.dart';
import 'package:homeservice/features/category/domain/entities/category_entity.dart';

class ViewMoreCategory extends StatelessWidget {
  final List<CategoryEntity> data;
  final double size;
  const ViewMoreCategory({super.key, required this.data, required this.size});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonHelpers.buildIconsContainer(
          onTap: () {
            showModalBottomSheet(
              context: context,
              backgroundColor: AppPalettes.transparentColor,
              isScrollControlled: true,
              builder: (context) => _CategoriesBottomSheet(allCategories: data),
            );
          },

          iconSize: size,
          radius: Dimens.radiusX2,
          color: AppPalettes.primaryColor.withOpacityExt(0.2),
          padding: Dimens.allPaddingX3,
          child: Text(
            "View more",
            maxLines: 2,
            textAlign: TextAlign.center,
            style: context.textTheme.bodyMedium?.copyWith(fontWeight: .w700),
          ),
        ),
      ],
    );
  }
}

class _CategoriesBottomSheet extends StatefulWidget {
  final List<CategoryEntity> allCategories;

  const _CategoriesBottomSheet({required this.allCategories});

  @override
  State<_CategoriesBottomSheet> createState() => _CategoriesBottomSheetState();
}

class _CategoriesBottomSheetState extends State<_CategoriesBottomSheet> {
  late TextEditingController _searchController;
  late List<CategoryEntity> _filteredCategories;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _filteredCategories = List.from(widget.allCategories);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String? text) {
    setState(() {
      if (text?.isEmpty == true) {
        _filteredCategories = List.from(widget.allCategories);
      } else {
        final searchQuery = text?.trim().toLowerCase();
        _filteredCategories = widget.allCategories.where((category) {
          return category.name.toString().toLowerCase().contains(
            searchQuery ?? "",
          );
        }).toList();
      }
    });
  }

  void _onCategoryTap(CategoryEntity category) {
    serviceLocater<GoRouter>().pushNamed(
      AppRoute.categoryDetails.pathName,
      pathParameters: {'id': category.id},
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return DraggableSheetWidget(
      size: 0.7,
      radius: Dimens.radiusX5,
      showClose: true,
      indicatorcolor: AppPalettes.primaryColor,
      title: Flexible(
        child: Text(
          "Find the Professional You Need Right Now",
          style: textTheme.titleLarge?.copyWith(fontWeight: .w700),
        ),
      ),
      child: Column(
        children: [
          SizeBox.sizeHX4,
          CommonTextFormField(
            controller: _searchController,
            prefixIcon: CommonHelpers.buildIcons(
              path: AppImages.searchIcon,
              iconSize: Dimens.scaleX3,
              padding: EdgeInsets.only(
                left: Dimens.allPaddingX4,
                right: Dimens.allPaddingX1B,
              ),
            ),
            hintText: "Search for Professionals...",
            onChanged: _onSearchChanged,
          ),
          SizeBox.sizeHX4,
          _filteredCategories.isEmpty
              ? Center(
                  child: Text(
                    "No categories found",
                    style: textTheme.titleMedium,
                  ),
                )
              : ListView.separated(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: _filteredCategories.length,
                  separatorBuilder: (context, index) =>
                      Divider(color: AppPalettes.greyColor),
                  itemBuilder: (context, index) {
                    final category = _filteredCategories[index];
                    return GestureDetector(
                      onTap: () => _onCategoryTap(category),
                      child: Row(
                        spacing: Dimens.gapX3,
                        children: [
                          CommonHelpers.buildNetworkIcons(
                            iconSize: Dimens.scaleX6,
                            radius: Dimens.radiusX2,
                            color: AppPalettes.primaryColor.withOpacityExt(0.2),
                            path: category.icon.toString(),
                          ),
                          Expanded(
                            child: Text(
                              category.name.toString(),
                              style: textTheme.bodyLarge?.copyWith(
                                fontWeight: .w500,
                              ),
                            ),
                          ),
                          SizeBox.sizeWX2,
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: AppPalettes.blackColor,
                            size: Dimens.scaleX2,
                          ),
                        ],
                      ),
                    );
                  },
                ),
        ],
      ),
    );
  }
}
