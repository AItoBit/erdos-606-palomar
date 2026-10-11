/- Copyright 2026 The Formal Conjectures Authors. Apache-2.0. -/
module

public import Mathlib.Analysis.InnerProductSpace.PiL2
public import Mathlib.Data.Finset.Prod
public import Mathlib.Data.Nat.Choose.Basic
public import Mathlib.Data.Nat.Sqrt
public import Mathlib.LinearAlgebra.AffineSpace.AffineSubspace.Defs
public import Mathlib.Order.Filter.AtTopBot.Basic

/-!
# Erdős Problem 606: Eventual Line-Count Classification

This Challenge states the Erdős-Salamon classification of the numbers of distinct
lines determined by sufficiently large finite point sets in the real plane.
The deliberate theorem hole is the statement of record for Comparator.

Source: P. Salamon and P. Erdős, *The solution to a problem of Grünbaum*,
Canadian Mathematical Bulletin 31 (1988), 129-138, DOI 10.4153/CMB-1988-020-2.
Statement adapted from Formal Conjectures PR 7137, commit
d638c177251b741533dc4f7a22e1eed2bb0a831b.
-/

@[expose] public section

namespace Erdos606

local notation "ℝ²" => EuclideanSpace ℝ (Fin 2)

open scoped Classical in
/-- Counts realized by $n$ distinct real planar points. Off-diagonal pairs
exclude coincident endpoints; the image counts each geometric line once. -/
noncomputable def possibleLineCounts (n : ℕ) : Set ℕ :=
  {m | ∃ P : Finset ℝ², P.card = n ∧
    (P.offDiag.image fun p ↦ line[ℝ, p.1, p.2]).card = m}

/-- The $k$-th low band from Erdős-Salamon, with its two excluded values. -/
def lineCountBand (n k : ℕ) : Set ℕ :=
  let upper := k * (n - k) + k.choose 2 + 1
  Set.Icc (k * (n - k) - k.choose 2 + 1) upper \ {upper - 1, upper - 3}

/-- Explicit eventual answer. With $K=\lfloor\sqrt{n+2}\rfloor$, combine all
bands with $k<K$ and the terminal interval, excluding the two terminal gaps. -/
def classifiedLineCounts (n : ℕ) : Set ℕ :=
  let k := Nat.sqrt (n + 2)
  (⋃ j < k, lineCountBand n j) ∪
    (Set.Icc (k * (n - k) - k.choose 2 + 1) (n.choose 2) \
      {n.choose 2 - 1, n.choose 2 - 3})

/-- For all sufficiently large $n$, the realizable line counts are exactly
the explicit Erdős-Salamon set. The paper leaves small $n$ unresolved. -/
theorem erdos_606 : possibleLineCounts =ᶠ[Filter.atTop] classifiedLineCounts := by
  sorry

end Erdos606
