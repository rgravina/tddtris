protocol Action {
    func perform(state: GameState) -> GameState
}