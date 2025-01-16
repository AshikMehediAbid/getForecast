class HomeScreenGeneric {
  bool isLoading;
  String searchedText;

  HomeScreenGeneric({
    this.isLoading = false,
    this.searchedText = "auto:ip",
  });

  HomeScreenGeneric update({bool? loading, String? location}) {
    return HomeScreenGeneric(
      isLoading: loading ?? this.isLoading,
      searchedText: location ?? this.searchedText,
    );
  }
}
