import 'package:frontend/logic.dart';
import '../test/logic_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Logic target = Logic();
  setUp(() async {
    target = Logic();
  });

  test('init', () async {
    expect(target.countData.count, 0);
    expect(target.countData.countUp, 0);
    expect(target.countData.countDown, 0);
  });

  test('increase', () async {
    target.increase();
    expect(target.countData.count, 1);
    expect(target.countData.countUp, 1);
    expect(target.countData.countDown, 0);
  });
  test('decrease', () async {
    target.decrease();
    expect(target.countData.count, -1);
    expect(target.countData.countUp, 0);
    expect(target.countData.countDown, 1);
  });
  test('reset', () async {
    target.increase();
    target.decrease();
    expect(target.countData.count, 0);
    expect(target.countData.countUp, 1);
    expect(target.countData.countDown, 1);
    
    target.reset();
    expect(target.countData.count, 0);
    expect(target.countData.countUp, 0);
    expect(target.countData.countDown, 0);
  });
}
