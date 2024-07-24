import Foundation
//Напишите функцию на Swift, которая принимает строку и возвращает её хеш, используя встроенную функцию hash().
func getHashFromString(inputString: String) -> Int {
    return inputString.hashValue
}

//2. Придумайте и реализуйте собственную простую хеш-функцию для строк.
func customHashFunction(inputString: String) -> Int {
    var hashValue = 0
    for char in inputString.utf8 {
        hashValue = 31 &* hashValue &+ Int(char)
    }
    return hashValue
}
print(customHashFunction(inputString: "Wassup"))

//3. Set:
//Создайте множество (set) из целых чисел.
//Добавьте несколько элементов в это множество.
//Удалите один элемент.
//Проверьте, существует ли определенный элемент в множестве.
//Примените операции объединения, пересечения и разности на множествах
var integerSet: Set<Int> = [1, 2, 3, 4, 5]
integerSet.insert(6)
integerSet.remove(3)
if integerSet.contains(4) {
    print("Element 4 exists in the set")
}

let set1: Set = [1, 2, 3, 4]
let set2: Set = [3, 4, 5, 6]

let unionSet = set1.union(set2)
let intersectionSet = set1.intersection(set2)
let differenceSet = set1.subtracting(set2)

//4. Dictionary:
//Создайте словарь, где ключами будут строки (названия городов), а значениями — целые числа (их население).
//Добавьте несколько пар ключ-значение в словарь.
//Удалите одну пару ключ-значение.
//Обновите значение для одного из ключей.
//Получите значение для одного из ключей.
var cityPopulation: [String: Int] = ["Moscow": 30, "SPB": 15, "Sochi": 10]
cityPopulation.updateValue(7, forKey: "Tomsk")
cityPopulation["Moscow"] = 40
cityPopulation["SPB"] = 16
cityPopulation.removeValue(forKey: "Sochi")
print(cityPopulation)

