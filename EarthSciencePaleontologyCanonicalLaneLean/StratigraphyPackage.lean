import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthSciencePaleontologyCanonicalLaneLean

structure StratigraphyPackage where
  stratigraphicColumn : Type u
  layerThickness : stratigraphicColumn → ℕ
  fossilAssemblage : stratigraphicColumn → Type v
  biostratigraphicZonation : Prop
  lithostratigraphicCorrelation : Prop
  chronostratigraphicCalibration : Prop

structure StratigraphyEvidence (S : StratigraphyPackage) where
  biostratigraphicZonationClosed : S.biostratigraphicZonation
  lithostratigraphicCorrelationClosed : S.lithostratigraphicCorrelation
  chronostratigraphicCalibrationClosed : S.chronostratigraphicCalibration

def StratigraphyClosed (S : StratigraphyPackage) : Prop :=
  S.biostratigraphicZonation ∧ S.lithostratigraphicCorrelation ∧ S.chronostratigraphicCalibration

theorem stratigraphy_closed_from_evidence (S : StratigraphyPackage) (E : StratigraphyEvidence S) : StratigraphyClosed S := by
  exact And.intro E.biostratigraphicZonationClosed (And.intro E.lithostratigraphicCorrelationClosed E.chronostratigraphicCalibrationClosed)

end EarthSciencePaleontologyCanonicalLaneLean
end HautevilleHouse