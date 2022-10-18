const String getDetailCountryInfo= r'''
query GetDetailCountryInfo{
  country(code: "UZ") {
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
