print("hey")

func run_tests_multiple_times(tests : [TestProtocol], times: Int) -> [TestResultProtocol] {
    var results: [TestResultProtocol] = []
    for _ in 0..<times {
        for test in tests {
            results.append(test.test())
        }
    }
    return results
}

// create tests
let tests: [TestProtocol] = [SuccessTestImpl(name: "mytest1"), FailureTestImpl(name: "mytest2"), RandomTestImpl(name: "mytest3")]

// run tests
let results = run_tests_multiple_times(tests: tests, times: 10)

// create and populate analyse
var analyse: AnalyseProtocol = AnalyseStruct(seuil: 20)
for result in results {
    analyse.add_result(result: result)
}

print(analyse.successPercent())