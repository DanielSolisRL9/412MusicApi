import Fluent
import Vapor

func routes(_ app: Application) throws {
app.get { req async in
        "It works!"
    }

    app.get("hello") { req async -> String in
        "Hello, world!"
    }

    app.get("albums"){ req async throws -> [Album] in
        let album = try await Album.query(on: req.db).all()
        return album
    }

    try app.register(collection: TodoController())
}
