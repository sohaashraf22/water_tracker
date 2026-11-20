class WaterCalculator {
  static double calculate({
    required int weightKg,
    required double activityHours,
  }) {
    final double baseMl = weightKg * 35;
    final double activityMl = activityHours * 250;

    final double totalMl = baseMl + activityMl;

    return totalMl / 1000;
  }
}