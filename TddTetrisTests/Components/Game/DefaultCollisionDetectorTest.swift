import XCTest
import Nimble
@testable import TddTetris

class DefaultCollisionDetectorTest: XCTestCase {
    func test_willCollide_returnsTrueWhenTetrominoReachesBottom() {
        var tetromino = STetromino()
        tetromino.position = (0, 19)
        var gameState = GameState()
        gameState.tetromino = tetromino

        let detector = DefaultCollisionDetector()
        let result = detector.wouldCollide(gameState, position: tetromino.position)

        expect(result).to(beTrue())
    }

    func test_willCollide_returnsTrueWhenTetrominoIsObstructedBelow() {
        var tetromino = STetromino()
        tetromino.position = (0, 0)
        var gameState = GameState()
        gameState.tetromino = tetromino
        gameState.cells[0][1] = true
        let detector = DefaultCollisionDetector()
        let result = detector.wouldCollide(gameState, position: tetromino.position)

        expect(result).to(beTrue())
    }
}