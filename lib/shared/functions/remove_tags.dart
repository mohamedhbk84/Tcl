String removeAllHtmlTags(String htmlText) {
  if (htmlText != null) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    return htmlText.replaceAll(exp, '');
  }
  return '';
}
