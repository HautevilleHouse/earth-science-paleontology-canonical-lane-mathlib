import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthSciencePaleontologyCanonicalLaneLean

structure StratigraphicPackage where
  sedimentarySequence : Prop
  fossilAssemblage : Prop
  radiometricDating : Prop
  indexFossilCorrelation : Prop

structure StratigraphicEvidence (S : StratigraphicPackage) where
  sedimentarySequenceClosed : S.sedimentarySequence
  fossilAssemblageClosed : S.fossilAssemblage
  radiometricDatingClosed : S.radiometricDating
  indexFossilCorrelationClosed : S.indexFossilCorrelation

def StratigraphicClosed (S : StratigraphicPackage) : Prop :=
  S.sedimentarySequence ∧ S.fossilAssemblage ∧ S.radiometricDating ∧ S.indexFossilCorrelation

theorem stratigraphic_closed_from_evidence (S : StratigraphicPackage) (E : StratigraphicEvidence S) :
    StratigraphicClosed S := by
  exact And.intro E.sedimentarySequenceClosed
    (And.intro E.fossilAssemblageClosed
      (And.intro E.radiometricDatingClosed E.indexFossilCorrelationClosed))

end EarthSciencePaleontologyCanonicalLaneLean
end HautevilleHouse