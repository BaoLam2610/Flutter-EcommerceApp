import '../../../../../core/bloc/base_bloc.dart';
import '../../../../../core/bloc/bloc_state.dart';

part 'notification_state.dart';

class NotificationCubit extends BaseCubit<NotificationState> {
  NotificationCubit() : super(NotificationState(status: Initialize()));
}
