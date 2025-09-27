import 'package:flutter_bloc/flutter_bloc.dart';

// Events
abstract class CalendarEvent {}

class InitializeCalendar extends CalendarEvent {
  final DateTime firstDay;
  final DateTime lastDay;
  final DateTime? initialSelectedDate;
  final List<DateTime>? initialSelectedDates;
  final Map<DateTime, bool>? disabledDates;
  final bool selectable;
  final bool multiSelect;

  InitializeCalendar({
    required this.firstDay,
    required this.lastDay,
    this.initialSelectedDate,
    this.initialSelectedDates,
    this.disabledDates,
    this.selectable = false,
    this.multiSelect = false,
  });
}

class DateTapped extends CalendarEvent {
  final DateTime date;

  DateTapped(this.date);
}

class ScrollToMonth extends CalendarEvent {
  final DateTime month;

  ScrollToMonth(this.month);
}

class ClearSelection extends CalendarEvent {}

// States
abstract class CalendarState {}

class CalendarInitial extends CalendarState {}

class CalendarLoaded extends CalendarState {
  final List<DateTime> visibleMonths;
  final int currentMonthIndex;
  final DateTime? selectedDate;
  final List<DateTime> selectedDates;
  final Map<DateTime, bool> disabledDates;
  final bool selectable;
  final bool multiSelect;

  CalendarLoaded({
    required this.visibleMonths,
    required this.currentMonthIndex,
    this.selectedDate,
    required this.selectedDates,
    required this.disabledDates,
    required this.selectable,
    required this.multiSelect,
  });

  CalendarLoaded copyWith({
    List<DateTime>? visibleMonths,
    int? currentMonthIndex,
    DateTime? selectedDate,
    List<DateTime>? selectedDates,
    Map<DateTime, bool>? disabledDates,
    bool? selectable,
    bool? multiSelect,
  }) {
    return CalendarLoaded(
      visibleMonths: visibleMonths ?? this.visibleMonths,
      currentMonthIndex: currentMonthIndex ?? this.currentMonthIndex,
      selectedDate: selectedDate ?? this.selectedDate,
      selectedDates: selectedDates ?? this.selectedDates,
      disabledDates: disabledDates ?? this.disabledDates,
      selectable: selectable ?? this.selectable,
      multiSelect: multiSelect ?? this.multiSelect,
    );
  }
}

// Bloc
class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  CalendarBloc() : super(CalendarInitial()) {
    on<InitializeCalendar>(_onInitialize);
    on<DateTapped>(_onDateTapped);
    on<ScrollToMonth>(_onScrollToMonth);
    on<ClearSelection>(_onClearSelection);
  }

  void _onInitialize(InitializeCalendar event, Emitter<CalendarState> emit) {
    final visibleMonths = _buildVisibleMonths(event.firstDay, event.lastDay);
    final currentMonth = DateTime.now();
    final currentMonthIndex = visibleMonths.indexWhere(
      (month) => month.year == currentMonth.year && month.month == currentMonth.month,
    );

    emit(CalendarLoaded(
      visibleMonths: visibleMonths,
      currentMonthIndex: currentMonthIndex != -1 ? currentMonthIndex : 0,
      selectedDate: event.initialSelectedDate,
      selectedDates: event.initialSelectedDates ?? [],
      disabledDates: event.disabledDates ?? {},
      selectable: event.selectable,
      multiSelect: event.multiSelect,
    ));
  }

  void _onDateTapped(DateTapped event, Emitter<CalendarState> emit) {
    final currentState = state;
    if (currentState is! CalendarLoaded) return;

    if (!currentState.selectable) return;

    if (currentState.multiSelect) {
      final newSelectedDates = List<DateTime>.from(currentState.selectedDates);
      if (newSelectedDates.any((date) => _isSameDate(date, event.date))) {
        newSelectedDates.removeWhere((date) => _isSameDate(date, event.date));
      } else {
        newSelectedDates.add(event.date);
      }

      emit(currentState.copyWith(selectedDates: newSelectedDates));
    } else {
      emit(currentState.copyWith(
        selectedDate: event.date,
        selectedDates: [event.date],
      ));
    }
  }

  void _onScrollToMonth(ScrollToMonth event, Emitter<CalendarState> emit) {
    final currentState = state;
    if (currentState is! CalendarLoaded) return;

    final monthIndex = currentState.visibleMonths.indexWhere(
      (month) => month.year == event.month.year && month.month == event.month.month,
    );

    if (monthIndex != -1) {
      emit(currentState.copyWith(currentMonthIndex: monthIndex));
    }
  }

  void _onClearSelection(ClearSelection event, Emitter<CalendarState> emit) {
    final currentState = state;
    if (currentState is! CalendarLoaded) return;

    emit(currentState.copyWith(
      selectedDate: null,
      selectedDates: [],
    ));
  }

  List<DateTime> _buildVisibleMonths(DateTime firstDay, DateTime lastDay) {
    final List<DateTime> visibleMonths = [];
    DateTime current = DateTime(firstDay.year, firstDay.month);
    final DateTime end = DateTime(lastDay.year, lastDay.month);

    while (!current.isAfter(end)) {
      visibleMonths.add(current);
      current = DateTime(current.year, current.month + 1);
    }

    return visibleMonths;
  }

  bool _isSameDate(DateTime date1, DateTime date2) {
    return date1.year == date2.year && date1.month == date2.month && date1.day == date2.day;
  }

  bool isDateSelected(DateTime date) {
    final currentState = state;
    if (currentState is! CalendarLoaded) return false;

    return currentState.selectedDates.any((selectedDate) => _isSameDate(selectedDate, date));
  }

  bool isDateDisabled(DateTime date) {
    final currentState = state;
    if (currentState is! CalendarLoaded) return false;

    final dateKey = DateTime(date.year, date.month, date.day);
    return currentState.disabledDates.containsKey(dateKey) && currentState.disabledDates[dateKey] == true;
  }
}
