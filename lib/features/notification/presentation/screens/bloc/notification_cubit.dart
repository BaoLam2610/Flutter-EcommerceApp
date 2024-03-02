import '../../../../../core/core.dart';

part 'notification_state.dart';

class NotificationCubit extends BaseCubit<NotificationState> {
  NotificationCubit() : super(NotificationState(status: Initialize()));
}
