import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthSciencePaleontologyCanonicalLaneLean

structure GeochronologyPackage where
  absoluteDatingMethods : Type u
  relativeDatingMethods : Type v
  radiometricAges : Prop
  biostratigraphicCorrelation : Prop
  chronostratigraphicScale : Prop

structure GeochronologyEvidence (G : GeochronologyPackage) where
  radiometricAgesClosed : G.radiometricAges
  biostratigraphicCorrelationClosed : G.biostratigraphicCorrelation
  chronostratigraphicScaleClosed : G.chronostratigraphicScale

def GeochronologyClosed (G : GeochronologyPackage) : Prop :=
  G.radiometricAges ∧ G.biostratigraphicCorrelation ∧ G.chronostratigraphicScale

theorem geochronology_closed_from_evidence (G : GeochronologyPackage) (E : GeochronologyEvidence G) : GeochronologyClosed G := by
  exact And.intro E.radiometricAgesClosed (And.intro E.biostratigraphicCorrelationClosed E.chronostratigraphicScaleClosed)

end EarthSciencePaleontologyCanonicalLaneLean
end HautevilleHouse