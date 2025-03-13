import 'package:dio/dio.dart';
import 'package:tam/models/api/line.dart';
import 'package:tam/models/api/next_tram.dart';
import 'package:tam/models/api/schedule.dart';

class TamApiService {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://tam.alexis-mateo.fr'));

  Future<Schedule> getSchedule(
    String station,
    String line,
    String direction,
  ) async {
    final response = await _dio.get('/stop/schedule/$station/$line/$direction');
    return Schedule.fromJson(response.data);
  }

  Future<List<NextTram>> getNextTrams(
    String station, {
    String? line,
    String? destination,
  }) async {
    final response = await _dio.get(
      '/stop/next/$station',
      queryParameters: {
        if (line != null) 'line': line,
        if (destination != null) 'destination': destination,
      },
    );
    return (response.data as List)
        .map((tram) => NextTram.fromJson(tram))
        .toList();
  }

  Future<Line> getLineInfo(String line, String direction) async {
    final response = await _dio.get('/line/$line/$direction');
    return Line.fromJson(response.data);
  }
}
