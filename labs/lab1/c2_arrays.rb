# ============================================
# Лабораторная работа 1: Операции с массивами в Ruby
# ============================================
# Выполните следующие упражнения, чтобы изучить работу с массивами в Ruby.
# Замените возвращаемые значения 'nil' своей реализацией.
# Запустите этот файл командой: ruby c2_arrays.rb

# Упражнение 1: Создание массива и доступ к элементам
# Верните первый и последний элементы массива
# Ожидается: first_and_last([1, 2, 3, 4]) => [1, 4]
def first_and_last(arr)
  # TODO: Используйте индексацию массива с [0] и [-1]
  nil
end

# Упражнение 2: Методы массивов
# Добавьте элемент в конец массива и верните изменённый массив
# Ожидается: add_element([1, 2, 3], 4) => [1, 2, 3, 4]
def add_element(arr, element)
  # TODO: Используйте .push или оператор << (измените и верните массив)
  nil
end

# Упражнение 3: Итерация по массиву
# Верните массив со всеми числами, умноженными на 2
# Ожидается: double_numbers([1, 2, 3]) => [2, 4, 6]
def double_numbers(arr)
  # TODO: Используйте метод .map
  nil
end

# Упражнение 4: Фильтрация массива
# Верните только чётные числа из массива
# Ожидается: even_numbers([1, 2, 3, 4, 5, 6]) => [2, 4, 6]
def even_numbers(arr)
  # TODO: Используйте метод .select или .filter
  nil
end

# Упражнение 5: Свёртка массива
# Вычислите сумму всех чисел в массиве
# Ожидается: sum_array([1, 2, 3, 4]) => 10
def sum_array(arr)
  # TODO: Используйте метод .sum или .reduce
  nil
end

# Упражнение 6: Операции с массивами
# Проверьте, содержит ли массив конкретный элемент
# Ожидается: contains?([:a, :b, :c], :b) => true
def contains?(arr, element)
  # TODO: Используйте метод .include?
  nil
end

# Упражнение 7: Сортировка массива
# Отсортируйте массив чисел в порядке убывания
# Ожидается: sort_desc([3, 1, 4, 1, 5]) => [5, 4, 3, 1, 1]
def sort_desc(arr)
  # TODO: Используйте .sort с .reverse или .sort_by
  nil
end

# Упражнение 8: Диапазон массива
# Создайте массив чисел от start до end (включительно)
# Ожидается: number_range(1, 5) => [1, 2, 3, 4, 5]
def number_range(start, finish)
  # TODO: Используйте (start..finish).to_a
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
  if first_and_last([1, 2, 3, 4]) == [1, 4]
    tests_passed += 1
    puts "✓ Test 1 passed: first_and_last"
  else
    puts "✗ Test 1 failed: first_and_last"
  end

  # Test 2
  total_tests += 1
  result = add_element([1, 2, 3], 4)
  if result == [1, 2, 3, 4]
    tests_passed += 1
    puts "✓ Test 2 passed: add_element"
  else
    puts "✗ Test 2 failed: add_element"
  end

  # Test 3
  total_tests += 1
  if double_numbers([1, 2, 3]) == [2, 4, 6]
    tests_passed += 1
    puts "✓ Test 3 passed: double_numbers"
  else
    puts "✗ Test 3 failed: double_numbers"
  end

  # Test 4
  total_tests += 1
  if even_numbers([1, 2, 3, 4, 5, 6]) == [2, 4, 6]
    tests_passed += 1
    puts "✓ Test 4 passed: even_numbers"
  else
    puts "✗ Test 4 failed: even_numbers"
  end

  # Test 5
  total_tests += 1
  if sum_array([1, 2, 3, 4]) == 10
    tests_passed += 1
    puts "✓ Test 5 passed: sum_array"
  else
    puts "✗ Test 5 failed: sum_array"
  end

  # Test 6
  total_tests += 1
  if contains?([:a, :b, :c], :b) == true
    tests_passed += 1
    puts "✓ Test 6 passed: contains?"
  else
    puts "✗ Test 6 failed: contains?"
  end

  # Test 7
  total_tests += 1
  if sort_desc([3, 1, 4, 1, 5]) == [5, 4, 3, 1, 1]
    tests_passed += 1
    puts "✓ Test 7 passed: sort_desc"
  else
    puts "✗ Test 7 failed: sort_desc"
  end

  # Test 8
  total_tests += 1
  if number_range(1, 5) == [1, 2, 3, 4, 5]
    tests_passed += 1
    puts "✓ Test 8 passed: number_range"
  else
    puts "✗ Test 8 failed: number_range"
  end

  puts "\n" + "=" * 40
  if tests_passed == total_tests
    puts "🎉 Все тесты пройдены! (#{tests_passed}/#{total_tests})"
    puts "Превосходно! Вы освоили массивы в Ruby!"
  else
    puts "Тестов пройдено: #{tests_passed}/#{total_tests}"
    puts "Продолжайте работу над оставшимися упражнениями."
  end
  puts "=" * 40
end

# Запуск тестов
run_tests
