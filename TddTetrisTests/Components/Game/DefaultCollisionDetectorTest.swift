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
        let result = detector.wouldCollide(.DOWN)
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
        gameState.cells[0][2] = true
        let detector = DefaultCollisionDetector(state: gameState)
        let result = detector.wouldCollide(.DOWN)

        expect(result).to(beTrue())
    }

    func test_willCollide_returnsTrueWhenTetrominoIsObstructedDirectlyLeft() {
        let tetromino = STetromino(
            position: (1, 0),
            blocks: [
                (column: 1, row: 1),
                (column: 2, row: 0),
                (column: 2, row: 1),
                (column: 1, row: 0)
            ]
        )
        let gameState = GameState()
        gameState.tetromino = tetromino
        gameState.cells[0][1] = true
        let detector = DefaultCollisionDetector(state: gameState)
        let result = detector.wouldCollide(.LEFT)

        expect(result).to(beTrue())
    }
}
