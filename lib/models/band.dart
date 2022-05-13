class Band
{
  String id;
  String name;
  int votes;

  Band({
    required this.id,
    required this.name,
    required this.votes
  });

  
  /// factory
  /// 
  /// Los sockets desde el back me responden un mapa
  /// [Map] que es mas facil de usar, va a ser String y dinamico
  factory Band.fromMap(Map<String,dynamic>obj)=> Band(
    id:obj['id'],
    name:obj['name'],
    votes:obj['votes']
  );
}