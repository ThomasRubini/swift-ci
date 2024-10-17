import Foundation

struct TestResultStruct: TestResultProtocol {
    var id: String
    var date: Date
    var result: Result

    init(id: String, date: Date, result: Result) {
        self.id = id
        self.date = date
        self.result = result
    }
}
