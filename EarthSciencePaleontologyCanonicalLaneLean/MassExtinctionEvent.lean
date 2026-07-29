import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthSciencePaleontologyCanonicalLaneLean

structure ExtinctionEventPackage where
  boundaryLayer : Prop
  biodiversityDrop : Prop
  climateShift : Prop
  impactEvidence : Prop

structure ExtinctionEventEvidence (E : ExtinctionEventPackage) where
  boundaryLayerClosed : E.boundaryLayer
  biodiversityDropClosed : E.biodiversityDrop
  climateShiftClosed : E.climateShift
  impactEvidenceClosed : E.impactEvidence

def ExtinctionEventClosed (E : ExtinctionEventPackage) : Prop :=
  E.boundaryLayer ∧ E.biodiversityDrop ∧ E.climateShift ∧ E.impactEvidence

theorem extinction_event_closed_from_evidence (E : ExtinctionEventPackage) (Ev : ExtinctionEventEvidence E) :
    ExtinctionEventClosed E := by
  exact And.intro Ev.boundaryLayerClosed
    (And.intro Ev.biodiversityDropClosed
      (And.intro Ev.climateShiftClosed Ev.impactEvidenceClosed))

end EarthSciencePaleontologyCanonicalLaneLean
end HautevilleHouse