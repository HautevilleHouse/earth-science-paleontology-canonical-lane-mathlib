import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthSciencePaleontologyCanonicalLaneLean

structure TaphonomicPackage where
  burialProcess : Prop
  decayRate : Prop
  transportMechanism : Prop
  preservationPotential : Prop
  biostratinomy : Prop

structure TaphonomicEvidence (T : TaphonomicPackage) where
  burialProcessClosed : T.burialProcess
  decayRateClosed : T.decayRate
  transportMechanismClosed : T.transportMechanism
  preservationPotentialClosed : T.preservationPotential
  biostratinomyClosed : T.biostratinomy

def TaphonomicClosed (T : TaphonomicPackage) : Prop :=
  T.burialProcess ∧ T.decayRate ∧ T.transportMechanism ∧ T.preservationPotential ∧ T.biostratinomy

theorem taphonomic_closed_from_evidence (T : TaphonomicPackage) (E : TaphonomicEvidence T) :
    TaphonomicClosed T := by
  exact And.intro E.burialProcessClosed
    (And.intro E.decayRateClosed
      (And.intro E.transportMechanismClosed
        (And.intro E.preservationPotentialClosed E.biostratinomyClosed)))

end EarthSciencePaleontologyCanonicalLaneLean
end HautevilleHouse