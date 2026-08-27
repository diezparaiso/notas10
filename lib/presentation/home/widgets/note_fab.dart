import 'package:flutter/material.dart';

import '../../../core/theme/app_durations.dart';

/// FAB de HomeScreen. En esta fase light solo expone la acción
/// de "nota de texto" — las acciones de audio y foto se añaden
/// cuando se implementen esas fases (ver guia-coherencia-desarrollo-light.md).
class NoteFab extends StatefulWidget {
  const NoteFab({super.key, required this.onCreateTextNote});

  final VoidCallback onCreateTextNote;

  @override
  State<NoteFab> createState() => _NoteFabState();
}

class _NoteFabState extends State<NoteFab> {
  double _scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _scale = 0.92),
      onTapUp: (_) => setState(() => _scale = 1.0),
      onTapCancel: () => setState(() => _scale = 1.0),
      child: AnimatedScale(
        scale: _scale,
        duration: AppDurations.fast,
        curve: AppDurations.defaultCurve,
        child: FloatingActionButton(
          onPressed: widget.onCreateTextNote,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}