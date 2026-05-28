// Bit+Z2.swift

extension Bit {
    /// The Z₂ field (GF(2)) over `Bit`.
    ///
    /// `Bit` is the two-element field 𝔽₂ ≅ ℤ/2ℤ — the smallest field:
    /// - Addition is XOR (`^`): `0+0=0`, `0+1=1`, `1+0=1`, `1+1=0`; identity `.zero`.
    /// - Multiplication is AND (`&`): `0·0=0`, `0·1=0`, `1·0=0`, `1·1=1`; identity `.one`.
    /// - Every element is its own additive inverse (`a + a = 0`).
    /// - `.one` is its own reciprocal; `.zero` has no multiplicative inverse.
    @inlinable
    public static var z2: Algebra.Field<Self> {
        .init(
            additive: .init(
                group: .init(
                    identity: .zero,
                    combining: { $0 ^ $1 },
                    inverting: { $0 }
                )
            ),
            multiplicative: .init(
                monoid: .init(
                    identity: .one,
                    combining: { $0 & $1 }
                )
            ),
            reciprocal: { (element: Bit) throws(Algebra.Field<Bit>.Error) -> Bit in
                guard element == .one else { throw .nonInvertible }
                return element
            }
        )
    }
}
