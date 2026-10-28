import Foundation

public final class LocalStore {
    public let directory: URL
    private var fileURL: URL { directory.appendingPathComponent("learner-state.json") }

    public init(directory: URL) {
        self.directory = directory
    }

    public func load() throws -> LearnerState {
        guard FileManager.default.fileExists(atPath: fileURL.path) else { return LearnerState() }
        return try JSONDecoder().decode(LearnerState.self, from: Data(contentsOf: fileURL))
    }

    public func save(_ state: LearnerState) throws {
        // Preserve unreadable or corrupt existing data rather than silently replacing it.
        if FileManager.default.fileExists(atPath: fileURL.path) {
            _ = try load()
        }
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
        let data = try encoder.encode(state)
        try FileManager.default.createDirectory(at: directory, withIntermediateDirectories: true)
        try data.write(to: fileURL, options: .atomic)
    }
}
