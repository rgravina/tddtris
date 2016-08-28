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
        gameState.tetromino = STetromino()

        let nextState = action.perform(gameState)

        expect(nextState.tetromino!.position.row).to(equal((1)))
    }
}