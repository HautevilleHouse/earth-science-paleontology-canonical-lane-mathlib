import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthSciencePaleontologyCanonicalLaneLean

structure PaleoclimatologyPackage where
  proxyRecords : Type u
  climateForcingFactors : List String
  glacialInterglacialCycles : Prop
  isotopeStratigraphy : Prop
  seaLevelChanges : Prop

structure PaleoclimatologyEvidence (P : PaleoclimatologyPackage) where
  glacialInterglacialCyclesClosed : P.glacialInterglacialCycles
  isotopeStratigraphyClosed : P.isotopeStratigraphy
  seaLevelChangesClosed : P.seaLevelChanges

def PaleoclimatologyClosed (P : PaleoclimatologyPackage) : Prop :=
  P.glacialInterglacialCycles ∧ P.isotopeStratigraphy ∧ P.seaLevelChanges

theorem paleoclimatology_closed_from_evidence (P : PaleoclimatologyPackage) (E : PaleoclimatologyEvidence P) : PaleoclimatologyClosed P := by
  exact And.intro E.glacialInterglacialCyclesClosed (And.intro E.isotopeStratigraphyClosed E.seaLevelChangesClosed)

end EarthSciencePaleontologyCanonicalLaneLean
end HautevilleHouse