import Foundation
import XCTest
import Nimble
@testable import TddTetris

class MoveTetrominoDownOneRowActionTest: XCTestCase {
    var action: MoveTetrominoDownOneRowAction!

    override func setUp() {
        action = MoveTetrominoDownOneRowAction(view: SpyGameView())
    }

    func test_perform_movesTetrominoPostitionDownOneRow() {
        var gameState = GameState()
        gameState.tetromino = STetromino(position: (0, 0))

        let newState = action.perform(gameState)

        expect(newState.tetromino!.position.row).to(equal((1)))
    }
}