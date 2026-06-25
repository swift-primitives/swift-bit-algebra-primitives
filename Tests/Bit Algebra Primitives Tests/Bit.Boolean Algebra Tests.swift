import Bit_Algebra_Primitives
import Testing

@Suite("Bit Boolean Algebra")
struct BitBooleanAlgebraTests {
    @Suite struct Monoid {}
    @Suite struct Semiring {}
    @Suite struct Semilattice {}
    @Suite struct Lattice {}
}

// MARK: - Monoid

extension BitBooleanAlgebraTests.Monoid {
    @Test
    func `conjunction monoid has identity one and combines with AND`() {
        let m = Algebra.Monoid<Bit>.conjunction
        #expect(m.identity == .one)
        #expect(m.combining(.one, .one) == .one)
        #expect(m.combining(.one, .zero) == .zero)
        #expect(m.combining(.zero, .zero) == .zero)
    }

    @Test
    func `disjunction monoid has identity zero and combines with OR`() {
        let m = Algebra.Monoid<Bit>.disjunction
        #expect(m.identity == .zero)
        #expect(m.combining(.zero, .zero) == .zero)
        #expect(m.combining(.one, .zero) == .one)
        #expect(m.combining(.one, .one) == .one)
    }
}

// MARK: - Semiring

extension BitBooleanAlgebraTests.Semiring {
    @Test
    func `boolean semiring zero is .zero and one is .one`() {
        let sr = Algebra.Semiring<Bit>.Commutative()
        #expect(sr.zero == .zero)
        #expect(sr.one == .one)
    }

    @Test
    func `boolean semiring adds with OR and multiplies with AND`() {
        let sr = Algebra.Semiring<Bit>.Commutative()
        #expect(sr.adding(.zero, .one) == .one)
        #expect(sr.adding(.zero, .zero) == .zero)
        #expect(sr.multiplying(.one, .one) == .one)
        #expect(sr.multiplying(.one, .zero) == .zero)
    }
}

// MARK: - Semilattice

extension BitBooleanAlgebraTests.Semilattice {
    @Test
    func `disjunction semilattice has identity zero`() {
        let or = Algebra.Semilattice<Bit>.disjunction
        #expect(or.identity == .zero)
        #expect(or.combining(.one, .zero) == .one)
        #expect(or.combining(.zero, .zero) == .zero)
    }

    @Test
    func `conjunction semilattice has identity one`() {
        let and = Algebra.Semilattice<Bit>.conjunction
        #expect(and.identity == .one)
        #expect(and.combining(.one, .zero) == .zero)
        #expect(and.combining(.one, .one) == .one)
    }

    @Test
    func `disjunction is idempotent`() {
        let or = Algebra.Semilattice<Bit>.disjunction
        #expect(or.combining(.one, .one) == .one)
        #expect(or.combining(.zero, .zero) == .zero)
    }

    @Test
    func `callAsFunction and join alias combining`() {
        let or = Algebra.Semilattice<Bit>.disjunction
        #expect(or(.one, .zero) == or.combining(.one, .zero))
        let and = Algebra.Semilattice<Bit>.conjunction
        #expect(and.join(.one, .one) == and.combining(.one, .one))
    }
}

// MARK: - Lattice

extension BitBooleanAlgebraTests.Lattice {
    @Test
    func `bit lattice: join is OR, meet is AND`() {
        let l = Algebra.Lattice<Bit>()
        #expect(l.join(.zero, .one) == .one)
        #expect(l.join(.zero, .zero) == .zero)
        #expect(l.meet(.one, .zero) == .zero)
        #expect(l.meet(.one, .one) == .one)
    }

    @Test
    func `bit lattice bounds: bottom zero, top one`() {
        let l = Algebra.Lattice<Bit>()
        #expect(l.bottom == .zero)
        #expect(l.top == .one)
    }

    @Test
    func `bit lattice absorption holds`() {
        let l = Algebra.Lattice<Bit>()
        for a in [Bit.zero, .one] {
            for b in [Bit.zero, .one] {
                #expect(l.join(a, l.meet(a, b)) == a)
                #expect(l.meet(a, l.join(a, b)) == a)
            }
        }
    }

    // `Bit` IS a two-element Boolean algebra: the lattice + the native `~`
    // complement. There is no `Algebra.Boolean` witness type (mirrors the
    // `Swift.Bool` treatment in `swift-bool-algebra-primitives`).
    @Test
    func `bit complement laws via native ~ over the bit lattice`() {
        let l = Algebra.Lattice<Bit>()
        for a in [Bit.zero, .one] {
            #expect(l.join(a, ~a) == l.top)  // a ∨ ¬a = ⊤
            #expect(l.meet(a, ~a) == l.bottom)  // a ∧ ¬a = ⊥
        }
    }

    @Test
    func `bit distributivity over the bit lattice`() {
        let l = Algebra.Lattice<Bit>()
        for a in [Bit.zero, .one] {
            for b in [Bit.zero, .one] {
                for c in [Bit.zero, .one] {
                    #expect(l.meet(a, l.join(b, c)) == l.join(l.meet(a, b), l.meet(a, c)))
                }
            }
        }
    }
}
