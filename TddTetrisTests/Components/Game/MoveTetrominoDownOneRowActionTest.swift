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
                (column: 3, row: 1),
                (column: 4, row: 0),
                (column: 4, row: 1),
                (column: 5, row: 0)
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
            position: (3, 0),
            blocks: [
                (column: 3, row: 1),
                (column: 4, row: 0),
                (column: 4, row: 1),
                (column: 5, row: 0)
            ]
        )


        let action = MoveTetrominoDownOneRowAction(
            view: SpyGameView(),
            state: gameState
        )
        
        action.perform()

        expect(gameState.cells[3][0]).to(beFalse())
        expect(gameState.cells[4][0]).to(beFalse())
        expect(gameState.cells[5][0]).to(beFalse())
        expect(gameState.cells[3][1]).to(beFalse())
        expect(gameState.cells[3][2]).to(beTrue())
        expect(gameState.cells[4][1]).to(beTrue())
        expect(gameState.cells[4][2]).to(beTrue())
        expect(gameState.cells[5][1]).to(beTrue())
        expect(gameState.cells[5][2]).to(beFalse())
    }
}