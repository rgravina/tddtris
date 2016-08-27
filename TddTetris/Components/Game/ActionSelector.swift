protocol ActionSelector {
    func next(state: GameState) -> Action
}