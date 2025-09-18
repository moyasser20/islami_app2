class MoshafEntity {
  final int id;
  final String name;
  final String? server;
  final int? surahTotal;
  final int? moshafType;
  final List<int>? surahList;

  const MoshafEntity({
    required this.id,
    required this.name,
     this.server,
     this.surahTotal,
     this.moshafType,
     this.surahList,
  });
}