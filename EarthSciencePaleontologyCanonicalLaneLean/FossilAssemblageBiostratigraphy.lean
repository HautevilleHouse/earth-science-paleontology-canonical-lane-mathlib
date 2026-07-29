import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthSciencePaleontologyCanonicalLaneLean

structure FossilAssemblagePackage where
  taxaList : Prop
  abundancePatterns : Prop
  zoneDefinition : Prop
  correlationScheme : Prop
  ageModel : Prop

structure FossilAssemblageEvidence (F : FossilAssemblagePackage) where
  taxaListClosed : F.taxaList
  abundancePatternsClosed : F.abundancePatterns
  zoneDefinitionClosed : F.zoneDefinition
  correlationSchemeClosed : F.correlationScheme
  ageModelClosed : F.ageModel

def FossilAssemblageClosed (F : FossilAssemblagePackage) : Prop :=
  F.taxaList ∧ F.abundancePatterns ∧ F.zoneDefinition ∧ F.correlationScheme ∧ F.ageModel

theorem fossil_assemblage_closed_from_evidence (F : FossilAssemblagePackage) (E : FossilAssemblageEvidence F) :
    FossilAssemblageClosed F := by
  exact And.intro E.taxaListClosed
    (And.intro E.abundancePatternsClosed
      (And.intro E.zoneDefinitionClosed
        (And.intro E.correlationSchemeClosed E.ageModelClosed)))

end EarthSciencePaleontologyCanonicalLaneLean
end HautevilleHouse