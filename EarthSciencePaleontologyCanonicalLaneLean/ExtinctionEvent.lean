import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthSciencePaleontologyCanonicalLaneLean

structure ExtinctionEventPackage where
  massExtinctionHorizon : Prop
  environmentalTrigger : Prop
  bioticTurnoverRate : Prop
  survivalCohortAnalysis : Prop
  recoveryInterval : Prop

structure ExtinctionEventEvidence (E : ExtinctionEventPackage) where
  massExtinctionHorizonClosed : E.massExtinctionHorizon
  environmentalTriggerClosed : E.environmentalTrigger
  bioticTurnoverRateClosed : E.bioticTurnoverRate
  survivalCohortAnalysisClosed : E.survivalCohortAnalysis
  recoveryIntervalClosed : E.recoveryInterval

def ExtinctionEventClosed (E : ExtinctionEventPackage) : Prop :=
  E.massExtinctionHorizon ∧ E.environmentalTrigger ∧
  E.bioticTurnoverRate ∧ E.survivalCohortAnalysis ∧ E.recoveryInterval

theorem extinction_event_closed_from_evidence (E : ExtinctionEventPackage)
    (Ev : ExtinctionEventEvidence E) : ExtinctionEventClosed E := by
  exact And.intro Ev.massExtinctionHorizonClosed
    (And.intro Ev.environmentalTriggerClosed
      (And.intro Ev.bioticTurnoverRateClosed
        (And.intro Ev.survivalCohortAnalysisClosed
          Ev.recoveryIntervalClosed)))

end EarthSciencePaleontologyCanonicalLaneLean
end HautevilleHouse