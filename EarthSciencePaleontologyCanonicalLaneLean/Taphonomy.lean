import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthSciencePaleontologyCanonicalLaneLean

structure TaphonomyPackage where
  fossilizationProcess : Type u
  preservationalBias : Prop
  biostratinomyAnalysis : Prop
  diageneticAlteration : Prop
  taphonomicSignature : Prop

structure TaphonomyEvidence (T : TaphonomyPackage) where
  preservationalBiasClosed : T.preservationalBias
  biostratinomyAnalysisClosed : T.biostratinomyAnalysis
  diageneticAlterationClosed : T.diageneticAlteration
  taphonomicSignatureClosed : T.taphonomicSignature

def TaphonomyClosed (T : TaphonomyPackage) : Prop :=
  T.preservationalBias ∧ T.biostratinomyAnalysis ∧ T.diageneticAlteration ∧ T.taphonomicSignature

theorem taphonomy_closed_from_evidence (T : TaphonomyPackage) (E : TaphonomyEvidence T) : TaphonomyClosed T := by
  exact And.intro E.preservationalBiasClosed (And.intro E.biostratinomyAnalysisClosed (And.intro E.diageneticAlterationClosed E.taphonomicSignatureClosed))

end EarthSciencePaleontologyCanonicalLaneLean
end HautevilleHouse