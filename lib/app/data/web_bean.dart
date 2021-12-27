class WebBean {
  WebBean({
      this.articleFollowNum, 
      this.articleImgList, 
      this.articleType, 
      this.author, 
      this.columns, 
      this.comNum, 
      this.content, 
      this.contentText, 
      this.describes, 
      this.endTime, 
      this.followNum, 
      this.iconImage, 
      this.isBuy, 
      this.isContainImg, 
      this.isDownload, 
      this.isFavorite, 
      this.isJournalFollow, 
      this.isPraise, 
      this.issn, 
      this.issue, 
      this.journalFollowNum, 
      this.journalReadNum, 
      this.keywords, 
      this.lastArticle, 
      this.magazineGuid, 
      this.magazineName, 
      this.magazinePoster, 
      this.nameicon, 
      this.nextArticle, 
      this.poster, 
      this.posterz, 
      this.praiseNum, 
      this.price, 
      this.title, 
      this.titleId, 
      this.versionH5Url, 
      this.wordsize, 
      this.year,});

  WebBean.fromJson(dynamic json) {
    articleFollowNum = json['articleFollowNum'];
    if (json['articleImgList'] != null) {
      articleImgList = [];
      json['articleImgList'].forEach((v) {
        articleImgList?.add(ArticleImgList.fromJson(v));
      });
    }
    articleType = json['articleType'];
    author = json['author'];
    columns = json['columns'];
    comNum = json['comNum'];
    content = json['content'];
    contentText = json['contentText'];
    describes = json['describes'];
    endTime = json['endTime'];
    followNum = json['followNum'];
    iconImage = json['iconImage'];
    isBuy = json['isBuy'];
    isContainImg = json['isContainImg'];
    isDownload = json['isDownload'];
    isFavorite = json['isFavorite'];
    isJournalFollow = json['isJournalFollow'];
    isPraise = json['isPraise'];
    issn = json['issn'];
    issue = json['issue'];
    journalFollowNum = json['journalFollowNum'];
    journalReadNum = json['journalReadNum'];
    keywords = json['keywords'];
    lastArticle = json['lastArticle'] != null ? LastArticle.fromJson(json['lastArticle']) : null;
    magazineGuid = json['magazineGuid'];
    magazineName = json['magazineName'];
    magazinePoster = json['magazinePoster'];
    nameicon = json['nameicon'];
    nextArticle = json['nextArticle'] != null ? NextArticle.fromJson(json['nextArticle']) : null;
    poster = json['poster'];
    posterz = json['posterz'];
    praiseNum = json['praiseNum'];
    price = json['price'];
    title = json['title'];
    titleId = json['titleId'];
    versionH5Url = json['versionH5Url'];
    wordsize = json['wordsize'];
    year = json['year'];
  }
  int? articleFollowNum;
  List<ArticleImgList>? articleImgList;
  int? articleType;
  String? author;
  String? columns;
  int? comNum;
  String? content;
  String? contentText;
  String? describes;
  dynamic endTime;
  int? followNum;
  String? iconImage;
  int? isBuy;
  int? isContainImg;
  int? isDownload;
  int? isFavorite;
  int? isJournalFollow;
  int? isPraise;
  String? issn;
  int? issue;
  int? journalFollowNum;
  int? journalReadNum;
  String? keywords;
  LastArticle? lastArticle;
  String? magazineGuid;
  String? magazineName;
  String? magazinePoster;
  String? nameicon;
  NextArticle? nextArticle;
  String? poster;
  String? posterz;
  int? praiseNum;
  double? price;
  String? title;
  String? titleId;
  String? versionH5Url;
  int? wordsize;
  int? year;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['articleFollowNum'] = articleFollowNum;
    if (articleImgList != null) {
      map['articleImgList'] = articleImgList?.map((v) => v.toJson()).toList();
    }
    map['articleType'] = articleType;
    map['author'] = author;
    map['columns'] = columns;
    map['comNum'] = comNum;
    map['content'] = content;
    map['contentText'] = contentText;
    map['describes'] = describes;
    map['endTime'] = endTime;
    map['followNum'] = followNum;
    map['iconImage'] = iconImage;
    map['isBuy'] = isBuy;
    map['isContainImg'] = isContainImg;
    map['isDownload'] = isDownload;
    map['isFavorite'] = isFavorite;
    map['isJournalFollow'] = isJournalFollow;
    map['isPraise'] = isPraise;
    map['issn'] = issn;
    map['issue'] = issue;
    map['journalFollowNum'] = journalFollowNum;
    map['journalReadNum'] = journalReadNum;
    map['keywords'] = keywords;
    if (lastArticle != null) {
      map['lastArticle'] = lastArticle?.toJson();
    }
    map['magazineGuid'] = magazineGuid;
    map['magazineName'] = magazineName;
    map['magazinePoster'] = magazinePoster;
    map['nameicon'] = nameicon;
    if (nextArticle != null) {
      map['nextArticle'] = nextArticle?.toJson();
    }
    map['poster'] = poster;
    map['posterz'] = posterz;
    map['praiseNum'] = praiseNum;
    map['price'] = price;
    map['title'] = title;
    map['titleId'] = titleId;
    map['versionH5Url'] = versionH5Url;
    map['wordsize'] = wordsize;
    map['year'] = year;
    return map;
  }

}

