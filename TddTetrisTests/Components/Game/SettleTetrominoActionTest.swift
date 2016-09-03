import Foundation
import XCTest
import Nimble
@testable import TddTetris

class SettleTetrominoActionTest: XCTestCase {
    func test_perform_clearsTetromino() {
        let gameState = GameState()
        gameState.tetromino = STetromino()

        let action = SettleTetrominoAction(
            state: gameState
        )
        action.perform()

        expect(gameState.tetromino).to(beNil())
    }
}