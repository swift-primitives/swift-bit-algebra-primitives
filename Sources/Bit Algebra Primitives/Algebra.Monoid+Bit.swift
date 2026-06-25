// Algebra.Monoid+Bit.swift

public import Algebra_Monoid_Primitives

/// Bit monoid witnesses.
///
/// `Bit` forms monoids under both conjunction and disjunction.
extension Algebra.Monoid where Element == Bit {
    /// AND monoid: identity is `.one`, combining is conjunction (`&`).
    @inlinable
    public static var conjunction: Self {
        .init(identity: .one, combining: { $0 & $1 })
    }

    /// OR monoid: identity is `.zero`, combining is disjunction (`|`).
    @inlinable
    public static var disjunction: Self {
        .init(identity: .zero, combining: { $0 | $1 })
    }
}
