import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthSciencePaleontologyCanonicalLaneLean

structure PaleoenvironmentPackage where
  sedimentology : Prop
  geochemistry : Prop
  paleoecology : Prop
  basinAnalysis : Prop

structure PaleoenvironmentEvidence (P : PaleoenvironmentPackage) where
  sedimentologyClosed : P.sedimentology
  geochemistryClosed : P.geochemistry
  paleoecologyClosed : P.paleoecology
  basinAnalysisClosed : P.basinAnalysis

def PaleoenvironmentClosed (P : PaleoenvironmentPackage) : Prop :=
  P.sedimentology ∧ P.geochemistry ∧ P.paleoecology ∧ P.basinAnalysis

theorem paleoenvironment_closed_from_evidence (P : PaleoenvironmentPackage) (E : PaleoenvironmentEvidence P) :
    PaleoenvironmentClosed P := by
  exact And.intro E.sedimentologyClosed
    (And.intro E.geochemistryClosed
      (And.intro E.paleoecologyClosed E.basinAnalysisClosed))

end EarthSciencePaleontologyCanonicalLaneLean
end HautevilleHouse