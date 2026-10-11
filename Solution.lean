/- Copyright 2026 The Formal Conjectures Authors. Apache-2.0. -/
module

public import Mathlib.Analysis.InnerProductSpace.PiL2
public import Mathlib.Data.Finset.Prod
public import Mathlib.Data.Nat.Choose.Basic
public import Mathlib.Data.Nat.Sqrt
public import Mathlib.LinearAlgebra.AffineSpace.AffineSubspace.Defs
public import Mathlib.Order.Filter.AtTopBot.Basic

/-!
# Pending Solution for Erdős Problem 606

The theorem proof below is incomplete. This module is a preparation artifact,
not an eligible Palomar Solution. Comparator must reject its `sorryAx`
dependency. Replace the hole with a complete proof before submission.
No external proof has been imported or copied into this repository.
-/

@[expose] public section

namespace Erdos606

local notation "ℝ²" => EuclideanSpace ℝ (Fin 2)

open scoped Classical in
/-- Counts realized by $n$ distinct real planar points. -/
noncomputable def possibleLineCounts (n : ℕ) : Set ℕ :=
  {m | ∃ P : Finset ℝ², P.card = n ∧
    (P.offDiag.image fun p ↦ line[ℝ, p.1, p.2]).card = m}

/-- The $k$-th low band with its two excluded values. -/
def lineCountBand (n k : ℕ) : Set ℕ :=
  let upper := k * (n - k) + k.choose 2 + 1
  Set.Icc (k * (n - k) - k.choose 2 + 1) upper \ {upper - 1, upper - 3}

/-- The explicit eventual Erdős-Salamon classification. -/
def classifiedLineCounts (n : ℕ) : Set ℕ :=
  let k := Nat.sqrt (n + 2)
  (⋃ j < k, lineCountBand n j) ∪
    (Set.Icc (k * (n - k) - k.choose 2 + 1) (n.choose 2) \
      {n.choose 2 - 1, n.choose 2 - 3})

/-- Pending proof of the eventual classification. -/
theorem erdos_606 : possibleLineCounts =ᶠ[Filter.atTop] classifiedLineCounts := by
  sorry

end Erdos606
