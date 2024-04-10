import 'package:go_router/go_router.dart';
import 'package:planet_protector/pages/organization_register_page.dart';
import 'package:planet_protector/pages/preferences_survey_page.dart';
import 'package:planet_protector/pages/volunteer_register_page.dart';

import '../pages/main_page.dart';
import '../pages/publication_page.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'root',
      builder: (_, __) => const MainPage(),
      routes: [
        GoRoute(
          path: 'person_register',
          name: 'person_register',
          builder: (_, __) => const VolunteerRegisterPage(),
          routes: [
            GoRoute(
              path: 'preferences_survey',
              name: 'preferences_survey',
              builder: (_, __) => const PreferencesSurveyPage(),
            ),
          ],
        ),
        GoRoute(
          path: 'organization_register',
          name: 'organization_register',
          builder: (_, __) => const OrganizationRegisterPage(),
        ),
        GoRoute(
          path: 'publication',
          name: 'publication',
          builder: (_, __) => const PublicationPage(),
        ),
      ],
    ),
  ],
);