
import SwiftUI
protocol ITask {
    var id: Int { get }
    var data: String { get }
}

struct TaskModel: ITask {
    let id: Int
    let data: String
}

enum TaskError: Error {
    case clientUnavailable
    case processingFailed(String)
}
