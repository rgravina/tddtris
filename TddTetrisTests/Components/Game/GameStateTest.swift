import Foundation
import XCTest
import Nimble
@testable import TddTetris

class GameStateTest: XCTestCase {
    var state: GameState!

    override func setUp() {
        state = GameState()
    }

    func test_setAndGetCellStatus() {
        let position = Position(column: 0, row: 0)
        expect(self.state.occupied(position: position)).to(equal(false))
        state.occupy(position: position)
        expect(self.state.occupied(position: position)).to(equal(true))
    }

    func test_freeAnOccupiedCell() {
        let position = Position(column: 0, row: 0)
        state.occupy(position: position)
        state.free(position: position)
        expect(self.state.occupied(position: position)).to(equal(false))
    }


    func test_getCellOutOfBounds() {
        let position = Position(column: GameState.COLUMNS+1, row:  GameState.ROWS+1)
        expect(self.state.occupied(position: position)).to(equal(true))
    }
}
