
import 'dart:io';

import 'package:four_face_frontend/repository/matching.dart';
import 'package:four_face_frontend/repository/offers.dart';
import 'package:four_face_frontend/repository/search.dart';
import 'package:four_face_frontend/repository/talklist.dart';
import 'package:four_face_frontend/repository/user.dart';

void main() async {
  TalkListsNotifier a = TalkListsNotifier();
  globalJwt = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJJRCI6Inp2dnBkdHpmIiwibmFtZSI6Ilx1MzA1Ylx1MzA0ZFx1MzA1MFx1MzA2MSIsImplbmRlciI6Ilx1NzUzN1x1NjAyNyIsImJpcnRoZGF5Ijo5MzU3OTg0MDB9.3NIdxSw-uoXo2xLYYF8eAJwTL_bgH0vQshATs7MFCIQn3InxKe1Fgz1EBXt5SwnWG5b_YWmc2yQciJg4CqZFF8DDP2idvL_zZsw8htKfeBqkRHn0enDY1Tqm4DtpWxM13yxYYYVE52v7nsBRbIHGqmAPC5bGU0GPGvEhc9iIeY1FdmngG-quHdkhB4oT8kMtlQx7s7bUduwZrwQQ0-AtNk5UwslehhPytq4e28fhLcCqMzQq-eJMhdS1vuD9KlSFrtdN1pqB_PZGVxvl4IG4NwGU_5FQN73S1VRxVBkvvlPpEXoQu8169airzi8cbjeSgYoE8fO4Nw1hDrbFx_7DEA";
  await a.init();
  exit(0);
}