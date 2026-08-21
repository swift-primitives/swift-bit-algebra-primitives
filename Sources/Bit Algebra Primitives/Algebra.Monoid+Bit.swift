public import Algebra_Monoid_Primitives

extension Algebra.Monoid where Element == Bit {

    @inlinable
    public static var conjunction: Self {
        .init(identity: .one, combining: { $0 & $1 })
    }

    @inlinable
    public static var disjunction: Self {
        .init(identity: .zero, combining: { $0 | $1 })
    }
}