class NextArticle {
  NextArticle({
      this.articleFollowNum, 
      this.articleImgList, 
      this.articleType, 
      this.author, 
      this.columns, 
      this.comNum, 
      this.content, 
      this.contentText, 
      this.describes, 
      this.endTime, 
      this.followNum, 
      this.iconImage, 
      this.isBuy, 
      this.isContainImg, 
      this.isDownload, 
      this.isFavorite, 
      this.isJournalFollow, 
      this.isPraise, 
      this.issn, 
      this.issue, 
      this.journalFollowNum, 
      this.journalReadNum, 
      this.keywords, 
      this.lastArticle, 
      this.magazineGuid, 
      this.magazineName, 
      this.magazinePoster, 
      this.nameicon, 
      this.nextArticle, 
      this.poster, 
      this.posterz, 
      this.praiseNum, 
      this.price, 
      this.title, 
      this.titleId, 
      this.versionH5Url, 
      this.wordsize, 
      this.year,});

  NextArticle.fromJson(dynamic json) {
    articleFollowNum = json['articleFollowNum'];
    if (json['articleImgList'] != null) {
      articleImgList = [];

    }
    articleType = json['articleType'];
    author = json['author'];
    columns = json['columns'];
    comNum = json['comNum'];
    content = json['content'];
    contentText = json['contentText'];
    describes = json['describes'];
    endTime = json['endTime'];
    followNum = json['followNum'];
    iconImage = json['iconImage'];
    isBuy = json['isBuy'];
    isContainImg = json['isContainImg'];
    isDownload = json['isDownload'];
    isFavorite = json['isFavorite'];
    isJournalFollow = json['isJournalFollow'];
    isPraise = json['isPraise'];
    issn = json['issn'];
    issue = json['issue'];
    journalFollowNum = json['journalFollowNum'];
    journalReadNum = json['journalReadNum'];
    keywords = json['keywords'];
    lastArticle = json['lastArticle'];
    magazineGuid = json['magazineGuid'];
    magazineName = json['magazineName'];
    magazinePoster = json['magazinePoster'];
    nameicon = json['nameicon'];
    nextArticle = json['nextArticle'];
    poster = json['poster'];
    posterz = json['posterz'];
    praiseNum = json['praiseNum'];
    price = json['price'];
    title = json['title'];
    titleId = json['titleId'];
    versionH5Url = json['versionH5Url'];
    wordsize = json['wordsize'];
    year = json['year'];
  }
  int? articleFollowNum;
  List<dynamic>? articleImgList;
  int? articleType;
  String? author;
  String? columns;
  int? comNum;
  String? content;
  String? contentText;
  String? describes;
  dynamic endTime;
  int? followNum;
  String? iconImage;
  int? isBuy;
  int? isContainImg;
  int? isDownload;
  int? isFavorite;
  int? isJournalFollow;
  int? isPraise;
  String? issn;
  int? issue;
  int? journalFollowNum;
  int? journalReadNum;
  String? keywords;
  dynamic lastArticle;
  String? magazineGuid;
  String? magazineName;
  String? magazinePoster;
  String? nameicon;
  dynamic nextArticle;
  String? poster;
  String? posterz;
  int? praiseNum;
  double? price;
  String? title;
  String? titleId;
  String? versionH5Url;
  int? wordsize;
  int? year;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['articleFollowNum'] = articleFollowNum;
    if (articleImgList != null) {
      map['articleImgList'] = articleImgList?.map((v) => v.toJson()).toList();
    }
    map['articleType'] = articleType;
    map['author'] = author;
    map['columns'] = columns;
    map['comNum'] = comNum;
    map['content'] = content;
    map['contentText'] = contentText;
    map['describes'] = describes;
    map['endTime'] = endTime;
    map['followNum'] = followNum;
    map['iconImage'] = iconImage;
    map['isBuy'] = isBuy;
    map['isContainImg'] = isContainImg;
    map['isDownload'] = isDownload;
    map['isFavorite'] = isFavorite;
    map['isJournalFollow'] = isJournalFollow;
    map['isPraise'] = isPraise;
    map['issn'] = issn;
    map['issue'] = issue;
    map['journalFollowNum'] = journalFollowNum;
    map['journalReadNum'] = journalReadNum;
    map['keywords'] = keywords;
    map['lastArticle'] = lastArticle;
    map['magazineGuid'] = magazineGuid;
    map['magazineName'] = magazineName;
    map['magazinePoster'] = magazinePoster;
    map['nameicon'] = nameicon;
    map['nextArticle'] = nextArticle;
    map['poster'] = poster;
    map['posterz'] = posterz;
    map['praiseNum'] = praiseNum;
    map['price'] = price;
    map['title'] = title;
    map['titleId'] = titleId;
    map['versionH5Url'] = versionH5Url;
    map['wordsize'] = wordsize;
    map['year'] = year;
    return map;
  }

}

