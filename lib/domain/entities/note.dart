/// Entidad de dominio que representa una nota.
///
/// Incluye todos los campos definidos en la sección 5 de
/// guia-coherencia-desarrollo.md, aunque en la fase light la UI
/// solo lea/escriba [title] y [body]. Los campos [isPinned],
/// [isArchived] y [colorTag] se dejan ya definidos para no tener
/// que tocar esta entidad cuando lleguen sus fases correspondientes.
class Note {
  final int id;
  final String? title;
  final String body;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isPinned;
  final bool isArchived;
  final int? colorTag;

  const Note({
    required this.id,
    this.title,
    required this.body,
    required this.createdAt,
    required this.updatedAt,
    this.isPinned = false,
    this.isArchived = false,
    this.colorTag,
  });

  Note copyWith({
    int? id,
    String? title,
    String? body,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isPinned,
    bool? isArchived,
    int? colorTag,
  }) {
    return Note(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isPinned: isPinned ?? this.isPinned,
      isArchived: isArchived ?? this.isArchived,
      colorTag: colorTag ?? this.colorTag,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Note &&
        other.id == id &&
        other.title == title &&
        other.body == body &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.isPinned == isPinned &&
        other.isArchived == isArchived &&
        other.colorTag == colorTag;
  }

  @override
  int get hashCode => Object.hash(
        id,
        title,
        body,
        createdAt,
        updatedAt,
        isPinned,
        isArchived,
        colorTag,
      );
}