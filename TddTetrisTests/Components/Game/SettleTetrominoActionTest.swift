import Foundation
import XCTest
import Nimble
@testable import TddTetris

class SettleTetrominoActionTest: XCTestCase {
    var action: SettleTetrominoAction!

    override func setUp() {
        action = SettleTetrominoAction()
    }

    func test_perform_clearsTetromino() {
        var gameState = GameState()
        gameState.tetromino = STetromino(position: (0, 0))

        let nextState = action.perform(gameState)

        expect(nextState.tetromino).to(beNil())
    }
}