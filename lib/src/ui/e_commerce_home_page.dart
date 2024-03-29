import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_ecom/src/provider/shop_result_provider.dart';
import 'package:riverpod_ecom/src/provider/sort_filter_provider.dart';
import 'package:riverpod_ecom/src/ui/e_commerce_filter_page.dart';
import '../enums/enum_sort_by.dart';
import '../model/shop_results.dart';

class EcommerceHomePage extends ConsumerWidget {
  EcommerceHomePage({Key? key}) : super(key: key);
  RangeValues rangeValue = RangeValues(0.0, 300);
  var _tmp = [false, false, false];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text("Results for \"Mackbook\""),
        leading: const Icon(Icons.chevron_left),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.shopping_bag,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 72,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: Colors.grey[100]),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        enableDrag: false,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (context) => Container(
                          height: 320,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                            ),
                          ),
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "SORT BY",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Consumer(builder: (context, ref, _) {
                                final sort = ref.watch(sortFilterProvider);
                                return Column(
                                  children: [
                                    RadioListTile<EnumSortBy>(
                                        value: EnumSortBy.recommended,
                                        groupValue: sort,
                                        title: const Text(
                                          "Recommended",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        controlAffinity:
                                            ListTileControlAffinity.trailing,
                                        activeColor: Colors.black,
                                        onChanged: (v) {
                                          ref
                                                  .watch(sortFilterProvider
                                                      .notifier)
                                                  .state =
                                              v ?? EnumSortBy.recommended;
                                          Navigator.of(context).pop();
                                        }),
                                    RadioListTile<EnumSortBy>(
                                      value: EnumSortBy.recentlyAdded,
                                      groupValue: sort,
                                      title: const Text(
                                        "Recently Added",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      activeColor: Colors.black,
                                      controlAffinity:
                                          ListTileControlAffinity.trailing,
                                      onChanged: (v) {
                                        ref
                                            .watch(sortFilterProvider.notifier)
                                            .state = v ?? EnumSortBy.recentlyAdded;
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    RadioListTile<EnumSortBy>(
                                      value: EnumSortBy.priceLowToHigh,
                                      groupValue: sort,
                                      title: const Text(
                                        "Price: Low to High",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      activeColor: Colors.black,
                                      controlAffinity:
                                          ListTileControlAffinity.trailing,
                                      onChanged: (v) {
                                        ref
                                                .watch(sortFilterProvider.notifier)
                                                .state =
                                            v ?? EnumSortBy.priceLowToHigh;
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    RadioListTile<EnumSortBy>(
                                      value: EnumSortBy.priceHighToLow,
                                      groupValue: sort,
                                      title: const Text(
                                        "Price: High to Low",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      activeColor: Colors.black,
                                      controlAffinity:
                                          ListTileControlAffinity.trailing,
                                      onChanged: (v) {
                                        ref
                                                .watch(sortFilterProvider.notifier)
                                                .state =
                                            v ?? EnumSortBy.priceHighToLow;
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    RadioListTile<EnumSortBy>(
                                      value: EnumSortBy.topRated,
                                      groupValue: sort,
                                      title: const Text(
                                        "Top rated",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      activeColor: Colors.black,
                                      controlAffinity:
                                          ListTileControlAffinity.trailing,
                                      onChanged: (v) {
                                        ref
                                            .watch(sortFilterProvider.notifier)
                                            .state = v ?? EnumSortBy.topRated;
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              })
                            ],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: Colors.grey[300]!,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.unfold_more),
                          const Text("Sort by"),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //       builder: (context) => ECommerceFilterPage()),
                      // );

                      showModalBottomSheet(
                          context: context,
                          enableDrag: false,
                          isScrollControlled: true,
                          backgroundColor: Colors.white,
                          builder: (context) => FractionallySizedBox(
                                heightFactor: 0.5,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Category",
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          Spacer(),
                                          Text(
                                            "View all",
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          IconButton(
                                              onPressed: () {},
                                              icon:
                                                  Icon(Icons.arrow_forward_ios))
                                        ],
                                      ),
                                      Divider(),
                                      Row(
                                        children: [
                                          Text(
                                            "Brand",
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          Spacer(),
                                          Text(
                                            "View all",
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          IconButton(
                                              onPressed: () {},
                                              icon:
                                                  Icon(Icons.arrow_forward_ios))
                                        ],
                                      ),
                                      SizedBox(
                                        child: Wrap(
                                          direction: Axis.horizontal,
                                          runSpacing: 6,
                                          spacing: 6,
                                          children: [
                                            InputChip(
                                              label: Text("Ardell"),
                                              labelStyle: TextStyle(
                                                color: Colors.white,
                                              ),
                                              backgroundColor: Colors.black,
                                              isEnabled: true,
                                              disabledColor: Colors.grey,
                                              selectedColor: Colors.black,
                                              deleteIcon: Icon(
                                                Icons.check,
                                                size: 14,
                                              ),
                                              deleteIconColor: Colors.white,
                                              onDeleted: () {
                                                print("onDeleted");
                                              },
                                              onSelected: (b) {
                                                print("onSelected");
                                                // setState(() {});
                                              },
                                              selected: _tmp[0],
                                            ),
                                            InputChip(
                                              label: Text("bareMinerals"),
                                              labelStyle: TextStyle(
                                                color: Colors.white,
                                              ),
                                              backgroundColor: Colors.black,
                                              isEnabled: true,
                                              disabledColor: Colors.grey,
                                              selectedColor: Colors.black,
                                              deleteIcon: Icon(
                                                Icons.check,
                                                size: 14,
                                              ),
                                              deleteIconColor: Colors.white,
                                              onDeleted: () {
                                                print("delete");
                                              },
                                              onSelected: (b) {
                                                print("b");
                                                // setState(() {});
                                              },
                                              selected: _tmp[1],
                                            ),
                                            InputChip(
                                              label: Text("Clate"),
                                              labelStyle: TextStyle(
                                                color: Colors.white,
                                              ),
                                              backgroundColor: Colors.black,
                                              isEnabled: true,
                                              disabledColor: Colors.grey,
                                              selectedColor: Colors.black,
                                              deleteIcon: Icon(
                                                Icons.check,
                                                size: 14,
                                              ),
                                              deleteIconColor: Colors.white,
                                              onDeleted: () {
                                                print("onDeleted");
                                              },
                                              onSelected: (b) {
                                                print("onSelected");
                                                // setState(() {});
                                              },
                                              selected: _tmp[2],
                                            )
                                          ],
                                        ),
                                      ),
                                      ExpansionTile(
                                        title: Text("Color"),
                                        initiallyExpanded: true,
                                        children: [
                                          SizedBox(
                                            height: 64,
                                            child: ListView.builder(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemBuilder: (context, index) {
                                                  if (index == 0) {
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 8),
                                                      child: InputChip(
                                                        label: Text(
                                                          "Gray",
                                                        ),
                                                        selectedColor:
                                                            Colors.black,
                                                        labelStyle: TextStyle(
                                                          color: Colors.white,
                                                        ),
                                                        backgroundColor:
                                                            Colors.black,
                                                        avatar: CircleAvatar(
                                                          backgroundColor:
                                                              Colors.grey,
                                                        ),
                                                        onSelected: (s) {},
                                                        onDeleted: () {},
                                                        deleteIconColor:
                                                            Colors.white,
                                                      ),
                                                    );
                                                  }
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 8),
                                                    child: ChoiceChip(
                                                      label: Text("Black"),
                                                      selected: false,
                                                      avatar: CircleAvatar(
                                                        backgroundColor:
                                                            Colors.black,
                                                      ),
                                                      shape: StadiumBorder(
                                                          side: BorderSide()),
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      onSelected: (b) {},
                                                    ),
                                                  );
                                                }),
                                          ),
                                        ],
                                      ),
                                      ExpansionTile(
                                        title: Text("Price Range"),
                                        trailing: Text(
                                            "\$${rangeValue.start.toStringAsFixed(0)}-${rangeValue.end.toStringAsFixed(0)}"),
                                        initiallyExpanded: true,
                                        children: [
                                          RangeSlider(
                                              activeColor: Colors.black,
                                              inactiveColor: Colors.grey,
                                              min: 0,
                                              max: 300,
                                              values: rangeValue,
                                              onChanged: (s) {
                                                rangeValue = s;
                                              })
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ));
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: Colors.grey[300]!,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.filter_list),
                          const Text("Filter"),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            height: 0,
            color: Colors.grey,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Consumer(builder: (context, ref, _) {
                AsyncValue<List<ShopResult>> items =
                    ref.watch(shopResultProvider);
                return items.when(
                    data: (datas) {
                      return GridView.builder(
                        itemCount: datas.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 5 / 8,
                        ),
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: const BoxDecoration(
                                // color: Colors.blue,
                                ),
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 6,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey[400],
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Positioned(
                                          left: 0,
                                          right: 0,
                                          bottom: 0,
                                          top: 0,
                                          child: Image.network(
                                            "${datas[index].img}",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Positioned(
                                          left: 0,
                                          right: 0,
                                          bottom: 0,
                                          top: 0,
                                          child: Container(
                                            color: (datas[index].isSoldOut ??
                                                    false)
                                                ? Colors.black.withOpacity(0.5)
                                                : Colors.transparent,
                                          ),
                                        ),
                                        Positioned(
                                          left: 48,
                                          right: 48,
                                          child: (datas[index].isSoldOut ??
                                                  false)
                                              ? Align(
                                                  alignment: Alignment.center,
                                                  child: Container(
                                                    padding: const EdgeInsets
                                                        .symmetric(vertical: 4),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4),
                                                        color: Colors.white),
                                                    child: const Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text("SOLD OUT"),
                                                    ),
                                                  ),
                                                )
                                              : Container(),
                                        ),
                                        Positioned(
                                            right: 2,
                                            top: 2,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                              ),
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: (datas[index].isSoldOut ??
                                                        false)
                                                    ? const Icon(
                                                        Icons
                                                            .notifications_outlined,
                                                      )
                                                    : const Icon(
                                                        Icons.favorite_border,
                                                      ),
                                              ),
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    children: [
                                      Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                                text:
                                                    datas[index].vendor ?? "-"),
                                            TextSpan(
                                              children: [
                                                TextSpan(
                                                    text: datas[index].name ??
                                                        "-"),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text("\$ ${datas[index].price}"),
                                          Text("\$ ${datas[index].price}"),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      );
                    },
                    error: (e, s) {
                      return Center(
                        child: Text("$e, $s"),
                      );
                    },
                    loading: () => const Center(
                          child: CircularProgressIndicator(),
                        ));
              }),
            ),
          )
        ],
      ),
    );
  }
}
