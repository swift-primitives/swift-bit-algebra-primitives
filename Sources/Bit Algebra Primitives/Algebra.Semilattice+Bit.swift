// Algebra.Semilattice+Bit.swift

public import Algebra_Semilattice_Primitives

/// Bit semilattice witnesses.
///
/// `Bit` forms two distinct bounded semilattices: disjunction (∨) with
/// identity `.zero` (the OR semilattice), and conjunction (∧) with identity
/// `.one` (the AND semilattice). Both are associative, commutative, and
/// idempotent — `b ∨ b == b` and `b ∧ b == b` for any `Bit`.
extension Algebra.Semilattice where Element == Bit {
    /// OR (disjunction) semilattice: identity is `.zero`, combining is `|`.
    ///
    /// Bottom (`.zero`) is below top (`.one`) in the induced order.
    @inlinable
    public static var disjunction: Self {
        .init(identity: .zero, combining: { $0 | $1 })
    }

    /// AND (conjunction) semilattice: identity is `.one`, combining is `&`.
    @inlinable
    public static var conjunction: Self {
        .init(identity: .one, combining: { $0 & $1 })
    }
}
