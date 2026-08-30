import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/app_strings.dart';
import 'note_editor_controller.dart';

/// Pantalla de crear/editar nota. Solo texto básico en esta fase
/// (título + cuerpo), guardado automático con debounce de 500ms.
class NoteEditorScreen extends ConsumerStatefulWidget {
  const NoteEditorScreen({super.key, this.noteId});

  final int? noteId;

  @override
  ConsumerState<NoteEditorScreen> createState() => _NoteEditorScreenState();
}

class _NoteEditorScreenState extends ConsumerState<NoteEditorScreen> {
  late final TextEditingController _titleController;
  late final TextEditingController _bodyController;
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _bodyController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  void _onChanged() {
    ref.read(noteEditorControllerProvider(widget.noteId).notifier).onFieldsChanged(
          title: _titleController.text,
          body: _bodyController.text,
        );
  }

  Future<void> _confirmDelete() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(AppStrings.dialogDeleteConfirmTitle),
        content: const Text(AppStrings.dialogDeleteConfirmBody),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text(AppStrings.btnDelete),
          ),
        ],
      ),
    );

    if (confirmed == true && mounted) {
      await ref
          .read(noteEditorControllerProvider(widget.noteId).notifier)
          .deleteNote();
      if (mounted) context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final noteAsync = ref.watch(noteEditorControllerProvider(widget.noteId));

    ref.listen(noteEditorControllerProvider(widget.noteId), (previous, next) {
      final note = next.value;
      if (note != null && !_initialized) {
        _titleController.text = note.title ?? '';
        _bodyController.text = note.body;
        _initialized = true;
      }
    });

    return Scaffold(
      appBar: AppBar(
        actions: [
          if (widget.noteId != null)
            IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed: _confirmDelete,
              tooltip: AppStrings.btnDelete,
            ),
        ],
      ),
      body: noteAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(
          child: Text('Error al cargar la nota: $error'),
        ),
        data: (_) {
          if (widget.noteId == null) _initialized = true;
          return SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: _titleController,
                    onChanged: (_) => _onChanged(),
                    style: Theme.of(context).textTheme.headlineSmall,
                    decoration: const InputDecoration(
                      hintText: AppStrings.noteTitleHint,
                      border: InputBorder.none,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _bodyController,
                    onChanged: (_) => _onChanged(),
                    maxLines: null,
                    minLines: 10,
                    style: Theme.of(context).textTheme.bodyLarge,
                    decoration: const InputDecoration(
                      hintText: AppStrings.noteBodyHint,
                      border: InputBorder.none,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}