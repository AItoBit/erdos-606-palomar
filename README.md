# Erdos 606: Palomar Preparation

**Status: incomplete proof; not submitted to Palomar.**

This repository prepares the statement interface and submission configuration
for the Erdos-Salamon classification of the numbers of distinct lines determined
by sufficiently large finite point sets in the real plane. It adapts the
statement from [Formal Conjectures PR 7137](https://github.com/google-deepmind/formal-conjectures/pull/7137)
at commit `d638c177251b741533dc4f7a22e1eed2bb0a831b`.

The classification is eventual. Let `K = floor(sqrt(n + 2))`. Take the union of
the bands for `k < K`, with endpoints `k(n-k) - choose(k,2) + 1` and
`k(n-k) + choose(k,2) + 1`, deleting each upper endpoint minus one and minus
three. Add the interval from `K(n-K) - choose(K,2) + 1` to `choose(n,2)`, deleting
`choose(n,2) - 1` and `choose(n,2) - 3`. This union reproduces the five overlap
cases in Salamon and Erdos, pp. 132-134. No small-n classification is asserted.

## Files

- `Challenge.lean` is the small statement surface, with one deliberate proof hole.
- `Solution.lean` has the matching declarations and one **unresolved proof hole**.
- `comparator.json` compares the theorem and all three statement definitions.
- `formalization.yaml` records sources, AI assistance, review and proof status.
- `lean-toolchain` and `lake-manifest.json` pin the Lean and Mathlib dependencies.
- `.github/workflows/palomar-preflight.yml` calls Palomar's complete pinned workflow.

## Required Before Submission

1. Complete `Solution.lean` with no `sorry`, custom axiom or `native_decide`.
2. Confirm the human authors and responsible maintainers in `formalization.yaml`.
3. Update the proof status and verify the exact statement and permitted axioms.
4. Push a fixed commit and run the full Palomar preflight at that exact SHA.
5. Submit only after its mechanical report says `status: pass`.

Compilation of the draft would not satisfy step 1. The unresolved Solution proof
depends on `sorryAx`, which Comparator must reject.

An external candidate exists at
[plby/lean-proofs](https://github.com/plby/lean-proofs/blob/8822f7ddef30fadbd92e1c6ab4ed897af356af5e/src/latest/ErdosProblems/Erdos606.lean).
It has not been reused or independently verified against this Challenge. The
repository declares no license at that snapshot, and author/maintainer approval
for a Palomar submission has not been established. If that candidate is used,
preserve its attribution, obtain the necessary permission, port its dependencies,
and declare any thin-wrapper relationship honestly.

## Submission Route

Read [the requirements](https://palomar-registry.org/how-to-submit) and
[the agent protocol](https://submit.palomar-registry.org/llms.txt).
The submission host is https://submit.palomar-registry.org/.
An agent should use the documented HTTPS/tag/secret-gist protocol, not browser
sign-in. The repository, full SHA, Comparator path and authorization relationship
must be fixed before intake. Final registration publishes the reviewed record
permanently and requires the review-specific registration decision.

## Authorship and Validation

The authenticated account is `AItoBit`; its human authorship and maintainer fields
remain unconfirmed. Codex prepared this package using GPT-6; the preceding
statement development used AI assistance and a separate agent source audit.
No completed proof or human mathematical review is claimed.

The underlying FC statement was built on Lean/Mathlib 4.33.1. This Palomar package
targets 4.35.0-rc2 because Palomar requires the toolchain's bundled Comparator.
Passing checks on the older toolchain do not establish a pass on this target.

The repository snapshot is licensed under Apache-2.0. Cited sources and any
future reused proof retain their own terms.
