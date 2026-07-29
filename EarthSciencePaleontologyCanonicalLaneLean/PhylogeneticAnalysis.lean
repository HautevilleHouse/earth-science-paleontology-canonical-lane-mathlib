import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthSciencePaleontologyCanonicalLaneLean

structure PhylogeneticPackage where
  morphologicalData : Prop
  molecularClocks : Prop
  cladisticParsimony : Prop
  evolutionaryTree : Prop

structure PhylogeneticEvidence (P : PhylogeneticPackage) where
  morphologicalDataClosed : P.morphologicalData
  molecularClocksClosed : P.molecularClocks
  cladisticParsimonyClosed : P.cladisticParsimony
  evolutionaryTreeClosed : P.evolutionaryTree

def PhylogeneticClosed (P : PhylogeneticPackage) : Prop :=
  P.morphologicalData ∧ P.molecularClocks ∧ P.cladisticParsimony ∧ P.evolutionaryTree

theorem phylogenetic_closed_from_evidence (P : PhylogeneticPackage) (E : PhylogeneticEvidence P) :
    PhylogeneticClosed P := by
  exact And.intro E.morphologicalDataClosed
    (And.intro E.molecularClocksClosed
      (And.intro E.cladisticParsimonyClosed E.evolutionaryTreeClosed))

end EarthSciencePaleontologyCanonicalLaneLean
end HautevilleHouse