import 'dart:math' as math;

class MathHelper {
  static bool isSquare(int n) {
    final double sr = math.sqrt(n);
    return (sr - sr.floor()) == 0;
  }

  static bool isTriangular(int n) {
    return isSquare(8 * n + 1);
  }
}
