import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthSciencePaleontologyCanonicalLaneLean

structure StratigraphyPackage where
  fossilAssemblage : Type u
  strataSequence : List (ℕ × String)
  indexFossils : List String
  biozoneResolution : Prop
  radiometricCalibration : Prop
  sequenceStratigraphyCorrelation : Prop

structure StratigraphyEvidence (S : StratigraphyPackage) where
  biozoneResolutionClosed : S.biozoneResolution
  radiometricCalibrationClosed : S.radiometricCalibration
  sequenceStratigraphyCorrelationClosed : S.sequenceStratigraphyCorrelation

def StratigraphyClosed (S : StratigraphyPackage) : Prop :=
  S.biozoneResolution ∧ S.radiometricCalibration ∧ S.sequenceStratigraphyCorrelation

theorem stratigraphy_closed_from_evidence (S : StratigraphyPackage) (E : StratigraphyEvidence S) : StratigraphyClosed S := by
  exact And.intro E.biozoneResolutionClosed (And.intro E.radiometricCalibrationClosed E.sequenceStratigraphyCorrelationClosed)

end EarthSciencePaleontologyCanonicalLaneLean
end HautevilleHouse