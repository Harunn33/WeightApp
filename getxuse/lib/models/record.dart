class Record {
  final int weight;
  final DateTime dateTime;
  final String? note;
  final String? photoUrl;
  Record(
      {required this.weight, required this.dateTime, this.note, this.photoUrl});
}
