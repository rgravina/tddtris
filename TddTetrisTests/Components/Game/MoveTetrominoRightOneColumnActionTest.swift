import Foundation
import XCTest
import Nimble
@testable import TddTetris

class MoveTetrominoRightOneColumnActionTest: XCTestCase {
    func test_perform_movesTetrominoPostitionRightOneColumn() {
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

        let action = MoveTetrominoRightOneColumnAction(
            view: SpyGameView(),
            state: gameState,
            collisionDetector: SpyCollisionDetector()
        )

        action.perform()

        expect(gameState.tetromino!.position.column).to(equal((1)))
    }

    func test_perform_stopsMovingIfWouldCollide() {
        let gameState = GameState()
        gameState.tetromino = STetromino(
            position: (7, 0),
            blocks: [
                (column: 0, row: 1),
                (column: 1, row: 1),
                (column: 1, row: 0),
                (column: 2, row: 0)
            ]
        )

        let collisionDetector = SpyCollisionDetector()
        collisionDetector.wouldCollide_returnValue = true

        let action = MoveTetrominoRightOneColumnAction(
            view: SpyGameView(),
            state: gameState,
            collisionDetector: collisionDetector
        )

        action.perform()

        expect(gameState.tetromino!.position.column).to(equal((7)))
    }

    func test_perform_doesNothingWhenThereIsNoTetromino() {
        let gameState = GameState()

        let action = MoveTetrominoRightOneColumnAction(
            view: SpyGameView(),
            state: gameState,
            collisionDetector: SpyCollisionDetector()
        )

        action.perform()

        expect(gameState.tetromino).to(beNil())
    }

    func test_perform_updatesGameState() {
        let gameState = GameState()
        gameState.tetromino = STetromino(
            position: (3, 0),
            blocks: [
                (column: 0, row: 1),
                (column: 1, row: 1),
                (column: 1, row: 0),
                (column: 2, row: 0)
            ]
        )

        let action = MoveTetrominoRightOneColumnAction(
            view: SpyGameView(),
            state: gameState,
            collisionDetector: SpyCollisionDetector()
        )

        action.perform()

        expect(gameState.cells[4][1]).to(beTrue())
        expect(gameState.cells[5][1]).to(beTrue())
        expect(gameState.cells[5][0]).to(beTrue())
        expect(gameState.cells[6][0]).to(beTrue())
    }
}
