import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthSciencePaleontologyCanonicalLaneLean

structure PaleontologyAdmittedObject where
  stratigraphy : Prop
  phylogeny : Prop
  diagenesis : Prop
  environment : Prop
  extinction : Prop
  conclusion : stratigraphy ∧ phylogeny ∧ diagenesis ∧ environment ∧ extinction

structure PaleontologyAdmissibleClass where
  object : PaleontologyAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : PaleontologyAdmissibleClass) : Prop :=
  A.object.conclusion ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end EarthSciencePaleontologyCanonicalLaneLean
end HautevilleHouse