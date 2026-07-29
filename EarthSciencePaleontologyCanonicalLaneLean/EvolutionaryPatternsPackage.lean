import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthSciencePaleontologyCanonicalLaneLean

structure EvolutionaryPatternsPackage where
  fossilRecord : Type u
  morphologicalChange : Prop
  speciationEvents : Prop
  extinctionEvents : Prop
  temporalTrends : Prop

structure EvolutionaryPatternsEvidence (E : EvolutionaryPatternsPackage) where
  morphologicalChangeClosed : E.morphologicalChange
  speciationEventsClosed : E.speciationEvents
  extinctionEventsClosed : E.extinctionEvents
  temporalTrendsClosed : E.temporalTrends

def EvolutionaryPatternsClosed (E : EvolutionaryPatternsPackage) : Prop :=
  E.morphologicalChange ∧ E.speciationEvents ∧ E.extinctionEvents ∧ E.temporalTrends

theorem evolutionary_patterns_closed_from_evidence (E : EvolutionaryPatternsPackage) (Ev : EvolutionaryPatternsEvidence E) : EvolutionaryPatternsClosed E := by
  exact And.intro Ev.morphologicalChangeClosed (And.intro Ev.speciationEventsClosed (And.intro Ev.extinctionEventsClosed Ev.temporalTrendsClosed))

end EarthSciencePaleontologyCanonicalLaneLean
end HautevilleHouse