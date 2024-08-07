
final class TaskService {

    let client1 = UserModel(id: 1)
    let client2 = UserModel(id: 2)
    let client3 = UserModel(id: 3)
    let client4 = UserModel(id: 4)
    let client5 = UserModel(id: 5)

    let server = Server()
    
    func process() async {
        await server.addClient(client1)
        await server.addClient(client2)
        await server.addClient(client3)
        await server.addClient(client4)
        await server.addClient(client5)


        await server.addTask(TaskModel(id: 1, data: "task1"))
        await server.addTask(TaskModel(id: 2, data: "task2"))
        await server.addTask(TaskModel(id: 3, data: "task3"))
        await server.addTask(TaskModel(id: 4, data: "task4"))
        await server.addTask(TaskModel(id: 5, data: "task5"))

        await server.proceedTasks()
        let results = await server.getResults()
        let errors = await server.getErrors()

        print("Results:", results)
        print("Errors:", errors.count)

    }
}