class LastArticle {
  LastArticle({
      this.articleFollowNum, 
      this.articleImgList, 
      this.articleType, 
      this.author, 
      this.columns, 
      this.comNum, 
      this.content, 
      this.contentText, 
      this.describes, 
      this.endTime, 
      this.followNum, 
      this.iconImage, 
      this.isBuy, 
      this.isContainImg, 
      this.isDownload, 
      this.isFavorite, 
      this.isJournalFollow, 
      this.isPraise, 
      this.issn, 
      this.issue, 
      this.journalFollowNum, 
      this.journalReadNum, 
      this.keywords, 
      this.lastArticle, 
      this.magazineGuid, 
      this.magazineName, 
      this.magazinePoster, 
      this.nameicon, 
      this.nextArticle, 
      this.poster, 
      this.posterz, 
      this.praiseNum, 
      this.price, 
      this.title, 
      this.titleId, 
      this.versionH5Url, 
      this.wordsize, 
      this.year,});

  LastArticle.fromJson(dynamic json) {
    articleFollowNum = json['articleFollowNum'];
    if (json['articleImgList'] != null) {
      articleImgList = [];
    }
    articleType = json['articleType'];
    author = json['author'];
    columns = json['columns'];
    comNum = json['comNum'];
    content = json['content'];
    contentText = json['contentText'];
    describes = json['describes'];
    endTime = json['endTime'];
    followNum = json['followNum'];
    iconImage = json['iconImage'];
    isBuy = json['isBuy'];
    isContainImg = json['isContainImg'];
    isDownload = json['isDownload'];
    isFavorite = json['isFavorite'];
    isJournalFollow = json['isJournalFollow'];
    isPraise = json['isPraise'];
    issn = json['issn'];
    issue = json['issue'];
    journalFollowNum = json['journalFollowNum'];
    journalReadNum = json['journalReadNum'];
    keywords = json['keywords'];
    lastArticle = json['lastArticle'];
    magazineGuid = json['magazineGuid'];
    magazineName = json['magazineName'];
    magazinePoster = json['magazinePoster'];
    nameicon = json['nameicon'];
    nextArticle = json['nextArticle'];
    poster = json['poster'];
    posterz = json['posterz'];
    praiseNum = json['praiseNum'];
    price = json['price'];
    title = json['title'];
    titleId = json['titleId'];
    versionH5Url = json['versionH5Url'];
    wordsize = json['wordsize'];
    year = json['year'];
  }
  int? articleFollowNum;
  List<dynamic>? articleImgList;
  int? articleType;
  String? author;
  String? columns;
  int? comNum;
  String? content;
  String? contentText;
  String? describes;
  dynamic endTime;
  int? followNum;
  String? iconImage;
  int? isBuy;
  int? isContainImg;
  int? isDownload;
  int? isFavorite;
  int? isJournalFollow;
  int? isPraise;
  String? issn;
  int? issue;
  int? journalFollowNum;
  int? journalReadNum;
  String? keywords;
  dynamic lastArticle;
  String? magazineGuid;
  String? magazineName;
  String? magazinePoster;
  String? nameicon;
  dynamic nextArticle;
  String? poster;
  String? posterz;
  int? praiseNum;
  double? price;
  String? title;
  String? titleId;
  String? versionH5Url;
  int? wordsize;
  int? year;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['articleFollowNum'] = articleFollowNum;
    if (articleImgList != null) {
      map['articleImgList'] = articleImgList?.map((v) => v.toJson()).toList();
    }
    map['articleType'] = articleType;
    map['author'] = author;
    map['columns'] = columns;
    map['comNum'] = comNum;
    map['content'] = content;
    map['contentText'] = contentText;
    map['describes'] = describes;
    map['endTime'] = endTime;
    map['followNum'] = followNum;
    map['iconImage'] = iconImage;
    map['isBuy'] = isBuy;
    map['isContainImg'] = isContainImg;
    map['isDownload'] = isDownload;
    map['isFavorite'] = isFavorite;
    map['isJournalFollow'] = isJournalFollow;
    map['isPraise'] = isPraise;
    map['issn'] = issn;
    map['issue'] = issue;
    map['journalFollowNum'] = journalFollowNum;
    map['journalReadNum'] = journalReadNum;
    map['keywords'] = keywords;
    map['lastArticle'] = lastArticle;
    map['magazineGuid'] = magazineGuid;
    map['magazineName'] = magazineName;
    map['magazinePoster'] = magazinePoster;
    map['nameicon'] = nameicon;
    map['nextArticle'] = nextArticle;
    map['poster'] = poster;
    map['posterz'] = posterz;
    map['praiseNum'] = praiseNum;
    map['price'] = price;
    map['title'] = title;
    map['titleId'] = titleId;
    map['versionH5Url'] = versionH5Url;
    map['wordsize'] = wordsize;
    map['year'] = year;
    return map;
  }

}

class ArticleImgList {
  ArticleImgList({
      this.id, 
      this.imgFileName, 
      this.imgHttpAddress, 
      this.sort, 
      this.titleId,});

  ArticleImgList.fromJson(dynamic json) {
    id = json['id'];
    imgFileName = json['imgFileName'];
    imgHttpAddress = json['imgHttpAddress'];
    sort = json['sort'];
    titleId = json['titleId'];
  }
  int? id;
  String? imgFileName;
  String? imgHttpAddress;
  int? sort;
  String? titleId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['imgFileName'] = imgFileName;
    map['imgHttpAddress'] = imgHttpAddress;
    map['sort'] = sort;
    map['titleId'] = titleId;
    return map;
  }

}