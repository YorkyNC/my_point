import 'package:injectable/injectable.dart';

import '../../domain/models/airport.dart';
import '../../domain/repositories/airport_repository_impl.dart';

@LazySingleton(as: AirportRepositoryImpl)
class MockAirportRepository implements AirportRepositoryImpl {
  @override
  Future<List<Airport>> getAirports() async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    return [
      const Airport(
        id: '1',
        name: 'Алматы Аэропорт',
        code: 'ALA',
        city: 'Алматы',
        country: 'Казахстан',
      ),
      const Airport(
        id: '2',
        name: 'Нур-Султан Назарбаев Аэропорт',
        code: 'NUR',
        city: 'Нур-Султан',
        country: 'Казахстан',
      ),
      const Airport(
        id: '3',
        name: 'Шымкент Аэропорт',
        code: 'CIT',
        city: 'Шымкент',
        country: 'Казахстан',
      ),
      const Airport(
        id: '4',
        name: 'Актобе Аэропорт',
        code: 'AKX',
        city: 'Актобе',
        country: 'Казахстан',
      ),
      const Airport(
        id: '5',
        name: 'Атырау Аэропорт',
        code: 'GUW',
        city: 'Атырау',
        country: 'Казахстан',
      ),
      const Airport(
        id: '6',
        name: 'Москва Домодедово',
        code: 'DME',
        city: 'Москва',
        country: 'Россия',
      ),
      const Airport(
        id: '7',
        name: 'Стамбул Аэропорт',
        code: 'IST',
        city: 'Стамбул',
        country: 'Турция',
      ),
      const Airport(
        id: '8',
        name: 'Дубай Международный',
        code: 'DXB',
        city: 'Дубай',
        country: 'ОАЭ',
      ),
    ];
  }
}
