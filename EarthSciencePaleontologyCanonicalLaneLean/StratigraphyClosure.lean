import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthSciencePaleontologyCanonicalLaneLean

structure StratigraphyPackage where
  rockUnits : Type u
  relativeAges : rockUnits → rockUnits → Prop
  fossils : Type v
  fossilContent : rockUnits → List fossils
  boundarySurfaces : Prop
  unconformitiesAccounted : Prop

structure StratigraphyEvidence (P : StratigraphyPackage) where
  boundarySurfacesClosed : P.boundarySurfaces
  unconformitiesAccountedClosed : P.unconformitiesAccounted

def StratigraphyClosed (P : StratigraphyPackage) : Prop :=
  P.boundarySurfaces ∧ P.unconformitiesAccounted

theorem stratigraphy_closed_from_evidence (P : StratigraphyPackage) (E : StratigraphyEvidence P) :
    StratigraphyClosed P := by
  exact And.intro E.boundarySurfacesClosed E.unconformitiesAccountedClosed

end EarthSciencePaleontologyCanonicalLaneLean
end HautevilleHouse