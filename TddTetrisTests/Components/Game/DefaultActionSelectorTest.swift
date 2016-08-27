import XCTest
import Nimble
@testable import TddTetris

class DefaultActionSelectorTest: XCTestCase {
    var actionSelector:ActionSelector!

    override func setUp() {
        actionSelector = DefaultActionSelector()
    }

}