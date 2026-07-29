import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthSciencePaleontologyCanonicalLaneLean

structure PaleoclimatologyPackage where
  climateProxies : Type u
  temperatureReconstruction : Prop
  precipitationPatterns : Prop
  atmosphericComposition : Prop
  iceCoreData : Prop

structure PaleoclimatologyEvidence (P : PaleoclimatologyPackage) where
  temperatureReconstructionClosed : P.temperatureReconstruction
  precipitationPatternsClosed : P.precipitationPatterns
  atmosphericCompositionClosed : P.atmosphericComposition
  iceCoreDataClosed : P.iceCoreData

def PaleoclimatologyClosed (P : PaleoclimatologyPackage) : Prop :=
  P.temperatureReconstruction ∧ P.precipitationPatterns ∧ P.atmosphericComposition ∧ P.iceCoreData

theorem paleoclimatology_closed_from_evidence (P : PaleoclimatologyPackage) (E : PaleoclimatologyEvidence P) : PaleoclimatologyClosed P := by
  exact And.intro E.temperatureReconstructionClosed (And.intro E.precipitationPatternsClosed (And.intro E.atmosphericCompositionClosed E.iceCoreDataClosed))

end EarthSciencePaleontologyCanonicalLaneLean
end HautevilleHouse