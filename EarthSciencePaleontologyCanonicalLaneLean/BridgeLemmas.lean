import HautevilleHouse.EarthSciencePaleontologyCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace EarthSciencePaleontologyCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  PaleontologyWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end EarthSciencePaleontologyCanonicalLaneLean
end HautevilleHouse