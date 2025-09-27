import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';
import 'package:my_point/src/features/create_delivery/presentation/bloc/calendar_bloc.dart';

class CustomCalendar extends StatelessWidget {
  final DateTime firstDay;
  final DateTime lastDay;
  final DateTime? initialSelectedDate;
  final List<DateTime>? initialSelectedDates;
  final Function(DateTime)? onDateSelected;
  final Function(List<DateTime>)? onMultiDateSelected;
  final Function(DateTime)? onTapDate;
  final Map<DateTime, bool>? disabledDates;
  final bool selectable;
  final bool multiSelect;

  const CustomCalendar({
    super.key,
    required this.firstDay,
    required this.lastDay,
    this.initialSelectedDate,
    this.initialSelectedDates,
    this.onDateSelected,
    this.onMultiDateSelected,
    this.onTapDate,
    this.disabledDates,
    this.selectable = false,
    this.multiSelect = false,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CalendarBloc()
        ..add(
          InitializeCalendar(
            firstDay: firstDay,
            lastDay: lastDay,
            initialSelectedDate: initialSelectedDate,
            initialSelectedDates: initialSelectedDates,
            disabledDates: disabledDates,
            selectable: selectable,
            multiSelect: multiSelect,
          ),
        ),
      child: CustomCalendarView(
        onDateSelected: onDateSelected,
        onMultiDateSelected: onMultiDateSelected,
        onTapDate: onTapDate,
      ),
    );
  }
}

class CustomCalendarView extends StatefulWidget {
  final Function(DateTime)? onDateSelected;
  final Function(List<DateTime>)? onMultiDateSelected;
  final Function(DateTime)? onTapDate;

  const CustomCalendarView({super.key, this.onDateSelected, this.onMultiDateSelected, this.onTapDate});

  @override
  CustomCalendarViewState createState() => CustomCalendarViewState();
}

class CustomCalendarViewState extends State<CustomCalendarView> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  void _handleDateTap(DateTime date) {
    final bloc = context.read<CalendarBloc>();
    bloc.add(DateTapped(date));

    if (widget.onTapDate != null) {
      widget.onTapDate!(date);
    }

    // Remove the automatic selection logic - only preview the date
    // Don't call onDateSelected here
  }

  bool _isDateSelected(DateTime date) {
    final bloc = context.read<CalendarBloc>();
    return bloc.isDateSelected(date);
  }

  bool _isDateDisabled(DateTime date) {
    final bloc = context.read<CalendarBloc>();
    return bloc.isDateDisabled(date);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarBloc, CalendarState>(
      builder: (context, state) {
        if (state is CalendarLoaded) {
          return Column(
            children: [
              Expanded(
                child: Container(
                  color: context.colors.white,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    controller: _scrollController,
                    itemCount: state.visibleMonths.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: _buildMonthSection(state.visibleMonths[index]),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 16),
              if (state.selectedDate != null)
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // context.pop();
                          widget.onDateSelected!(state.selectedDate!);
                        },
                        child: Text(
                          'Выбрать дату',
                          style: context.typography.interText16.copyWith(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
              SizedBox(height: 16),
            ],
          );
        }
        return Container(
          color: context.colors.white,
          height: MediaQuery.of(context).size.height * 0.8,
          child: const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget _buildDayNamesRow() {
    final List<String> dayNames = ['Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб', 'Вс'];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: dayNames
            .map(
              (day) => Expanded(
                child: Text(
                  day.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: context.typography.interText14.copyWith(color: context.colors.gray),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _buildMonthSection(DateTime month) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: context.colors.gray100, borderRadius: BorderRadius.circular(12)),
      child: Column(children: [_buildMonthLabel(month), _buildDayNamesRow(), _buildCalendarGrid(month)]),
    );
  }

  Widget _buildMonthLabel(DateTime month) {
    final monthName = DateFormat("MMMM y").format(month);

    return Text(monthName.capitalize(), style: context.typography.inter14Bold.copyWith(color: context.colors.black));
  }

  Widget _buildCalendarGrid(DateTime month) {
    return Column(children: _buildCalendarRows(month));
  }

  List<Widget> _buildCalendarRows(DateTime month) {
    List<Widget> rows = [];

    final firstDayOfMonth = DateTime(month.year, month.month, 1);
    final lastDayOfMonth = DateTime(month.year, month.month + 1, 0);

    int firstWeekdayOfMonth = firstDayOfMonth.weekday;

    int daysInMonth = lastDayOfMonth.day;

    int day = 1;

    int rowCount = ((daysInMonth + firstWeekdayOfMonth - 1) / 7).ceil();

    for (int i = 0; i < rowCount; i++) {
      List<Widget> rowChildren = [];

      for (int j = 0; j < 7; j++) {
        if ((i == 0 && j < firstWeekdayOfMonth - 1) || (day > daysInMonth)) {
          // Empty cell
          rowChildren.add(Expanded(child: Container()));
        } else {
          final currentDate = DateTime(month.year, month.month, day);
          bool isWeekend = (j >= 5);
          bool isSelected = _isDateSelected(currentDate);
          bool isDisabled = _isDateDisabled(currentDate);

          rowChildren.add(
            Expanded(
              child: GestureDetector(
                onTap: isDisabled ? null : () => _handleDateTap(currentDate),
                child: _buildDayCell(day, isWeekend, isSelected, isDisabled, false),
              ),
            ),
          );
          day++;
        }
      }

      rows.add(
        Row(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.spaceAround, children: rowChildren),
      );
    }

    return rows;
  }

  Widget _buildDayCell(int day, bool isWeekend, bool isSelected, bool isDisabled, bool isToday) {
    return BlocBuilder<CalendarBloc, CalendarState>(
      builder: (context, state) {
        final selectable = state is CalendarLoaded ? state.selectable : false;
        return Container(
          height: 40,
          width: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? context.colors.blue : null,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            '$day',
            style: isSelected
                ? context.typography.interText12.copyWith(
                    color: selectable ? context.colors.white : context.colors.black,
                  )
                : context.typography.interText12.copyWith(
                    color: isDisabled
                        ? Colors.grey.shade300
                        : isWeekend
                            ? context.colors.gray500
                            : context.colors.black,
                  ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
