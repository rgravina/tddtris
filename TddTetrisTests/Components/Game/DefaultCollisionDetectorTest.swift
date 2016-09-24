import XCTest
import Nimble
@testable import TddTetris

class DefaultCollisionDetectorTest: XCTestCase {
    func test_willCollide_returnsTrueWhenTetrominoReachesBottom() {
        let tetromino = STetromino(
            position: (0, 18),
            blocks: [
                (column: 0, row: 1),
                (column: 1, row: 0),
                (column: 1, row: 1),
                (column: 2, row: 0)
            ]
        )
        let gameState = GameState()
        gameState.tetromino = tetromino

        let detector = DefaultCollisionDetector(state: gameState)
        let result = detector.wouldCollide(.down)
        expect(result).to(beTrue())
    }

    func test_willCollide_returnsTrueWhenTetrominoIsObstructedDirectlyBelow() {
        let tetromino = STetromino(
            position: (0, 0),
            blocks: [
                (column: 0, row: 1),
                (column: 1, row: 0),
                (column: 1, row: 1),
                (column: 2, row: 0)
            ]
        )
        let gameState = GameState()
        gameState.tetromino = tetromino
        gameState.occupy(position: Position(column: 0, row: 2))
        let detector = DefaultCollisionDetector(state: gameState)
        let result = detector.wouldCollide(.down)

        expect(result).to(beTrue())
    }

    func test_willCollide_returnsTrueWhenTetrominoIsObstructedDirectlyLeft() {
        let tetromino = STetromino(
            position: (1, 0),
            blocks: [
                (column: 0, row: 1),
                (column: 1, row: 1),
                (column: 1, row: 0),
                (column: 2, row: 0)
            ]
        )
        let gameState = GameState()
        gameState.tetromino = tetromino
        gameState.occupy(position: Position(column: 0, row: 1))
        let detector = DefaultCollisionDetector(state: gameState)
        let result = detector.wouldCollide(.left)

        expect(result).to(beTrue())
    }
}
