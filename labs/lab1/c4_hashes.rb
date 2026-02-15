# ============================================
# Лабораторная работа 1: Операции с хэшами в Ruby
# ============================================
# Выполните следующие упражнения, чтобы изучить работу с хэшами в Ruby.
# Хэши - это пары ключ-значение (как словари в Python или объекты в JS).
# Замените возвращаемые значения 'nil' своей реализацией.
# Запустите этот файл командой: ruby c4_hashes.rb

# Упражнение 1: Создание хэша и доступ к элементам
# Создайте хэш с заданными ключами и значениями, затем верните значение для конкретного ключа
# Ожидается: get_value({ name: "Alice", age: 25 }, :name) => "Alice"
def get_value(hash, key)
  # TODO: Получите значение из хэша, используя hash[key]
  nil
end

# Упражнение 2: Изменение хэша
# Добавьте новую пару ключ-значение в хэш и верните его
# Ожидается: add_pair({ a: 1 }, :b, 2) => { a: 1, b: 2 }
def add_pair(hash, key, value)
  # TODO: Добавьте новую пару, используя hash[key] = value
  nil
end

# Упражнение 3: Ключи и значения хэша
# Верните массив всех ключей из хэша
# Ожидается: get_keys({ name: "Bob", age: 30, city: "NYC" }) => [:name, :age, :city]
def get_keys(hash)
  # TODO: Используйте метод .keys
  nil
end

# Упражнение 4: Итерация по хэшу
# Создайте новый хэш со всеми значениями, умноженными на 2
# Ожидается: double_values({ a: 1, b: 2, c: 3 }) => { a: 2, b: 4, c: 6 }
def double_values(hash)
  # TODO: Используйте .transform_values или .each_with_object
  nil
end

# Упражнение 5: Фильтрация хэша
# Верните новый хэш только с теми парами, где значение больше порога
# Ожидается: filter_by_value({ a: 10, b: 5, c: 15 }, 8) => { a: 10, c: 15 }
def filter_by_value(hash, threshold)
  # TODO: Используйте метод .select
  nil
end

# Упражнение 6: Объединение хэшей
# Объедините два хэша (значения второго хэша перезаписывают первый)
# Ожидается: merge_hashes({ a: 1, b: 2 }, { b: 3, c: 4 }) => { a: 1, b: 3, c: 4 }
def merge_hashes(hash1, hash2)
  # TODO: Используйте метод .merge
  nil
end

# Упражнение 7: Проверка существования ключа
# Проверьте, есть ли в хэше конкретный ключ
# Ожидается: has_key?({ name: "Alice", age: 25 }, :name) => true
def has_key?(hash, key)
  # TODO: Используйте метод .has_key? или .key?
  nil
end

# Упражнение 8: Работа с вложенными хэшами
# Получите значение из вложенного хэша
# Ожидается: nested_value({ user: { name: "John", age: 30 } }, :user, :name) => "John"
def nested_value(hash, key1, key2)
  # TODO: Получите значение из вложенного хэша, используя hash[key1][key2] или метод .dig
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
  if get_value({ name: "Alice", age: 25 }, :name) == "Alice"
    tests_passed += 1
    puts "✓ Test 1 passed: get_value"
  else
    puts "✗ Test 1 failed: get_value"
  end

  # Test 2
  total_tests += 1
  if add_pair({ a: 1 }, :b, 2) == { a: 1, b: 2 }
    tests_passed += 1
    puts "✓ Test 2 passed: add_pair"
  else
    puts "✗ Test 2 failed: add_pair"
  end

  # Test 3
  total_tests += 1
  result = get_keys({ name: "Bob", age: 30, city: "NYC" })
  if result&.sort == [:name, :age, :city].sort
    tests_passed += 1
    puts "✓ Test 3 passed: get_keys"
  else
    puts "✗ Test 3 failed: get_keys"
  end

  # Test 4
  total_tests += 1
  if double_values({ a: 1, b: 2, c: 3 }) == { a: 2, b: 4, c: 6 }
    tests_passed += 1
    puts "✓ Test 4 passed: double_values"
  else
    puts "✗ Test 4 failed: double_values"
  end

  # Test 5
  total_tests += 1
  if filter_by_value({ a: 10, b: 5, c: 15 }, 8) == { a: 10, c: 15 }
    tests_passed += 1
    puts "✓ Test 5 passed: filter_by_value"
  else
    puts "✗ Test 5 failed: filter_by_value"
  end

  # Test 6
  total_tests += 1
  if merge_hashes({ a: 1, b: 2 }, { b: 3, c: 4 }) == { a: 1, b: 3, c: 4 }
    tests_passed += 1
    puts "✓ Test 6 passed: merge_hashes"
  else
    puts "✗ Test 6 failed: merge_hashes"
  end

  # Test 7
  total_tests += 1
  if has_key?({ name: "Alice", age: 25 }, :name) == true
    tests_passed += 1
    puts "✓ Test 7 passed: has_key?"
  else
    puts "✗ Test 7 failed: has_key?"
  end

  # Test 8
  total_tests += 1
  if nested_value({ user: { name: "John", age: 30 } }, :user, :name) == "John"
    tests_passed += 1
    puts "✓ Test 8 passed: nested_value"
  else
    puts "✗ Test 8 failed: nested_value"
  end

  puts "\n" + "=" * 40
  if tests_passed == total_tests
    puts "🎉 Все тесты пройдены! (#{tests_passed}/#{total_tests})"
    puts "Фантастика! Вы освоили хэши в Ruby!"
  else
    puts "Тестов пройдено: #{tests_passed}/#{total_tests}"
    puts "Продолжайте работу над оставшимися упражнениями."
  end
  puts "=" * 40
end

# Запуск тестов
run_tests
