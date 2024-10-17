protocol Test {
    var name: String { get set }
    init(name: String)
    func test() -> Bool
}

struct SuccessTestImpl: Test {
    var name: String
    init (name: String) {
        self.name = name
    }
    func test() -> Bool {
        return true
    }
}

struct FailureTestImpl: Test {
    var name: String
    init (name: String) {
        self.name = name
    }
    func test() -> Bool {
        return false
    }
}

struct RandomTestImpl: Test {
    var name: String
    init (name: String) {
        self.name = name
    }
    func test() -> Bool {
        return Bool.random()
    }
}

func run_tests(tests: [Test]) -> [Bool] {
    var results: [Bool] = []
    for test in tests {
        results.append(test.test())
    }
    return results
}

func run_tests_multiple_times(tests: [Test], times: Int) {
    var results = [Int](repeating: 0, count: tests.count)
    for _ in 0..<times {
        var i = 0
        for res in run_tests(tests: tests) {
            if res {
                results[i] += 1
            }
            i+=1
        }
    }

    for i in 0..<results.count {
        let rate = Double(results[i]*100)/Double(times)
        print("Test '\(tests[i].name)' success rate: \(rate)%")
    }
}

let tests: [Test] = [SuccessTestImpl(name: "mytest1"), FailureTestImpl(name: "mytest2"), RandomTestImpl(name: "mytest3")]

run_tests_multiple_times(tests: tests, times: 10)
