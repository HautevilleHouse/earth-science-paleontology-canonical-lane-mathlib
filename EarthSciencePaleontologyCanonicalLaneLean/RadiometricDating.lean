import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthSciencePaleontologyCanonicalLaneLean

structure RadiometricDatingPackage where
  isotopicSystem : Type u
  parentIsotope : isotopicSystem → Type v
  daughterIsotope : isotopicSystem → Type w
  decayConstant : isotopicSystem → ℝ
  initialRatio : isotopicSystem → ℝ
  measuredRatio : isotopicSystem → ℝ
  ageFormula : isotopicSystem → ℝ
  errorMargin : ℝ → ℝ

structure RadiometricDatingEvidence (R : RadiometricDatingPackage) where
  decayConstantsPositive : ∀ s : R.isotopicSystem, R.decayConstant s > 0
  ageFormulaConsistent : ∀ s : R.isotopicSystem, R.ageFormula s = (1 / R.decayConstant s) * Real.log (1 + R.measuredRatio s / R.initialRatio s)
  errorMarginNonnegative : ∀ a : ℝ, R.errorMargin a ≥ 0

def RadiometricDatingClosed (R : RadiometricDatingPackage) : Prop :=
  (∀ s : R.isotopicSystem, R.decayConstant s > 0) ∧
  (∀ s : R.isotopicSystem, R.ageFormula s = (1 / R.decayConstant s) * Real.log (1 + R.measuredRatio s / R.initialRatio s)) ∧
  (∀ a : ℝ, R.errorMargin a ≥ 0)

theorem radiometric_dating_closed_from_evidence (R : RadiometricDatingPackage) (E : RadiometricDatingEvidence R) :
    RadiometricDatingClosed R := by
  exact And.intro E.decayConstantsPositive (And.intro E.ageFormulaConsistent E.errorMarginNonnegative)

end EarthSciencePaleontologyCanonicalLaneLean
end HautevilleHouse