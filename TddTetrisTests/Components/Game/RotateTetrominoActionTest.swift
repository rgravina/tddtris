import Foundation
import XCTest
import Nimble
@testable import TddTetris

class RotateTetrominoActionTest: XCTestCase {
    var spyGameView: SpyGameView!
    var gameState: GameState!
    var spyTetromino: SpyTetromino!
    var spyCollisionDetector: SpyCollisionDetector!

    override func setUp() {
        spyGameView = SpyGameView()
        gameState = GameState()
        spyTetromino = SpyTetromino()
        spyCollisionDetector = SpyCollisionDetector()
    }

    func test_perform_rotatesTetrominoWhenNoRotateCollision() {
        spyTetromino.rotate_returnValue = spyTetromino
        gameState.tetromino = spyTetromino
        let rotatedTetromino = STetromino()
        spyTetromino.rotate_returnValue = rotatedTetromino
        spyCollisionDetector.canRotate_returnValue = true

        let action = RotateTetrominoAction(
            view: spyGameView,
            state: gameState,
            collisionDetector: spyCollisionDetector
        )

        action.perform()

        expect(self.spyCollisionDetector.canRotate_wasCalled).to(beTrue())
        expect(self.spyTetromino.rotate_wasCalled).to(beTrue())
        expect(self.spyGameView.move_wasCalled).to(beTrue())
        expect(self.gameState.tetromino as? STetromino).toNot(beNil())
    }

    func test_perform_doesNotRotateTetrominoWhenCollision() {
        spyTetromino.rotate_returnValue = spyTetromino
        gameState.tetromino = spyTetromino
        spyCollisionDetector.canRotate_returnValue = false

        let action = RotateTetrominoAction(
            view: spyGameView,
            state: gameState,
            collisionDetector: spyCollisionDetector
        )

        action.perform()

        expect(self.spyCollisionDetector.canRotate_wasCalled).to(beTrue())
        expect(self.spyTetromino.rotate_wasCalled).to(beFalse())
        expect(self.spyGameView.move_wasCalled).to(beFalse())
    }
}
