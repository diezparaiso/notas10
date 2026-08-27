/// Devuelve una fecha relativa legible ("hace 2h", "ayer", etc.)
/// a partir de un DateTime, usada en NoteCard.
String formatRelativeDate(DateTime date) {
  final now = DateTime.now();
  final diff = now.difference(date);

  if (diff.inMinutes < 1) return 'ahora';
  if (diff.inMinutes < 60) return 'hace ${diff.inMinutes}m';
  if (diff.inHours < 24) return 'hace ${diff.inHours}h';
  if (diff.inDays == 1) return 'ayer';
  if (diff.inDays < 7) return 'hace ${diff.inDays}d';

  return '${date.day}/${date.month}/${date.year}';
}