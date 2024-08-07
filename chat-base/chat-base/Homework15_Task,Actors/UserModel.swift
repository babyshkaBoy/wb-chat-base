protocol IUser {
    func process(_ task: ITask) async throws -> String
}

struct UserModel: IUser {
    let id: Int

    func process(_ task: ITask) async throws -> String {
        guard !task.data.isEmpty else {
            throw TaskError.processingFailed("Data is empty")
        }
       let result = "Processed \(task.data) by Client \(id)"
       return result
   }
}
