import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthSciencePaleontologyCanonicalLaneLean

structure FossilRecordAssemblage where
  taxa : Type u
  occurrences : taxa → Nat → Prop
  stratigraphicRange : taxa → (Nat × Nat)
  firstAppearance : taxa → Nat
  lastAppearance : taxa → Nat
  diversityCurve : Nat → Nat
  extinctionEvents : List Nat

structure FossilRecordEvidence (F : FossilRecordAssemblage) where
  rangeConsistencyClosed : ∀ t : F.taxa, F.firstAppearance t ≤ F.lastAppearance t
  diversityCurveConsistent : ∀ n : Nat, F.diversityCurve n = (F.occurrences · n).length
  extinctionEventListed : ∀ n ∈ F.extinctionEvents, F.diversityCurve n = 0

def FossilRecordClosed (F : FossilRecordAssemblage) : Prop :=
  (∀ t : F.taxa, F.firstAppearance t ≤ F.lastAppearance t) ∧
  (∀ n : Nat, F.diversityCurve n = (F.occurrences · n).length) ∧
  (∀ n ∈ F.extinctionEvents, F.diversityCurve n = 0)

theorem fossil_record_closed_from_evidence (F : FossilRecordAssemblage) (E : FossilRecordEvidence F) :
    FossilRecordClosed F := by
  exact And.intro E.rangeConsistencyClosed (And.intro E.diversityCurveConsistent E.extinctionEventListed)

end EarthSciencePaleontologyCanonicalLaneLean
end HautevilleHouse