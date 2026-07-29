import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthSciencePaleontologyCanonicalLaneLean

structure PhylogeneticTreePackage where
  characterMatrix : Prop
  parsimonyCriterion : Prop
  branchSupport : Prop
  molecularClockCalibration : Prop
  fossilCalibrationPoints : Prop

structure PhylogeneticTreeEvidence (P : PhylogeneticTreePackage) where
  characterMatrixClosed : P.characterMatrix
  parsimonyCriterionClosed : P.parsimonyCriterion
  branchSupportClosed : P.branchSupport
  molecularClockCalibrationClosed : P.molecularClockCalibration
  fossilCalibrationPointsClosed : P.fossilCalibrationPoints

def PhylogeneticTreeClosed (P : PhylogeneticTreePackage) : Prop :=
  P.characterMatrix ∧ P.parsimonyCriterion ∧
  P.branchSupport ∧ P.molecularClockCalibration ∧ P.fossilCalibrationPoints

theorem phylogenetic_tree_closed_from_evidence (P : PhylogeneticTreePackage)
    (E : PhylogeneticTreeEvidence P) : PhylogeneticTreeClosed P := by
  exact And.intro E.characterMatrixClosed
    (And.intro E.parsimonyCriterionClosed
      (And.intro E.branchSupportClosed
        (And.intro E.molecularClockCalibrationClosed
          E.fossilCalibrationPointsClosed)))

end EarthSciencePaleontologyCanonicalLaneLean
end HautevilleHouse