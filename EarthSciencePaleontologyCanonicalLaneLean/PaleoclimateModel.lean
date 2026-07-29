import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthSciencePaleontologyCanonicalLaneLean

structure PaleoclimateModelPackage where
  temperatureProxy : Prop
  precipitationProxy : Prop
  atmosphericComposition : Prop
  oceanCirculation : Prop
  iceSheetDynamics : Prop

structure PaleoclimateModelEvidence (P : PaleoclimateModelPackage) where
  temperatureProxyClosed : P.temperatureProxy
  precipitationProxyClosed : P.precipitationProxy
  atmosphericCompositionClosed : P.atmosphericComposition
  oceanCirculationClosed : P.oceanCirculation
  iceSheetDynamicsClosed : P.iceSheetDynamics

def PaleoclimateModelClosed (P : PaleoclimateModelPackage) : Prop :=
  P.temperatureProxy ∧ P.precipitationProxy ∧ P.atmosphericComposition ∧ P.oceanCirculation ∧ P.iceSheetDynamics

theorem paleoclimate_model_closed_from_evidence (P : PaleoclimateModelPackage) (E : PaleoclimateModelEvidence P) :
    PaleoclimateModelClosed P := by
  exact And.intro E.temperatureProxyClosed
    (And.intro E.precipitationProxyClosed
      (And.intro E.atmosphericCompositionClosed
        (And.intro E.oceanCirculationClosed E.iceSheetDynamicsClosed)))

end EarthSciencePaleontologyCanonicalLaneLean
end HautevilleHouse