enum LaunchOption {
    case mainNews
    case savedNews
}

protocol Instructor {
    func startOption() -> LaunchOption
}
