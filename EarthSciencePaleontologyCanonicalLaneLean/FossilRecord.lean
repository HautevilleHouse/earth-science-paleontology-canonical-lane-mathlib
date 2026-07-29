import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthSciencePaleontologyCanonicalLaneLean

structure FossilRecordPackage where
  stratumSequence : Prop
  radiometricDating : Prop
  indexFossilCorrelation : Prop
  biostratigraphicZonation : Prop
  taphonomicBiasAccounted : Prop

structure FossilRecordEvidence (F : FossilRecordPackage) where
  stratumSequenceClosed : F.stratumSequence
  radiometricDatingClosed : F.radiometricDating
  indexFossilCorrelationClosed : F.indexFossilCorrelation
  biostratigraphicZonationClosed : F.biostratigraphicZonation
  taphonomicBiasAccountedClosed : F.taphonomicBiasAccounted

def FossilRecordClosed (F : FossilRecordPackage) : Prop :=
  F.stratumSequence ∧ F.radiometricDating ∧ F.indexFossilCorrelation ∧
  F.biostratigraphicZonation ∧ F.taphonomicBiasAccounted

theorem fossil_record_closed_from_evidence (F : FossilRecordPackage)
    (E : FossilRecordEvidence F) : FossilRecordClosed F := by
  exact And.intro E.stratumSequenceClosed
    (And.intro E.radiometricDatingClosed
      (And.intro E.indexFossilCorrelationClosed
        (And.intro E.biostratigraphicZonationClosed
          E.taphonomicBiasAccountedClosed)))

end EarthSciencePaleontologyCanonicalLaneLean
end HautevilleHouse