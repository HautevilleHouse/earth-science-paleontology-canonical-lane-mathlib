import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthSciencePaleontologyCanonicalLaneLean

structure TaphonomyPackage where
  fossilPreservationMode : Type u
  biostratinomicProcesses : Prop
  diageneticAlteration : Prop
  taphonomicBias : Prop
  timeAveraging : Prop

structure TaphonomyEvidence (T : TaphonomyPackage) where
  biostratinomicProcessesClosed : T.biostratinomicProcesses
  diageneticAlterationClosed : T.diageneticAlteration
  taphonomicBiasClosed : T.taphonomicBias
  timeAveragingClosed : T.timeAveraging

def TaphonomyClosed (T : TaphonomyPackage) : Prop :=
  T.biostratinomicProcesses ∧ T.diageneticAlteration ∧ T.taphonomicBias ∧ T.timeAveraging

theorem taphonomy_closed_from_evidence (T : TaphonomyPackage) (E : TaphonomyEvidence T) : TaphonomyClosed T := by
  exact And.intro E.biostratinomicProcessesClosed (And.intro E.diageneticAlterationClosed (And.intro E.taphonomicBiasClosed E.timeAveragingClosed))

end EarthSciencePaleontologyCanonicalLaneLean
end HautevilleHouse