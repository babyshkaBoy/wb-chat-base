import UIKit

//Напишите программу, которая моделирует фабрику по производству строительных материалов.
//Опишите в программе два класса: Человек (ФИО, возраст, паспорт), Паспорт (Серия, Номер, дата выдачи, Человек) и инициализируйте их.
//Создавайте класс Person и Passport + инициализируйте их, потом деинициализируйте чтобы проверить, что все ок. Из памяти они уходят и так далее

protocol Material {
    func show()
}

class Brick: Material {
    var title: String
    
    init(title: String) {
        self.title = title
    }
    
    func show() {
        print("Производство \(self.title)")
    }
}

class Sand: Material {
    var title: String
    
    init(title: String) {
        self.title = title
    }
    
    func show() {
        print("Производство \(self.title)")
    }
}

enum MaterialsType {
    case brick
    case sand
}

class ConstructionFactory {
    func create(with type: MaterialsType) -> Material {
        switch type {
        case .brick:
            return Brick(title: "Кирпич")
        case .sand:
            return Sand(title: "Песок")
        }
    }
}

protocol ConstructionFactoryProtocol {
    
    func createMaterial() -> Material
}

class SandFactory: ConstructionFactoryProtocol {
    
    func createMaterial() -> Material {
        return Sand(title: "Песок")
    }
}

class BrickFactory: ConstructionFactoryProtocol {
    
    func createMaterial() -> Material {
        return Brick(title: "Кирпич")
    }
}
func materialFactory(type: MaterialsType) -> ConstructionFactoryProtocol {
    switch type {
    case .brick:
        return BrickFactory()
    case .sand:
        return SandFactory()
    }
}

var materialsType: MaterialsType = .brick
let factory = materialFactory(type: materialsType)
let material = factory.createMaterial()
material.show()




class Person {
    var surname: String
    var age: Int
    weak var passport: Passport?
    
    init(surname: String, age: Int, passport: Passport? = nil) {
        self.surname = surname
        self.age = age
        self.passport = passport
    }
    deinit {
        print("Удален")
    }
}

class Passport {
    var series: Int
    var number: Int
    var dateOfIssue: String
    var person: Person
    
    init(series: Int, number: Int, dateOfIssue: String, person: Person) {
        self.series = series
        self.number = number
        self.dateOfIssue = dateOfIssue
        self.person = person
    }
    deinit {
        print("Удален")
    }
}

do {
    let person = Person(surname: "Jonh", age: 22)

    let passport = Passport(series: 2222, number: 3333, dateOfIssue: "22.06.2000", person: person)

    person.passport = passport
}

