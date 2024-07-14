int computeGCD(int x, int y) {
  while (y != 0) {
    int temp = y;
    y = x % y;
    x = temp;
  }
  return x;
}

int computeLCM(int x, int y) {
  return (x * y) ~/ computeGCD(x, y);
}
