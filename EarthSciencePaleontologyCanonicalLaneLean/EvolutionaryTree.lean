import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthSciencePaleontologyCanonicalLaneLean

structure EvolutionaryTree where
  nodeId : Type u
  parent : nodeId → Option nodeId
  branchLength : nodeId → ℝ
  geneticDistance : nodeId → nodeId → ℝ
  fossilCalibration : nodeId → ℝ
  divergenceTime : nodeId → ℝ

default TreeDepth (T : EvolutionaryTree) : ℕ := 0  -- place for recursion

structure EvolutionaryTreeEvidence (T : EvolutionaryTree) where
  parentChainFinite : ∀ n : T.nodeId, ∃ k : ℕ, (Function.iterate T.parent k) n = none
  branchLengthPositive : ∀ n : T.nodeId, T.branchLength n > 0
  geneticDistanceSymmetric : ∀ n m : T.nodeId, T.geneticDistance n m = T.geneticDistance m n
  calibrationBeforeDivergence : ∀ n : T.nodeId, T.fossilCalibration n ≤ T.divergenceTime n

def EvolutionaryTreeClosed (T : EvolutionaryTree) : Prop :=
  (∀ n : T.nodeId, ∃ k : ℕ, (Function.iterate T.parent k) n = none) ∧
  (∀ n : T.nodeId, T.branchLength n > 0) ∧
  (∀ n m : T.nodeId, T.geneticDistance n m = T.geneticDistance m n) ∧
  (∀ n : T.nodeId, T.fossilCalibration n ≤ T.divergenceTime n)

theorem evolutionary_tree_closed_from_evidence (T : EvolutionaryTree) (E : EvolutionaryTreeEvidence T) :
    EvolutionaryTreeClosed T := by
  exact And.intro E.parentChainFinite (And.intro E.branchLengthPositive (And.intro E.geneticDistanceSymmetric E.calibrationBeforeDivergence))

end EarthSciencePaleontologyCanonicalLaneLean
end HautevilleHouse