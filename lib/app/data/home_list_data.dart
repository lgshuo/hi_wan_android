
/// articleFollowNum : 0
/// articleImgList : []
/// articleType : 1
/// author : "陈锐"
/// columns : "有研究"
/// comNum : 101
/// content : ""
/// contentText : ""
/// describes : "每年的11月，已经成为中国零售行业一年一度的决定性时段。商家的全年业绩中，由双11购物促销带动的销售占比正变得越来越重。 \n 在阿里巴巴平台，2020年的这一数值已接近7%。当年，天猫和淘宝在为期11天的“双11”购物节期间创造了4982亿元人民币的成交额（GMV）新纪录。而按照联合国贸易与发展会议报告的统计，阿里巴巴2020年的GMV总规模是11450亿美元（约合74654亿元人民币），全球第"
/// endTime : null
/// followNum : 21
/// iconImage : ""
/// isBuy : 0
/// isContainImg : 0
/// isDownload : 0
/// isFavorite : 0
/// isJournalFollow : 0
/// isPraise : 0
/// issn : ""
/// issue : 11
/// journalFollowNum : 536
/// journalReadNum : 7259
/// keywords : ""
/// lastArticle : null
/// magazineGuid : "BE43497A-FCCC-49C3-8E79-5A58E8632CB4"
/// magazineName : "第一财经"
/// magazinePoster : ""
/// nameicon : "http://images.icitycloud.com.cn/images/qikanapp/journalnamelogo/1572435042048.jpg"
/// nextArticle : null
/// poster : "http://img1.qikan.com.cn/qkimages/dycy/dycy202111/72_72/dycy20211113-1-s.jpg"
/// posterz : "http://img1.qikan.com.cn/qkimages/dycy/dycy202111/dycy20211113-1-l.jpg"
/// praiseNum : 0
/// price : 0.0
/// title : "电商代运营，伙伴的生意"
/// titleId : "dycy20211113"
/// versionH5Url : "http://m.qikan.cn/qikanH5/articleDetails.html?titleId=dycy20211113"
/// wordsize : 5952
/// year : 2021
class MainListData {
  MainListData({
    int? articleFollowNum,
    List<dynamic>? articleImgList,
    int? articleType,
    String? author,
    String? columns,
    int? comNum,
    String? content,
    String? contentText,
    String describes="",
    dynamic endTime,
    int? followNum,
    String? iconImage,
    int? isBuy,
    int? isContainImg,
    int? isDownload,
    int? isFavorite,
    int? isJournalFollow,
    int? isPraise,
    String? issn,
    int? issue,
    int? journalFollowNum,
    int? journalReadNum,
    String? keywords,
    dynamic lastArticle,
    String? magazineGuid,
    String? magazineName,
    String? magazinePoster,
    String nameicon="",
    dynamic nextArticle,
    String? poster,
    String posterz="",
    int? praiseNum,
    double? price,
    String title="",
    String? titleId,
    String? versionH5Url,
    int? wordsize,
    int? year,}){
    _articleFollowNum = articleFollowNum;
    _articleImgList = articleImgList;
    _articleType = articleType;
    _author = author;
    _columns = columns;
    _comNum = comNum;
    _content = content;
    _contentText = contentText;
    _describes = describes;
    _endTime = endTime;
    _followNum = followNum;
    _iconImage = iconImage;
    _isBuy = isBuy;
    _isContainImg = isContainImg;
    _isDownload = isDownload;
    _isFavorite = isFavorite;
    _isJournalFollow = isJournalFollow;
    _isPraise = isPraise;
    _issn = issn;
    _issue = issue;
    _journalFollowNum = journalFollowNum;
    _journalReadNum = journalReadNum;
    _keywords = keywords;
    _lastArticle = lastArticle;
    _magazineGuid = magazineGuid;
    _magazineName = magazineName;
    _magazinePoster = magazinePoster;
    _nameicon = nameicon;
    _nextArticle = nextArticle;
    _poster = poster;
    _posterz = posterz;
    _praiseNum = praiseNum;
    _price = price;
    _title = title;
    _titleId = titleId;
    _versionH5Url = versionH5Url;
    _wordsize = wordsize;
    _year = year;
  }

