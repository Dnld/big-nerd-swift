//: Playground - noun: a place where people can play

import Cocoa

func padding(amount: Int) -> String {
    var paddingString = ""
    for _ in 0..<amount {
        paddingString += " "
    }
    return paddingString
}

//func printDataTable(data: [[Int]]) {
//    for row in data {
//        var output = ""
//        for item in row {
//            output += " \(item) |"
//        }
//        print(output)
//    }
//}

//func printDataTable(rowLabels: [String], columnLabels: [String], data: [[Int]]) {
func printTable(dataSource: protocol<TabularDataSource, CustomStringConvertible>) {
    print("Table: \(dataSource.description)")
    
    let rowLabels = (0..<dataSource.numberOfRows).map() { dataSource.labelForRow($0) }
    let columnLabels = (0..<dataSource.numberOfColumns).map() { dataSource.labelForColumn($0) }
    
    let rowLabelWidths = rowLabels.map() { $0.characters.count }
    
    guard let maxRowLabelWidth = rowLabelWidths.maxElement() else {
        return
    }
    
    var maxColunmWidths = [Int]()
    
    for columnLabel in columnLabels {
        maxColunmWidths.append(columnLabel.characters.count + 3)
    }
    
    for i in 0..<dataSource.numberOfRows {
        for j in 0..<dataSource.numberOfColumns {
            let tempWidth = String(dataSource.itemForRow(i, column: j)).characters.count + 3
            if tempWidth > maxColunmWidths[j] {
                maxColunmWidths[j] = tempWidth
            }
        }
    }
    
    var firstRow = padding(maxRowLabelWidth) + " |"
    
    for (i, columnLabel) in columnLabels.enumerate() {
        let columnHeader = " \(columnLabel) |"
        let paddingAmount = maxColunmWidths[i] - columnHeader.characters.count
        firstRow += padding(paddingAmount) + columnHeader
        maxColunmWidths.append(columnHeader.characters.count)
    }
    
    print(firstRow)
    
//    for (i, row) in data.enumerate() {
    for i in 0..<dataSource.numberOfRows {
        let paddingAmount = maxRowLabelWidth - rowLabelWidths[i]
        var output = rowLabels[i] + padding(paddingAmount) + " |"
//        
//        for item in row {
//            output += " \(item) |"
//        for (j, item) in row.enumerate() {
        for j in 0..<dataSource.numberOfColumns {
            let item = dataSource.itemForRow(i, column: j)
            let itemString = " \(item) |"
            let paddingAmount = maxColunmWidths[j] - itemString.characters.count
            output += padding(paddingAmount) + itemString
        }
        print(output)
    }
    
}

//let rowLabels = ["Joe", "Karen", "Fred"]
//let columnLabels = ["Age", "Years of Experience"]
//let data = [
//    [30, 6],
//    [40, 18],
//    [50, 20]
//]
//
//printDataTable(rowLabels, columnLabels: columnLabels, data: data)

protocol TabularDataSource {
    var numberOfRows: Int { get }
    var numberOfColumns: Int { get }
    
    func labelForRow(row: Int) -> String
    func labelForColumn(column: Int) -> String
    
    func itemForRow(row: Int, column: Int) -> String
}

struct Person {
    let name: String
    let age: Int
    let yearsOfExperience: Int
}

struct Department: TabularDataSource, CustomStringConvertible {
    let name: String
    var people = [Person]()
    
    var description: String {
        return "Department \(name)"
    }
    
    init(name: String) {
        self.name = name
    }
    
    mutating func addPerson(person: Person) {
        people.append(person)
    }
    
    var numberOfRows: Int {
        return people.count
    }
    
    var numberOfColumns: Int {
        return 2
    }
    
    func labelForRow(row: Int) -> String {
        return people[row].name
    }
    
    func labelForColumn(column: Int) -> String {
        switch column {
        case 0: return "Age"
        case 1: return "Years of Experience"
        default: fatalError("Invalid column!")
        }
    }
    
    func itemForRow(row: Int, column: Int) -> String {
        let person = people[row]
        switch column {
        case 0: return String(person.age)
        case 1: return String(person.yearsOfExperience)
        default: fatalError("Invalid column!")
        }
    }
    
}

var department = Department(name: "Engineering")
department.addPerson(Person(name: "Joe", age: 1000, yearsOfExperience: 6))
department.addPerson(Person(name: "Karen", age: 40, yearsOfExperience: 18))
department.addPerson(Person(name: "Fred", age: 50, yearsOfExperience: 20))

printTable(department)

struct Book {
    let title: String
    let author: String
    let avgReviews: Int
}

struct BookCollection: TabularDataSource, CustomStringConvertible {
    var books = [Book]()
    var description: String {
        return "This is a collection of books"
    }
    
    var numberOfRows: Int {
        return books.count
    }
    
    var numberOfColumns: Int {
        return 3
    }
    
    func labelForRow(row: Int) -> String {
        return String(row + 1)
    }
    
    func labelForColumn(column: Int) -> String {
        switch column {
        case 0: return "Title"
        case 1: return "Author"
        case 2: return "Average Rating"
        default: fatalError("Invalid column!")
        }
    }
    
    func itemForRow(row: Int, column: Int) -> String {
        let book = books[row]
        switch column {
        case 0: return book.title
        case 1: return book.author
        case 2: return String(book.avgReviews)
        default: fatalError("Invalid column!")
        }
    }
    
}

var bookCollection = BookCollection()
bookCollection.books.append(Book(title: "Infinite Jest", author: "David Foster Wallace", avgReviews: 5))
bookCollection.books.append(Book(title: "The Right Stuff", author: "Tom Wolfe", avgReviews: 4))
printTable(bookCollection)
