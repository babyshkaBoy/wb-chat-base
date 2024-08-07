import SwiftUI

struct StartView: View {

    private var taskManager : TaskService = .init()

    var body: some View {
        VStack {
            Text("Hello buddy")
        }
        .background(.white)
        .task {
            await taskManager.process()
        }
    }
}
