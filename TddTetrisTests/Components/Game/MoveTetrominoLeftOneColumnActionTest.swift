import Foundation
import XCTest
import Nimble
@testable import TddTetris

class MoveTetrominoLeftOneColumnActionTest: XCTestCase {
    func test_perform_movesTetrominoPostitionLeftOneColumn() {
        let gameState = GameState()
        gameState.tetromino = STetromino(
            position: (1, 0),
            blocks: [
                (column: 0, row: 1),
                (column: 1, row: 1),
                (column: 1, row: 0),
                (column: 2, row: 0)
            ]
        )

        let action = MoveTetrominoLeftOneColumnAction(
            view: SpyGameView(),
            state: gameState,
            collisionDetector: SpyCollisionDetector()
        )

        action.perform()

        expect(gameState.tetromino!.position.column).to(equal((0)))
    }


    func test_perform_doesNothingWhenThereIsNoTetromino() {
        let gameState = GameState()

        let action = MoveTetrominoLeftOneColumnAction(
            view: SpyGameView(),
            state: gameState,
            collisionDetector: SpyCollisionDetector()
        )

        action.perform()

        expect(gameState.tetromino).to(beNil())
    }

    func test_perform_doesNothingIfWouldCollide() {
        let gameState = GameState()

        let collisionDetector = SpyCollisionDetector()
        collisionDetector.wouldCollide_returnValue = true

        let action = MoveTetrominoLeftOneColumnAction(
            view: SpyGameView(),
            state: gameState,
            collisionDetector: collisionDetector
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

        let action = MoveTetrominoLeftOneColumnAction(
            view: SpyGameView(),
            state: gameState,
            collisionDetector: SpyCollisionDetector()
        )

        action.perform()

        expect(gameState.occupied(position: Position(column: 2, row: 1))).to(beTrue())
        expect(gameState.occupied(position: Position(column: 3, row: 1))).to(beTrue())
        expect(gameState.occupied(position: Position(column: 3, row: 0))).to(beTrue())
        expect(gameState.occupied(position: Position(column: 4, row: 0))).to(beTrue())
    }
}
