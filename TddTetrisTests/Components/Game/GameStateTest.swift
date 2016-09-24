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
        expect(self.state.cell(position: position)).to(equal(false))
        state.allocate(position: position)
        expect(self.state.cell(position: position)).to(equal(true))
    }

    func test_freeAnAllocatedCell() {
        let position = Position(column: 0, row: 0)
        state.allocate(position: position)
        state.free(position: position)
        expect(self.state.cell(position: position)).to(equal(false))
    }


    func test_getCellOutOfBounds() {
        let position = Position(column: GameState.COLUMNS+1, row:  GameState.ROWS+1)
        expect(self.state.cell(position: position)).to(equal(false))
    }
}
