import 'dart:ui';

import '../../core/values/colors.dart';

enum StatusSession {
  pending,
  accepted,
  rejected,
  noResponse,
  ignored,
  reminded,
  closed,
}

List<StatusSession> listStatusSession = [
  StatusSession.pending,
  StatusSession.accepted,
  StatusSession.rejected,
  StatusSession.noResponse,
  StatusSession.ignored,
  StatusSession.reminded,
  StatusSession.closed,
];

Color getColor(StatusSession? status) {
  switch (status) {
    case StatusSession.accepted:
      return greenLight;
    case StatusSession.rejected:
      return red;
    case StatusSession.ignored:
      return darkOrange;
    case StatusSession.noResponse:
      return white50;
    case StatusSession.pending:
      return black;
    case StatusSession.reminded:
      return black;
    case StatusSession.closed:
      return primaryColor;
    default:
      return black;
  }
}
