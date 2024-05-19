enum ItemType {
  FOLDER, // Папка
  DOC, // Гугл документ
  FILE, // Просто файл
  SHEETS, // Гугл таблица
  PRESENTATION, // Гугл презентация
  UNKNOWN; // Неизвестно
}

ItemType itemTypeFromString(String type) {
  switch (type) {
    case 'FOLDER':
      return ItemType.FOLDER;
    case 'DOC':
      return ItemType.DOC;
    case 'FILE':
      return ItemType.FILE;
    case 'SHEETS':
      return ItemType.SHEETS;
    case 'PRESENTATION':
      return ItemType.PRESENTATION;
    default:
      return ItemType.UNKNOWN;
  }
}

String itemTypeToString(ItemType type) {
  return type.toString().split('.').last;
}
