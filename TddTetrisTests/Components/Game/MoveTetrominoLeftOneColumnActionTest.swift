import Foundation
import XCTest
import Nimble
@testable import TddTetris

class MoveTetrominoLeftOneColumnActionTest: XCTestCase {
    var action: MoveTetrominoLeftOneColumnAction!

    override func setUp() {
        action = MoveTetrominoLeftOneColumnAction(view: SpyGameView())
    }

    func test_perform_movesTetrominoPostitionLeftOneColumn() {
        let gameState = GameState()
        gameState.tetromino = STetromino(
            position: (1, 0),
            blocks: [
                (column: 3, row: 1),
                (column: 4, row: 0),
                (column: 4, row: 1),
                (column: 5, row: 0)
            ]
        )

        action.perform(gameState)

        expect(gameState.tetromino!.position.column).to(equal((0)))
    }

    func test_perform_stopsMovingAtEdge() {
        let gameState = GameState()
        gameState.tetromino = STetromino(
            position: (0, 0),
            blocks: [
                (column: 0, row: 1),
                (column: 1, row: 0),
                (column: 1, row: 1),
                (column: 2, row: 0)
            ]
        )

        action.perform(gameState)

        expect(gameState.tetromino!.position.column).to(equal((0)))
    }

    func test_perform_doesNothingWhenThereIsNoTetromino() {
        let gameState = GameState()

        action.perform(gameState)

        expect(gameState.tetromino).to(beNil())
    }

    func test_perform_doesNothingIfWouldCollide() {
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

        expect(gameState.cells[3][0]).to(beTrue())
        expect(gameState.cells[4][0]).to(beTrue())
        expect(gameState.cells[3][1]).to(beTrue())
        expect(gameState.cells[2][1]).to(beTrue())
    }
}
