# ============================================
# Лабораторная работа 1: Управляющие конструкции в Ruby
# ============================================
# Выполните следующие упражнения, чтобы изучить управление потоком выполнения в Ruby.
# Замените возвращаемые значения 'nil' своей реализацией.
# Запустите этот файл командой: ruby c1_control_statements.rb

# Упражнение 1: Конструкция if-else
# Верните "positive" если число > 0, "negative" если < 0, "zero" если == 0
# Ожидается: check_number(5) => "positive"
def check_number(num)
  # TODO: Используйте конструкцию if/elsif/else
  nil
end

# Упражнение 2: Тернарный оператор
# Используйте тернарный оператор для возврата "even" или "odd"
# Ожидается: even_or_odd(4) => "even"
def even_or_odd(num)
  # TODO: Используйте condition ? true_value : false_value
  nil
end

# Упражнение 3: Конструкция unless (специфична для Ruby)
# Верните "access granted" если возраст не меньше 18
# Ожидается: check_access(20) => "access granted"
# Ожидается: check_access(15) => "access denied"
def check_access(age)
  # TODO: Используйте конструкцию unless (противоположность if)
  nil
end

# Упражнение 4: Конструкция case (switch)
# Верните тип дня: "weekday" для пн-пт, "weekend" для сб-вс, "invalid" в остальных случаях
# Ожидается: day_type("Monday") => "weekday"
def day_type(day)
  # TODO: Используйте конструкцию case/when
  nil
end

# Упражнение 5: Цикл while
# Верните массив чисел от 1 до n
# Ожидается: count_up(5) => [1, 2, 3, 4, 5]
def count_up(n)
  # TODO: Используйте цикл while
  nil
end

# Упражнение 6: Цикл until (специфичен для Ruby)
# Верните массив, считающий от n до 1
# Ожидается: count_down(5) => [5, 4, 3, 2, 1]
def count_down(n)
  # TODO: Используйте цикл until (противоположность while)
  nil
end

# Упражнение 7: Цикл for / итератор each
# Просуммируйте все числа в массиве
# Ожидается: sum_with_loop([1, 2, 3, 4]) => 10
def sum_with_loop(arr)
  # TODO: Используйте цикл for
  nil
end

# Упражнение 8: Break и next
# Верните массив чисел из массива, которые < 10, остановитесь при первом числе >= 20
# Ожидается: process_numbers([5, 8, 12, 25, 3, 15]) => [5, 8]
def process_numbers(arr)
  # TODO: Используйте break для остановки, next для пропуска
  nil
end

# Упражнение 9: Модификатор if/unless
# Верните "big" если число > 100, иначе верните само число
# Используйте if как модификатор выражения (в конце строки)
# Ожидается: check_size(150) => "big"
# Ожидается: check_size(50) => 50
def check_size(num)
  # TODO: Используйте: return "big" if num > 100; return num
  nil
end

# ============================================
# ТЕСТОВЫЕ ПРИМЕРЫ - Не изменяйте код ниже этой строки
# ============================================

def run_tests
  tests_passed = 0
  total_tests = 0

  # Test 1
  total_tests += 1
  if check_number(5) == "positive" && check_number(-3) == "negative" && check_number(0) == "zero"
    tests_passed += 1
    puts "✓ Test 1 passed: check_number"
  else
    puts "✗ Test 1 failed: check_number"
  end

  # Test 2
  total_tests += 1
  if even_or_odd(4) == "even" && even_or_odd(7) == "odd"
    tests_passed += 1
    puts "✓ Test 2 passed: even_or_odd"
  else
    puts "✗ Test 2 failed: even_or_odd"
  end

  # Test 3
  total_tests += 1
  if check_access(20) == "access granted" && check_access(15) == "access denied"
    tests_passed += 1
    puts "✓ Test 3 passed: check_access"
  else
    puts "✗ Test 3 failed: check_access"
  end

  # Test 4
  total_tests += 1
  if day_type("Monday") == "weekday" && day_type("Saturday") == "weekend" && day_type("Funday") == "invalid"
    tests_passed += 1
    puts "✓ Test 4 passed: day_type"
  else
    puts "✗ Test 4 failed: day_type"
  end

  # Test 5
  total_tests += 1
  if count_up(5) == [1, 2, 3, 4, 5]
    tests_passed += 1
    puts "✓ Test 5 passed: count_up"
  else
    puts "✗ Test 5 failed: count_up"
  end

  # Test 6
  total_tests += 1
  if count_down(5) == [5, 4, 3, 2, 1]
    tests_passed += 1
    puts "✓ Test 6 passed: count_down"
  else
    puts "✗ Test 6 failed: count_down"
  end

  # Test 7
  total_tests += 1
  if sum_with_loop([1, 2, 3, 4]) == 10
    tests_passed += 1
    puts "✓ Test 7 passed: sum_with_loop"
  else
    puts "✗ Test 7 failed: sum_with_loop"
  end

  # Test 8
  total_tests += 1
  if process_numbers([5, 8, 12, 25, 3, 15]) == [5, 8]
    tests_passed += 1
    puts "✓ Test 8 passed: process_numbers"
  else
    puts "✗ Test 8 failed: process_numbers"
  end

  # Test 9
  total_tests += 1
  if check_size(150) == "big" && check_size(50) == 50
    tests_passed += 1
    puts "✓ Test 9 passed: check_size"
  else
    puts "✗ Test 9 failed: check_size"
  end

  puts "\n" + "=" * 40
  if tests_passed == total_tests
    puts "🎉 Все тесты пройдены! (#{tests_passed}/#{total_tests})"
    puts "Превосходно! Вы освоили управление потоком выполнения в Ruby!"
  else
    puts "Тестов пройдено: #{tests_passed}/#{total_tests}"
    puts "Продолжайте работу над оставшимися упражнениями."
  end
  puts "=" * 40
end

# Запуск тестов
run_tests
