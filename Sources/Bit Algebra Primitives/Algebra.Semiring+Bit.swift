public import Algebra_Semiring_Primitives

extension Algebra.Semiring.Commutative where Element == Bit {

    @inlinable
    public init() {
        self.init(
            semiring: .init(
                additive: .init(monoid: .init(identity: .zero, combining: { $0 | $1 })),
                multiplicative: .init(identity: .one, combining: { $0 & $1 })
            )
        )
    }
}
