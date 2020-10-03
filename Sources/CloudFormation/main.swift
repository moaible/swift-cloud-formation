import SwiftCLI

let cli = CLI(name: "scf")
cli.commands = [
    ExampleCommand()
]
cli.go()
