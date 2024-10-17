struct AnalyseStruct: AnalyseProtocol {
    var seuil: Int
    var results: [TestResultProtocol]
    init(seuil : Int) {
        self.seuil = seuil
        self.results = []
    }

    mutating func add_result(result: TestResultProtocol) {
        results.append(result)
        
        let MAX_TEST_STORAGE = 500

        if results.count > MAX_TEST_STORAGE {
            results.removeFirst(results.count-MAX_TEST_STORAGE)
        }
    }

    func successPercent() -> Double {
        var success = 0
        for result in results {
            if result.result == .Success {
                success += 1
            }
        }
        return Double(success*100)/Double(results.count)
    }
}
