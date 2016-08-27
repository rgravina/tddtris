protocol Action {
    func perform(state: GameState, tetrominoGenerator: TetrominoGenerator, view: GameView) -> GameState
}