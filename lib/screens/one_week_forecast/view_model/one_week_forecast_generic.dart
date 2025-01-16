class OneWeekForecastGeneric {
  bool isLoading;

  OneWeekForecastGeneric({this.isLoading = false});

  OneWeekForecastGeneric update(bool? loading) {
    return OneWeekForecastGeneric(
      isLoading: loading ?? this.isLoading,
    );
  }
}