  MainListData.fromJson(dynamic json) {
    _articleFollowNum = json['articleFollowNum'];
    _articleType = json['articleType'];
    _author = json['author'];
    _columns = json['columns'];
    _comNum = json['comNum'];
    _content = json['content'];
    _contentText = json['contentText'];
    _describes = json['describes'];
    _endTime = json['endTime'];
    _followNum = json['followNum'];
    _iconImage = json['iconImage'];
    _isBuy = json['isBuy'];
    _isContainImg = json['isContainImg'];
    _isDownload = json['isDownload'];
    _isFavorite = json['isFavorite'];
    _isJournalFollow = json['isJournalFollow'];
    _isPraise = json['isPraise'];
    _issn = json['issn'];
    _issue = json['issue'];
    _journalFollowNum = json['journalFollowNum'];
    _journalReadNum = json['journalReadNum'];
    _keywords = json['keywords'];
    _lastArticle = json['lastArticle'];
    _magazineGuid = json['magazineGuid'];
    _magazineName = json['magazineName'];
    _magazinePoster = json['magazinePoster'];
    _nameicon = json['nameicon'];
    _nextArticle = json['nextArticle'];
    _poster = json['poster'];
    _posterz = json['posterz'];
    _praiseNum = json['praiseNum'];
    _price = json['price'];
    _title = json['title'];
    _titleId = json['titleId'];
    _versionH5Url = json['versionH5Url'];
    _wordsize = json['wordsize'];
    _year = json['year'];
  }
  int? _articleFollowNum;
  List<dynamic>? _articleImgList;
  int? _articleType;
  String? _author;
  String? _columns;
  int? _comNum;
  String? _content;
  String? _contentText;
  String _describes="";
  dynamic _endTime;
  int? _followNum;
  String? _iconImage;
  int? _isBuy;
  int? _isContainImg;
  int? _isDownload;
  int? _isFavorite;
  int? _isJournalFollow;
  int? _isPraise;
  String? _issn;
  int? _issue;
  int? _journalFollowNum;
  int? _journalReadNum;
  String? _keywords;
  dynamic _lastArticle;
  String? _magazineGuid;
  String? _magazineName;
  String? _magazinePoster;
  String _nameicon="";
  dynamic _nextArticle;
  String? _poster;
  String _posterz="";
  int? _praiseNum;
  double? _price;
  String _title="";
  String? _titleId;
  String? _versionH5Url;
  int? _wordsize;
  int? _year;

  int? get articleFollowNum => _articleFollowNum;
  List<dynamic>? get articleImgList => _articleImgList;
  int? get articleType => _articleType;
  String? get author => _author;
  String? get columns => _columns;
  int? get comNum => _comNum;
  String? get content => _content;
  String? get contentText => _contentText;
  String get describes => _describes;
  dynamic get endTime => _endTime;
  int? get followNum => _followNum;
  String? get iconImage => _iconImage;
  int? get isBuy => _isBuy;
  int? get isContainImg => _isContainImg;
  int? get isDownload => _isDownload;
  int? get isFavorite => _isFavorite;
  int? get isJournalFollow => _isJournalFollow;
  int? get isPraise => _isPraise;
  String? get issn => _issn;
  int? get issue => _issue;
  int? get journalFollowNum => _journalFollowNum;
  int? get journalReadNum => _journalReadNum;
  String? get keywords => _keywords;
  dynamic get lastArticle => _lastArticle;
  String? get magazineGuid => _magazineGuid;
  String? get magazineName => _magazineName;
  String? get magazinePoster => _magazinePoster;
  String get nameicon => _nameicon;
  dynamic get nextArticle => _nextArticle;
  String? get poster => _poster;
  String get posterz => _posterz;
  int? get praiseNum => _praiseNum;
  double? get price => _price;
  String get title => _title;
  String? get titleId => _titleId;
  String? get versionH5Url => _versionH5Url;
  int? get wordsize => _wordsize;
  int? get year => _year;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['articleFollowNum'] = _articleFollowNum;
    if (_articleImgList != null) {
      map['articleImgList'] = _articleImgList?.map((v) => v.toJson()).toList();
    }
    map['articleType'] = _articleType;
    map['author'] = _author;
    map['columns'] = _columns;
    map['comNum'] = _comNum;
    map['content'] = _content;
    map['contentText'] = _contentText;
    map['describes'] = _describes;
    map['endTime'] = _endTime;
    map['followNum'] = _followNum;
    map['iconImage'] = _iconImage;
    map['isBuy'] = _isBuy;
    map['isContainImg'] = _isContainImg;
    map['isDownload'] = _isDownload;
    map['isFavorite'] = _isFavorite;
    map['isJournalFollow'] = _isJournalFollow;
    map['isPraise'] = _isPraise;
    map['issn'] = _issn;
    map['issue'] = _issue;
    map['journalFollowNum'] = _journalFollowNum;
    map['journalReadNum'] = _journalReadNum;
    map['keywords'] = _keywords;
    map['lastArticle'] = _lastArticle;
    map['magazineGuid'] = _magazineGuid;
    map['magazineName'] = _magazineName;
    map['magazinePoster'] = _magazinePoster;
    map['nameicon'] = _nameicon;
    map['nextArticle'] = _nextArticle;
    map['poster'] = _poster;
    map['posterz'] = _posterz;
    map['praiseNum'] = _praiseNum;
    map['price'] = _price;
    map['title'] = _title;
    map['titleId'] = _titleId;
    map['versionH5Url'] = _versionH5Url;
    map['wordsize'] = _wordsize;
    map['year'] = _year;
    return map;
  }

}