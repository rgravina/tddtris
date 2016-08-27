struct NoAction: Action {
    func perform(state: GameState) -> GameState {
        return state
    }
}