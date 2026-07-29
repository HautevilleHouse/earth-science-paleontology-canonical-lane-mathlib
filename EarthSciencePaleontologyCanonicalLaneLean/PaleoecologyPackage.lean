import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthSciencePaleontologyCanonicalLaneLean

structure PaleoecologyPackage where
  fossilAssemblage : Type u
  trophicStructure : Prop
  ecologicalInteractions : Prop
  paleoenvironmentalReconstruction : Prop
  biodiversityMetrics : Prop

structure PaleoecologyEvidence (P : PaleoecologyPackage) where
  trophicStructureClosed : P.trophicStructure
  ecologicalInteractionsClosed : P.ecologicalInteractions
  paleoenvironmentalReconstructionClosed : P.paleoenvironmentalReconstruction
  biodiversityMetricsClosed : P.biodiversityMetrics

def PaleoecologyClosed (P : PaleoecologyPackage) : Prop :=
  P.trophicStructure ∧ P.ecologicalInteractions ∧ P.paleoenvironmentalReconstruction ∧ P.biodiversityMetrics

theorem paleoecology_closed_from_evidence (P : PaleoecologyPackage) (E : PaleoecologyEvidence P) : PaleoecologyClosed P := by
  exact And.intro E.trophicStructureClosed (And.intro E.ecologicalInteractionsClosed (And.intro E.paleoenvironmentalReconstructionClosed E.biodiversityMetricsClosed))

end EarthSciencePaleontologyCanonicalLaneLean
end HautevilleHouse