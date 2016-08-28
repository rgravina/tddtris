import XCTest
import Nimble
@testable import TddTetris

class DefaultCollisionDetectorTest: XCTestCase {
    func test_willCollide_returnsTrueWhenTetrominoReachesBottom() {
        var tetromino = STetromino()
        tetromino.position = (0, 18)
        var gameState = GameState()
        gameState.tetromino = tetromino

        let detector = DefaultCollisionDetector()
        let result = detector.wouldCollide(gameState, position: tetromino.position)

        expect(result).to(beTrue())
    }
}