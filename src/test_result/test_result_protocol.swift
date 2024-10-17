import Foundation

protocol TestResultProtocol {
    var id: String { get }
    var date: Date { get }
    var result: Result { get }

    init(id: String, date: Date, result: Result)
}
