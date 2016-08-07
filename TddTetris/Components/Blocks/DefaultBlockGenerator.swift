import SpriteKit

class DefaultBlockGenerator: BlockGenerator {
    func nextBlock() -> Block {
        return SBlock()
    }
}