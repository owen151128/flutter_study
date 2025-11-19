import 'package:bucket_list/screens/create/create_page_notifiers.dart';
import 'package:bucket_list/screens/home/home_page_notifiers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'models/bucket.dart';

final bucketListProvider = NotifierProvider<BucketListNotifier, List<Bucket>>(
  () => BucketListNotifier(),
);

final textFieldErrorMessageProvider =
    NotifierProvider<TextFieldErrorMessageNotifier, String?>(
      () => TextFieldErrorMessageNotifier(),
    );

final textEditingControllerProvider = Provider((_) => TextEditingController());
