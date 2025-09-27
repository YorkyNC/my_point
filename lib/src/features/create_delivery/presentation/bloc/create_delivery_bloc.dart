import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:my_point/src/features/airport/domain/models/airport.dart';
import 'package:my_point/src/features/airport/domain/repositories/airport_repository_impl.dart';
import 'package:my_point/src/features/create_delivery/domain%20/enum/item_type.dart';

part 'create_delivery_bloc.freezed.dart';
part 'create_delivery_event.dart';
part 'create_delivery_state.dart';

@injectable
class CreateDeliveryBloc extends Bloc<CreateDeliveryEvent, CreateDeliveryState> {
  final AirportRepositoryImpl _airportRepository;

  CreateDeliveryBloc(this._airportRepository) : super(CreateDeliveryState()) {
    setupHandlers();
    add(CreateDeliveryStarted());
  }

  void setupHandlers() {
    on<CreateDeliveryStarted>(_onCreateDeliveryStarted);
    on<CreateDeliveryItemTypeSelected>(_onCreateDeliveryItemTypeSelected);
    on<CreateDeliveryResetSelection>(_onCreateDeliveryResetSelection);
    on<CreateDeliveryDateSelected>(_onCreateDeliveryDateSelected);
    on<CreateDeliveryPriceChanged>(_onCreateDeliveryPriceChanged);
    on<CreateDeliveryLoadAirports>(_onCreateDeliveryLoadAirports);
    on<CreateDeliveryFromAirportSelected>(_onCreateDeliveryFromAirportSelected);
    on<CreateDeliveryToAirportSelected>(_onCreateDeliveryToAirportSelected);
    on<CreateDeliveryRecipientSelected>(_onCreateDeliveryRecipientSelected);
  }

  void _onCreateDeliveryStarted(CreateDeliveryStarted event, Emitter<CreateDeliveryState> emit) {
    emit(state.copyWith(
      selectedItemType: null,
      itemTypes: ItemType.values.toList(),
      price: 0,
      priceError: null,
    ));
  }

  void _onCreateDeliveryItemTypeSelected(CreateDeliveryItemTypeSelected event, Emitter<CreateDeliveryState> emit) {
    emit(state.copyWith(selectedItemType: event.itemType));
  }

  void _onCreateDeliveryResetSelection(CreateDeliveryResetSelection event, Emitter<CreateDeliveryState> emit) {
    emit(state.copyWith(selectedItemType: null));
  }

  void _onCreateDeliveryDateSelected(CreateDeliveryDateSelected event, Emitter<CreateDeliveryState> emit) {
    emit(state.copyWith(selectedDate: event.date));
  }

  void _onCreateDeliveryPriceChanged(CreateDeliveryPriceChanged event, Emitter<CreateDeliveryState> emit) {
    final priceText = event.price.trim();

    if (priceText.isEmpty) {
      emit(state.copyWith(
        price: 0,
        priceError: null,
      ));
      return;
    }

    final price = int.tryParse(priceText);

    if (price == null) {
      emit(state.copyWith(
        price: 0,
        priceError: 'Введите корректную сумму',
      ));
      return;
    }

    if (price < 5000) {
      emit(state.copyWith(
        price: price,
        priceError: 'Минимальная сумма 5000 ₸',
      ));
      return;
    }

    emit(state.copyWith(
      price: price,
      priceError: null,
    ));
  }

  void _onCreateDeliveryLoadAirports(CreateDeliveryLoadAirports event, Emitter<CreateDeliveryState> emit) async {
    emit(state.copyWith(isLoadingAirports: true));

    try {
      final airports = await _airportRepository.getAirports();
      emit(state.copyWith(
        airports: airports,
        isLoadingAirports: false,
      ));
    } catch (e) {
      emit(state.copyWith(isLoadingAirports: false));
    }
  }

  void _onCreateDeliveryFromAirportSelected(
      CreateDeliveryFromAirportSelected event, Emitter<CreateDeliveryState> emit) {
    emit(state.copyWith(fromAirport: event.airport));
  }

  void _onCreateDeliveryToAirportSelected(CreateDeliveryToAirportSelected event, Emitter<CreateDeliveryState> emit) {
    emit(state.copyWith(toAirport: event.airport));
  }

  void _onCreateDeliveryRecipientSelected(CreateDeliveryRecipientSelected event, Emitter<CreateDeliveryState> emit) {
    emit(state.copyWith(
      recipientName: event.name,
      recipientPhone: event.phone,
    ));
  }
}
