import 'package:flightdeck/app/flightdeck/domain/entities/gallery_template.dart';
import 'package:flightdeck/app/flightdeck/ui/widgets/gallery_panel.dart';
import 'package:flightdeck/app/core/ui/themes/themes.dart';
import 'package:flightdeck/i18n/strings.g.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

void main() {
  testWidgets('renders one card per template and fires onCreate on tap', (
    tester,
  ) async {
    GalleryTemplate? created;
    await tester.pumpWidget(
      TranslationProvider(
        child: ShadcnApp(
          theme: buildTheme(brightness: Brightness.dark),
          home: Scaffold(child: GalleryPanel(onCreate: (t) => created = t)),
        ),
      ),
    );
    await tester.pump();

    for (final t in GalleryTemplate.values) {
      expect(find.byKey(ValueKey('gallery-${t.name}')), findsOneWidget);
    }
    expect(find.text('.kanban'), findsOneWidget);

    await tester.tap(find.byKey(const ValueKey('gallery-kanban')));
    await tester.pump();
    expect(created, GalleryTemplate.kanban);
  });
}
