import 'package:test/test.dart';
import 'package:test_demo/counter.dart';

void main() {
  final Counter counter = Counter();

  group("Counter", () {
    test("counter", () {
      expect(counter.value, 0);
    });

    test("counter++", () {
      counter.increment();
      expect(counter.value, 1);
    });

    test("counter--", () {
      counter.decrement();
      expect(counter.value, 0);
    });
  });
}
