extension ListUpdate<T> on List<T> {
  List<T> update(
      {required int index,
      required T updatedItem,
      required List<T> currentList}) {
    List<T> list = [];
    list.addAll(currentList);
    list[index] = updatedItem;
    return list;
  }
}
