import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthSciencePaleontologyCanonicalLaneLean

structure EvolutionaryMorphologyPackage where
  morphologicalTraits : List String
  phylogeneticTree : Type u
  homoplasyAssessments : Prop
  adaptiveRadiation : Prop
  morphologicalStasis : Prop

structure EvolutionaryMorphologyEvidence (E : EvolutionaryMorphologyPackage) where
  homoplasyAssessmentsClosed : E.homoplasyAssessments
  adaptiveRadiationClosed : E.adaptiveRadiation
  morphologicalStasisClosed : E.morphologicalStasis

def EvolutionaryMorphologyClosed (E : EvolutionaryMorphologyPackage) : Prop :=
  E.homoplasyAssessments ∧ E.adaptiveRadiation ∧ E.morphologicalStasis

theorem evolutionary_morphology_closed_from_evidence (E : EvolutionaryMorphologyPackage) (Ev : EvolutionaryMorphologyEvidence E) : EvolutionaryMorphologyClosed E := by
  exact And.intro Ev.homoplasyAssessmentsClosed (And.intro Ev.adaptiveRadiationClosed Ev.morphologicalStasisClosed)

end EarthSciencePaleontologyCanonicalLaneLean
end HautevilleHouse