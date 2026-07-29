import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthSciencePaleontologyCanonicalLaneLean

structure DiagenesisPackage where
  burialProcess : Prop
  mineralization : Prop
  compaction : Prop
  recrystallization : Prop

structure DiagenesisEvidence (D : DiagenesisPackage) where
  burialProcessClosed : D.burialProcess
  mineralizationClosed : D.mineralization
  compactionClosed : D.compaction
  recrystallizationClosed : D.recrystallization

def DiagenesisClosed (D : DiagenesisPackage) : Prop :=
  D.burialProcess ∧ D.mineralization ∧ D.compaction ∧ D.recrystallization

theorem diagenesis_closed_from_evidence (D : DiagenesisPackage) (E : DiagenesisEvidence D) :
    DiagenesisClosed D := by
  exact And.intro E.burialProcessClosed
    (And.intro E.mineralizationClosed
      (And.intro E.compactionClosed E.recrystallizationClosed))

end EarthSciencePaleontologyCanonicalLaneLean
end HautevilleHouse