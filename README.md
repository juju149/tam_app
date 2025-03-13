# TAM Montpellier

Une application Flutter permettant de consulter en temps réel les horaires et itinéraires des tramways de Montpellier, développée en architecture **MVVM** avec **Riverpod**, **Firebase** et une API personnalisée.

## Fonctionnalités
✅ Affichage des horaires de tramway en temps réel  
✅ Recherche rapide par station ou ligne  
✅ Vue d'ensemble des lignes de tramway  
✅ Détails sur les arrêts, horaires et itinéraires  
✅ Intégration Firebase pour des notifications et statistiques en temps réel  
✅ Architecture MVVM pour une application maintenable et propre

---

## Installation

1. **Cloner le dépôt**
```bash
git clone https://github.com/votre-projet/tam-montpellier.git
cd tam-montpellier
```

2. **Installer les dépendances**
```bash
flutter pub get
```

3. **Configurer Firebase**
- Crée ton projet Firebase
- Ajouter les fichiers `google-services.json` (Android) et `GoogleService-Info.plist` (iOS) dans les dossiers appropriés.

4. **Lancer l'application**
```bash
flutter run
```

---

## Architecture du projet

```
lib/
├── core/
│   ├── models/
│   │   ├── route.dart
│   │   ├── station.dart
│   └── schedule.dart
├── data/
│   ├── api/
│   │   └── tam_api_service.dart
├── repositories/
│   ├── transport_repository.dart
│   └── transport_repository_impl.dart
├── providers/
│   └── transport_provider.dart
├── viewmodels/
│   └── home_viewmodel.dart
├── views/
│   ├── home_page.dart
│   ├── schedule_page.dart
│   ├── components/
│   │   └── transport_card.dart
├── utils/
│   ├── constants.dart
│   ├── routes.dart
├── widgets/
│   ├── timetable_widget.dart
│   └── loading_widget.dart
└── main.dart
```

---

## Dépendances principales

- **[Riverpod](https://pub.dev/packages/riverpod)** : Gestion d'état efficace et optimale
- **[Firebase](https://firebase.google.com/)** : Authentification, Firestore, et plus
- **[Dio](https://pub.dev/packages/dio)** : Gestion des requêtes API performante

---

## Utilisation des Providers (Riverpod)

Exemple de provider pour récupérer les horaires des tramways :

```dart
final transportSchedulesProvider = FutureProvider.family<List<TransportSchedule>, String>((ref, stationId) {
  final repository = ref.watch(transportRepositoryProvider);
  return repository.fetchSchedules(stationId);
});
```

---

## Exemple d'utilisation dans l'UI

```dart
class TimetableWidget extends ConsumerWidget {
  final String stationId;

  const TimetableWidget({Key? key, required this.stationId}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final schedules = ref.watch(transportSchedulesProvider(stationId));

    return schedules.when(
      data: (data) => ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          final schedule = data[index];
          return ListTile(
            title: Text(schedule.line),
            subtitle: Text('${schedule.destination} à ${schedule.arrivalTime}'),
          );
        },
      ),
      loading: () => CircularProgressIndicator(),
      error: (error, _) => Text('Erreur: $error'),
    );
  }
}
```

---

## Roadmap
- [ ] Ajouter les horaires de bus
- [ ] Implémenter la géolocalisation en temps réel
- [ ] Intégrer des notifications pour les alertes de trafic
- [ ] Améliorer le design avec Flutter animations

---

## Contributions

Les contributions sont les bienvenues ! Si vous souhaitez participer, veuillez suivre ces étapes :
1. Forker le projet
2. Créer une branche (ex: `feature/ajout-notifications`)
3. Soumettre une pull request

---

## Contact

Pour toute question ou suggestion, contactez-moi :  
**Julien - 6UHT SAS**  
📧 [Email](mailto:contact@6uht.com)  
📱 [Instagram](https://instagram.com/station13game)