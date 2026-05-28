# ``Bit_Algebra_Primitives``

@Metadata {
    @DisplayName("Bit Algebra Primitives")
    @TitleHeading("Swift Primitives")
}

Bit's algebraic structure: the Z₂ (GF(2)) field witness for `Bit`.

## Overview

This package is the integration bridge between `swift-bit-primitives` (the recipient
domain — `Bit`) and `swift-algebra-field-primitives` (the structure provider —
`Algebra.Field`). It confers algebraic structure on `Bit` without either base package
depending on the other: `Bit` gains its canonical field, and the witness is surfaced on
the recipient as ``Bit/z2``.

## Topics

### Field Witness

- ``Bit/z2``
