class ParamUtils{
  Map<String,String> _map = Map();
  ParamUtils add(String,dynamic){
    _map[String] = dynamic.toString();
    return this;
  }
  get params=>_map;
}