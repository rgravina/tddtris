import Foundation
import XCTest
import Nimble
@testable import TddTetris

class NextTetrominoActionTest: XCTestCase {
    var action: NextTetrominoAction!
    var tetrominoGenerator: SpyTetrominoGenerator!

    override func setUp() {
        tetrominoGenerator = SpyTetrominoGenerator()
        action = NextTetrominoAction(
            view: SpyGameView(),
            tetrominoGenerator: tetrominoGenerator
        )
    }

    func test_perform_generatesNewTetromino() {
        let gameState = GameState()
        let tetromino = STetromino(position: (0, 0))
        tetrominoGenerator.next_return = tetromino

        let nextState = action.perform(gameState)

        expect(self.tetrominoGenerator.next_wasCalled).to(beTrue())
        expect(nextState.tetromino as? STetromino).toNot(beNil())
    }
}