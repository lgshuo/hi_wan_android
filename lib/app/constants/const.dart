abstract class Constants {
  static const String TITLEID = "titleId";
}

abstract class HtmlConst {
  static const String head = '''
<html><head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, minimal-ui">

    <title></title>
  <style type="text/css">
    body { background: transparent; margin: 0; padding: 0; line-height: 1.5;margin-left:20px;margin-right:20px}
    #container { position: relative; margin: 0; padding: 0; width: 100vw; height: 100vh; }
    #shape { background: red; width: 200px; height: 200px; margin: 0; padding: 0; position: absolute; top: calc(50% - 100px); left: calc(50% - 100px)}
    img {width:100%;display: block;}
    p{color:#333333}
  </style>
</head>
<body>
''';
  static const String footer = '''
   </body>
  </html>
  ''';
}
