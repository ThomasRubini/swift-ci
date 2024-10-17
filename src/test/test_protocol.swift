protocol TestProtocol {
    var name: String { get set }
    init(name: String)
    func test() -> TestResultProtocol
}
