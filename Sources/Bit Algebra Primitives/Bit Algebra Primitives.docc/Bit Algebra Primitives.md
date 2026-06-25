# ``Bit_Algebra_Primitives``

@Metadata {
    @DisplayName("Bit Algebra Primitives")
    @TitleHeading("Swift Primitives")
}

Bit's algebraic structure: the ℤ/2ℤ (GF(2)) field and the Boolean-algebra witnesses
(lattice, semiring, semilattice, monoid) for `Bit`.

## Overview

This package is the integration bridge between `swift-bit-primitives` (the recipient
domain — `Bit`) and the `swift-algebra-primitives` structure family (the providers —
`Algebra.Field`, `Algebra.Lattice`, `Algebra.Semiring`, `Algebra.Semilattice`,
`Algebra.Monoid`). It confers algebraic structure on `Bit` without either base package
depending on the other.

`Bit` carries two distinct, complementary structures:

- **The ℤ/2ℤ field** (``Bit/z2``): addition is XOR (`^`), multiplication is AND (`&`);
  every element is its own additive inverse.
- **The Boolean algebra**: the bounded lattice `Algebra.Lattice<Bit>()` (join = OR `|`,
  meet = AND `&`, bottom `.zero`, top `.one`) plus the native complement `~`, together
  with the OR/AND semiring, the disjunction/conjunction semilattices, and the
  conjunction/disjunction monoids. There is **no** `Algebra.Boolean` type — `Bit` *is*
  the two-element Boolean algebra, extended directly (mirroring how `Swift.Bool` is
  treated in `swift-bool-algebra-primitives`).

## Topics

### Field Witness

- ``Bit/z2``

### Boolean-Algebra Witnesses

`Bit`'s Boolean-algebra structure is exposed as witnesses on the provider types,
constrained to `Element == Bit`:

- `Algebra.Lattice<Bit>()` — the bounded lattice (join = `|`, meet = `&`).
- `Algebra.Semiring<Bit>.Commutative()` — the OR/AND commutative semiring.
- `Algebra.Semilattice<Bit>.disjunction` / `.conjunction` — the OR / AND semilattices.
- `Algebra.Monoid<Bit>.disjunction` / `.conjunction` — the OR / AND monoids.

The complement is the native `~` from `Bit Primitive`; `a | ~a == .one` and
`a & ~a == .zero` complete the Boolean algebra over the lattice.
