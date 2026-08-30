import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/theme/app_durations.dart';
import '../../presentation/home/home_screen.dart';
import '../../presentation/note_editor/note_editor_screen.dart';

part 'app_router.g.dart';

/// Rutas activas en la fase light: home y noteEditor.
/// El resto de constantes de AppRoutes ya existen para fases
/// posteriores, pero no se registran aquí todavía.
class AppRoutes {
  AppRoutes._();

  static const home = 'home';
  static const noteEditor = 'noteEditor';
  static const search = 'search';
  static const imageViewer = 'imageViewer';
  static const trash = 'trash';
  static const settings = 'settings';
}

@riverpod
GoRouter appRouter(Ref ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: AppRoutes.home,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const HomeScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: AppDurations.medium,
        ),
      ),
      GoRoute(
        path: '/note-editor',
        name: AppRoutes.noteEditor,
        pageBuilder: (context, state) {
          final noteId = state.extra as int?;
          return CustomTransitionPage(
            key: state.pageKey,
            child: NoteEditorScreen(noteId: noteId),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              final slideAnimation = Tween<Offset>(
                begin: const Offset(0, 0.05),
                end: Offset.zero,
              ).animate(CurvedAnimation(
                parent: animation,
                curve: AppDurations.defaultCurve,
              ));
              return FadeTransition(
                opacity: animation,
                child: SlideTransition(position: slideAnimation, child: child),
              );
            },
            transitionDuration: AppDurations.medium,
          );
        },
      ),
    ],
  );
}