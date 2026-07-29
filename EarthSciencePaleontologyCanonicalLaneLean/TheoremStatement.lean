import HautevilleHouse.EarthSciencePaleontologyCanonicalLaneLean.SourcePackage

namespace HautevilleHouse
namespace EarthSciencePaleontologyCanonicalLaneLean

structure PaleontologySpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure PaleontologyAdmittedObject where
  space : PaleontologySpace
  fossilRecord : Prop
  evolutionaryTimescale : Prop
  extinctionEvidence : Prop
  climateProxy : Prop
  conclusion : fossilRecord ∧ evolutionaryTimescale ∧ extinctionEvidence ∧ climateProxy

def PaleontologyWitnessClosed (O : PaleontologyAdmittedObject) : Prop :=
  O.fossilRecord ∧ O.evolutionaryTimescale ∧ O.extinctionEvidence ∧ O.climateProxy

end EarthSciencePaleontologyCanonicalLaneLean
end HautevilleHouse