void toggleSelection<T>({required List<T> selectedItems, required T item}) {
  if (selectedItems.contains(item)) {
    selectedItems.remove(item);
  } else {
    selectedItems.add(item);
  }
}
