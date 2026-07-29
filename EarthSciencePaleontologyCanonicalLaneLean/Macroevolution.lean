import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthSciencePaleontologyCanonicalLaneLean

structure MacroevolutionPackage where
  speciationRates : Type u
  extinctionEvents : List String
  adaptiveLandscape : Prop
  turnoverPulses : Prop
  diversityDynamics : Prop

structure MacroevolutionEvidence (M : MacroevolutionPackage) where
  adaptiveLandscapeClosed : M.adaptiveLandscape
  turnoverPulsesClosed : M.turnoverPulses
  diversityDynamicsClosed : M.diversityDynamics

def MacroevolutionClosed (M : MacroevolutionPackage) : Prop :=
  M.adaptiveLandscape ∧ M.turnoverPulses ∧ M.diversityDynamics

theorem macroevolution_closed_from_evidence (M : MacroevolutionPackage) (E : MacroevolutionEvidence M) : MacroevolutionClosed M := by
  exact And.intro E.adaptiveLandscapeClosed (And.intro E.turnoverPulsesClosed E.diversityDynamicsClosed)

end EarthSciencePaleontologyCanonicalLaneLean
end HautevilleHouse