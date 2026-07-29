import HautevilleHouse.EarthSciencePaleontologyCanonicalLaneLean.TheoremStatement

namespace HautevilleHouse
namespace EarthSciencePaleontologyCanonicalLaneLean

structure AdmissibleClass where
  object : PaleontologyAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  PaleontologyWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end EarthSciencePaleontologyCanonicalLaneLean
end HautevilleHouse