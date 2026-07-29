import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthSciencePaleontologyCanonicalLaneLean

structure MassExtinctionBoundary where
  boundaryId : String
  boundaryAge : ℝ
  preExtinctionDiversity : ℕ
  postExtinctionDiversity : ℕ
  survivingTaxa : List String
  causalMechanism : String
  geochemicalAnomaly : Bool

default SurvivingFraction (M : MassExtinctionBoundary) : ℝ :=
  (M.postExtinctionDiversity : ℝ) / (M.preExtinctionDiversity : ℝ)

structure MassExtinctionEvidence (M : MassExtinctionBoundary) where
  extinctionMagnitudeCheck : M.postExtinctionDiversity < M.preExtinctionDiversity
  causalMechanismProvided : M.causalMechanism ≠ ""
  geochemicalAnomalyConsistent : M.geochemicalAnomaly ↔ (M.survivingTaxa.length < M.preExtinctionDiversity)

def MassExtinctionBoundaryClosed (M : MassExtinctionBoundary) : Prop :=
  M.postExtinctionDiversity < M.preExtinctionDiversity ∧
  M.causalMechanism ≠ "" ∧
  (M.geochemicalAnomaly ↔ (M.survivingTaxa.length < M.preExtinctionDiversity))

theorem mass_extinction_closed_from_evidence (M : MassExtinctionBoundary) (E : MassExtinctionEvidence M) :
    MassExtinctionBoundaryClosed M := by
  exact And.intro E.extinctionMagnitudeCheck (And.intro E.causalMechanismProvided E.geochemicalAnomalyConsistent)

end EarthSciencePaleontologyCanonicalLaneLean
end HautevilleHouse