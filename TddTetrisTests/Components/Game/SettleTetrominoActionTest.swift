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
        let gameState = GameState()
        gameState.tetromino = STetromino()

        action.perform(gameState)

        expect(gameState.tetromino).to(beNil())
    }
}