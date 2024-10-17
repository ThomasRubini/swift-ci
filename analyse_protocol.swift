protocol AnalyseProtocol {
    init(seuil : Int)
    mutating func add_result(result: TestResultProtocol)
    func successPercent() -> Double
}