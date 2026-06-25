# Bit Algebra Primitives

![Development Status](https://img.shields.io/badge/status-active--development-blue.svg)

Algebraic-structure witnesses for `Bit` — the GF(2) field `Bit.z2`, plus monoid, commutative-semiring, semilattice, and lattice witnesses for its Boolean OR/AND structure.

---

## Quick Start

`Bit` is the smallest nontrivial algebra: the two-element field 𝔽₂ ≅ ℤ/2ℤ. This package supplies that structure as concrete `Algebra` witness values you can pass to generic code — addition as XOR, multiplication as AND, and the full GF(2) field with reciprocals.

```swift
import Bit_Algebra_Primitives

// `Bit` is the two-element field 𝔽₂ (GF(2)): + is XOR, × is AND.
let field = Bit.z2
print(field.adding(.one, .one))        // .zero  — every element is its own additive inverse
print(field.multiplying(.one, .one))   // .one

// `.one` is its own reciprocal; `.zero` is non-invertible and throws.
let inverse = try field.reciprocal(.one)   // .one
```

The same `Bit` also carries Boolean OR/AND structure, exposed as reusable monoid, semiring, semilattice, and lattice witnesses:

```swift
import Bit_Algebra_Primitives

// The two-element bounded lattice: join is disjunction (∨), meet is conjunction (∧).
let lattice = Algebra.Lattice<Bit>()
print(lattice.join(.zero, .one))   // .one   — ∨, bottom = .zero
print(lattice.meet(.one, .one))    // .one   — ∧, top = .one

// Monoid, commutative-semiring, and semilattice witnesses are available too:
let or = Algebra.Monoid<Bit>.disjunction            // identity .zero, combining |
let semiring = Algebra.Semiring<Bit>.Commutative()  // + = OR, × = AND
print(or.combining(.one, .zero))                    // .one
print(semiring.multiplying(.one, .zero))            // .zero
```

The Boolean OR/AND semiring and the ℤ/2ℤ (XOR/AND) field are distinct structures over the same type: the semiring's addition is OR, the field's addition is XOR. Both are provided so each can be selected explicitly.

---

## Installation

```swift
dependencies: [
    .package(url: "https://github.com/swift-primitives/swift-bit-algebra-primitives.git", branch: "main")
]
```

```swift
.target(
    name: "App",
    dependencies: [
        .product(name: "Bit Algebra Primitives", package: "swift-bit-algebra-primitives"),
    ]
)
```

Requires Swift 6.3.1 and macOS 26 / iOS 26 / tvOS 26 / watchOS 26 / visionOS 26 (or the matching Linux / Windows toolchain).

---

## Architecture

Composes the `Algebra` witness types from swift-algebra-primitives with `Bit` from swift-bit-primitives. Two library products.

| Product | Target | Purpose |
|---------|--------|---------|
| `Bit Algebra Primitives` | `Sources/Bit Algebra Primitives/` | Algebraic-structure witnesses over `Bit`: the `Bit.z2` GF(2) field; `Algebra.Monoid<Bit>` (`conjunction`, `disjunction`); the `Algebra.Semiring<Bit>.Commutative` Boolean OR/AND semiring; `Algebra.Semilattice<Bit>` (`disjunction`, `conjunction`); and the two-element `Algebra.Lattice<Bit>`. |
| `Bit Algebra Primitives Test Support` | `Tests/Support/` | Re-exports the main target for test consumers. |

Foundation-free.

---

## Platform Support

| Platform | Status |
|----------|--------|
| macOS 26 | Full support |
| Linux | Full support |
| Windows | Full support |
| iOS / tvOS / watchOS / visionOS | Supported |

---

## Community

<!-- BEGIN: discussion -->
<!-- Discussion thread created at publication. -->
<!-- END: discussion -->

## License

Apache 2.0. See [LICENSE.md](LICENSE.md).
