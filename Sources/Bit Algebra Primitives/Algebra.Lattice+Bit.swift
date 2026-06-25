// Algebra.Lattice+Bit.swift

public import Algebra_Lattice_Primitives

/// Bit lattice witness.
///
/// `Bit` forms the two-element bounded lattice: join (∨) is disjunction with
/// bottom `.zero`, meet (∧) is conjunction with top `.one`. It is the lattice
/// underlying the two-element Boolean algebra. Built from the disjunction /
/// conjunction semilattices.
extension Algebra.Lattice where Element == Bit {
    /// The `Bit` lattice: join is disjunction, meet is conjunction.
    ///
    /// Join's bottom is `.zero`; meet's top is `.one`. `Bit` has a *unique*
    /// bounded lattice, so this is a plain initializer — `Algebra.Lattice<Bit>()`.
    @inlinable
    public init() {
        self.init(join: .disjunction, meet: .conjunction)
    }
}
