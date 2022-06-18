

import 'package:riverpod/riverpod.dart';

import '../enums/enum_sort_by.dart';

final sortFilterProvider = StateProvider<EnumSortBy>((ref)=> EnumSortBy.recommended);