import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tam/models/api/schedule.dart';
import 'package:tam/services/api/tam_api_service.dart';

final tamApiProvider = Provider((ref) => TamApiService());

final scheduleProvider = FutureProvider.family<Schedule, Map<String, String>>((
  ref,
  params,
) async {
  final api = ref.read(tamApiProvider);
  return await api.getSchedule(
    params['station']!,
    params['line']!,
    params['direction']!,
  );
});

class SchedulePage extends ConsumerWidget {
  final String station;
  final String line;
  final String direction;

  const SchedulePage({
    Key? key,
    required this.station,
    required this.line,
    required this.direction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scheduleAsync = ref.watch(
      scheduleProvider({
        'station': station,
        'line': line,
        'direction': direction,
      }),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Horaires - Ligne $line'),
        backgroundColor: Colors.blueAccent,
      ),
      body: scheduleAsync.when(
        data:
            (schedule) => ListView.builder(
              itemCount: schedule.schedule.length,
              itemBuilder: (context, index) {
                final hour = schedule.schedule.keys.elementAt(index);
                final minutes = schedule.schedule[hour]!;

                return ListTile(
                  title: Text('Heure: $hour h'),
                  subtitle: Text('Minutes: ${minutes.join(', ')}'),
                  leading: Icon(Icons.access_time, color: Colors.blue),
                );
              },
            ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error:
            (err, stack) => Center(
              child: Text(
                'Erreur lors du chargement des horaires : $err',
                style: const TextStyle(color: Colors.red, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
      ),
    );
  }
}
