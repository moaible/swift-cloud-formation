import SwiftCLI

class ExampleCommand: Command {
    let name = "example"
    
    @Param var person: String

    func execute() throws {
        stdout <<< "Hello \(person)!"
    }
}
