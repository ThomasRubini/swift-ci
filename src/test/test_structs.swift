import Foundation

func result(_ success: Bool) -> TestResultProtocol {
    return TestResultStruct(id: "1", date: Date(), result: success ? .Success : .Failure)
}

struct SuccessTestImpl: TestProtocol {
    var name: String
    init (name: String) {
        self.name = name
    }
    func test() -> TestResultProtocol {
        return result(true)
    }
}

struct FailureTestImpl: TestProtocol {
    var name: String
    init (name: String) {
        self.name = name
    }
    func test() -> TestResultProtocol {
        return result(false)
    }
}

struct RandomTestImpl: TestProtocol {
    var name: String
    init (name: String) {
        self.name = name
    }
    func test() -> TestResultProtocol {
        return result(Bool.random())
    }
}