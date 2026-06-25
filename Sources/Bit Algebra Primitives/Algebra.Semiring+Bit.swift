// Algebra.Semiring+Bit.swift

public import Algebra_Semiring_Primitives

/// Boolean OR/AND semiring on `Bit`.
///
/// `Bit` forms a commutative semiring under:
/// - Addition: OR (disjunction), identity: `.zero`
/// - Multiplication: AND (conjunction), identity: `.one`
/// - Distributivity: `a & (b | c) == (a & b) | (a & c)`
/// - Zero annihilation: `.zero & a == .zero`
///
/// This is the Boolean (OR/AND) semiring — distinct from the ℤ/2ℤ (XOR/AND)
/// field witness ``Bit/z2``, whose addition is XOR and which additionally has
/// additive inverses.
extension Algebra.Semiring.Commutative where Element == Bit {
    /// The Boolean OR/AND (commutative) semiring on `Bit`.
    ///
    /// Addition is OR (identity `.zero`); multiplication is AND (identity
    /// `.one`). `Bit` has a unique such semiring, so this is a plain
    /// initializer — `Algebra.Semiring<Bit>.Commutative()`.
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
