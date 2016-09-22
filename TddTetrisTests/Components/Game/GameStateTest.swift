import Foundation
import XCTest
import Nimble
@testable import TddTetris

class GameStateTest: XCTestCase {
    var state: GameState!

    override func setUp() {
        state = GameState()
    }

    func test_creates_arrayForGameBoard() {
        expect(self.state.cells.count).to(equal(GameState.COLUMNS))
        expect(self.state.cells[0].count).to(equal(GameState.ROWS))
    }
}
