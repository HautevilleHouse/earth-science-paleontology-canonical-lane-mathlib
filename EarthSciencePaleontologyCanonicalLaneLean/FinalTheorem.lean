import canonicalLaneMathlib.AdmissibleClass
import EarthSciencePaleontologyCanonicalLaneLean.BridgeLemmas
import EarthSciencePaleontologyCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace EarthSciencePaleontologyCanonicalLaneLean

def ConstrainedEarthSciencePaleontologyClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_earth_science_paleontology_endgame (A : AdmissibleClass) :
    ConstrainedEarthSciencePaleontologyClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end EarthSciencePaleontologyCanonicalLaneLean
end HautevilleHouse