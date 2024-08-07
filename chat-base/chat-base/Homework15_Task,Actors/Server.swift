actor Server {
    private var clients: [Int: UserModel] = [:]
    private var tasks: [TaskModel] = []
    private var results: [String] = []
    private var errors: [TaskError] = []

    func addClient(_ client: UserModel) {
        clients[client.id] = client
    }

    func addTask(_ task: TaskModel) {
        tasks.append(task)
    }

    func proceedTasks() async {
           await withTaskGroup(of: Void.self) { taskGroup in
               for task in tasks {
                   if let client = clients.values.randomElement() {
                       taskGroup.addTask {
                           do {
                               let result = try await client.process(task)
                               await self.addResult(result)
                           } catch let error as TaskError {
                               await self.addError(error)
                           } catch {
                               await self.addError(.processingFailed("Unknown error: \(error.localizedDescription)"))
                           }
                       }
                   } else {
                       await self.addError(.clientUnavailable)
                   }
               }
           }
       }

    private func addResult(_ result: String) async {
        results.append(result)
    }

    private func addError(_ error: TaskError) async {
        errors.append(error)
    }

    func getResults() -> [String] {
        return results
    }

    func getErrors() -> [TaskError] {
        return errors
    }
}
