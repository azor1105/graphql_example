const String getDetailCountryInfo= r'''
query GetDetailCountryInfo($code: String!) {
  country(code: $code) {
    name
    native
    capital
    emoji
    currency
    languages {
      code
      name
    }
  }
}
''';
