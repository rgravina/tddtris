import Foundation
import XCTest
import Nimble
@testable import TddTetris

class MoveTetrominoDownOneRowActionTest: XCTestCase {
    func test_perform_movesTetrominoPostitionDownOneRow() {
        let gameState = GameState()
        gameState.tetromino = STetromino(
            position: (0, 0),
            blocks: [
                (column: 0, row: 1),
                (column: 1, row: 1),
                (column: 1, row: 0),
                (column: 2, row: 0)
            ]
        )

        let action = MoveTetrominoDownOneRowAction(
            view: SpyGameView(),
            state: gameState
        )

        action.perform()

        expect(gameState.tetromino!.position.row).to(equal((1)))
    }

    func test_perform_updatesGameState() {
        let gameState = GameState()
        gameState.tetromino = STetromino(
            position: (0, 0),
            blocks: [
                (column: 0, row: 1),
                (column: 1, row: 1),
                (column: 1, row: 0),
                (column: 2, row: 0)
            ]
        )


        let action = MoveTetrominoDownOneRowAction(
            view: SpyGameView(),
            state: gameState
        )
        
        action.perform()

        expect(gameState.cells[0][1]).to(beFalse())
        expect(gameState.cells[0][2]).to(beTrue())
    }
}
