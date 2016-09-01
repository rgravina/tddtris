import Foundation
import XCTest
import Nimble
@testable import TddTetris

class MoveTetrominoRightOneColumnActionTest: XCTestCase {
    var action: MoveTetrominoRightOneColumnAction!

    override func setUp() {
        action = MoveTetrominoRightOneColumnAction(view: SpyGameView())
    }

    func test_perform_movesTetrominoPostitionRightOneColumn() {
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

        action.perform(gameState)

        expect(gameState.tetromino!.position.column).to(equal((1)))
    }

    func test_perform_stopsMovingAtEdge() {
        let gameState = GameState()
        gameState.tetromino = STetromino(
            position: (7, 0),
            blocks: [
                (column: 3, row: 1),
                (column: 4, row: 0),
                (column: 4, row: 1),
                (column: 5, row: 0)
            ]
        )

        action.perform(gameState)

        expect(gameState.tetromino!.position.column).to(equal((7)))
    }

    func test_perform_doesNothingWhenThereIsNoTetromino() {
        let gameState = GameState()

        action.perform(gameState)

        expect(gameState.tetromino).to(beNil())
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

        action.perform(gameState)

        expect(gameState.cells[5][0]).to(beTrue())
        expect(gameState.cells[6][0]).to(beTrue())
        expect(gameState.cells[5][1]).to(beTrue())
        expect(gameState.cells[4][1]).to(beTrue())
    }
}
