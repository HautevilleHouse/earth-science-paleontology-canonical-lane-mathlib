import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthSciencePaleontologyCanonicalLaneLean

structure BiogeographyPackage where
  paleobiogeographicProvinces : List String
  dispersalRoutes : List (String × String)
  vicarianceEvents : Prop
  endemismPatterns : Prop
  climateDrivers : Prop

structure BiogeographyEvidence (B : BiogeographyPackage) where
  vicarianceEventsClosed : B.vicarianceEvents
  endemismPatternsClosed : B.endemismPatterns
  climateDriversClosed : B.climateDrivers

def BiogeographyClosed (B : BiogeographyPackage) : Prop :=
  B.vicarianceEvents ∧ B.endemismPatterns ∧ B.climateDrivers

theorem biogeography_closed_from_evidence (B : BiogeographyPackage) (E : BiogeographyEvidence B) : BiogeographyClosed B := by
  exact And.intro E.vicarianceEventsClosed (And.intro E.endemismPatternsClosed E.climateDriversClosed)

end EarthSciencePaleontologyCanonicalLaneLean
end HautevilleHouse