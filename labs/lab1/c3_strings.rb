# ============================================
# Лабораторная работа 1: Операции со строками в Ruby
# ============================================
# Выполните следующие упражнения, чтобы изучить работу со строками в Ruby.
# Замените возвращаемые значения 'nil' своей реализацией.
# Запустите этот файл командой: ruby c3_strings.rb

# Упражнение 1: Конкатенация строк
# Объедините first_name и last_name с пробелом между ними
# Ожидается: "John" + "Doe" => "John Doe"
def full_name(first_name, last_name)
  # TODO: Реализуйте с помощью конкатенации строк или интерполяции
  nil
end

# Упражнение 2: Интерполяция строк
# Создайте приветственное сообщение, используя интерполяцию строк
# Ожидается: greet("Alice") => "Hello, Alice! Welcome to Ruby."
def greet(name)
  # TODO: Используйте #{} для интерполяции строк
  nil
end

# Упражнение 3: Методы строк
# Преобразуйте строку в верхний регистр и верните её длину
# Ожидается: process_string("hello") => ["HELLO", 5]
def process_string(str)
  # TODO: Используйте методы .upcase и .length
  # Верните массив [uppercase_string, length]
  nil
end

# Упражнение 4: Нарезка строк
# Извлеките первые 3 символа из строки
# Ожидается: first_chars("Ruby") => "Rub"
def first_chars(str)
  # TODO: Используйте нарезку строк с [start..end] или [start, length]
  nil
end

# Упражнение 5: Манипуляции со строками
# Замените все вхождения 'a' на 'o' в строке
# Ожидается: replace_vowel("banana") => "bonono"
def replace_vowel(str)
  # TODO: Используйте метод .gsub
  nil
end

# Упражнение 6: Проверка подстроки
# Проверьте, содержит ли строка конкретную подстроку (без учёта регистра)
# Ожидается: contains_word?("I love Ruby", "ruby") => true
def contains_word?(text, word)
  # TODO: Используйте методы .downcase и .include?
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
  if full_name("John", "Doe") == "John Doe"
    tests_passed += 1
    puts "✓ Test 1 passed: full_name"
  else
    puts "✗ Test 1 failed: full_name"
  end

  # Test 2
  total_tests += 1
  if greet("Alice") == "Hello, Alice! Welcome to Ruby."
    tests_passed += 1
    puts "✓ Test 2 passed: greet"
  else
    puts "✗ Test 2 failed: greet"
  end

  # Test 3
  total_tests += 1
  if process_string("hello") == ["HELLO", 5]
    tests_passed += 1
    puts "✓ Test 3 passed: process_string"
  else
    puts "✗ Test 3 failed: process_string"
  end

  # Test 4
  total_tests += 1
  if first_chars("Ruby") == "Rub"
    tests_passed += 1
    puts "✓ Test 4 passed: first_chars"
  else
    puts "✗ Test 4 failed: first_chars"
  end

  # Test 5
  total_tests += 1
  if replace_vowel("banana") == "bonono"
    tests_passed += 1
    puts "✓ Test 5 passed: replace_vowel"
  else
    puts "✗ Test 5 failed: replace_vowel"
  end

  # Test 6
  total_tests += 1
  if contains_word?("I love Ruby", "ruby") == true
    tests_passed += 1
    puts "✓ Test 6 passed: contains_word?"
  else
    puts "✗ Test 6 failed: contains_word?"
  end

  puts "\n" + "=" * 40
  if tests_passed == total_tests
    puts "🎉 Все тесты пройдены! (#{tests_passed}/#{total_tests})"
    puts "Отличная работа! Вы освоили строки в Ruby!"
  else
    puts "Тестов пройдено: #{tests_passed}/#{total_tests}"
    puts "Продолжайте работу над оставшимися упражнениями."
  end
  puts "=" * 40
end

# Запуск тестов
run_tests
