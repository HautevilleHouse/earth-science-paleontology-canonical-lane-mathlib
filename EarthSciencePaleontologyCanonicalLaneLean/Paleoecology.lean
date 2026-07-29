import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthSciencePaleontologyCanonicalLaneLean

structure PaleoecologyPackage where
  paleoenvironment : Type u
  trophicWeb : List (String × String)
  ecologicalSuccession : Prop
  nichePartitioning : Prop
  extinctionRecoveryPattern : Prop

structure PaleoecologyEvidence (P : PaleoecologyPackage) where
  ecologicalSuccessionClosed : P.ecologicalSuccession
  nichePartitioningClosed : P.nichePartitioning
  extinctionRecoveryPatternClosed : P.extinctionRecoveryPattern

def PaleoecologyClosed (P : PaleoecologyPackage) : Prop :=
  P.ecologicalSuccession ∧ P.nichePartitioning ∧ P.extinctionRecoveryPattern

theorem paleoecology_closed_from_evidence (P : PaleoecologyPackage) (E : PaleoecologyEvidence P) : PaleoecologyClosed P := by
  exact And.intro E.ecologicalSuccessionClosed (And.intro E.nichePartitioningClosed E.extinctionRecoveryPatternClosed)

end EarthSciencePaleontologyCanonicalLaneLean
end HautevilleHouse