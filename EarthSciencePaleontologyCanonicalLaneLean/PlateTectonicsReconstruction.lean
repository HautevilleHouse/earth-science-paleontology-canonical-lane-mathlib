import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthSciencePaleontologyCanonicalLaneLean

structure PlateTectonicsPackage where
  lithospherePieces : Type u
  presentPositions : lithospherePieces → (ℝ × ℝ)
  pastPositions : lithospherePieces → ℝ → (ℝ × ℝ)
  rotationPoles : lithospherePieces → (ℝ × ℝ × ℝ)
  relativeVelocities : lithospherePieces → lithospherePieces → ℝ → (ℝ × ℝ)
  seafloorSpreadingRates : (ℝ × ℝ) → ℝ → ℝ
  paleomagneticData : lithospherePieces → ℝ → ℝ

structure PlateTectonicsEvidence (P : PlateTectonicsPackage) where
  plateMotionConsistent : ∀ p : P.lithospherePieces, ∀ t : ℝ, P.pastPositions p t = P.presentPositions p + t * P.relativeVelocities p p t
  rotationPolesDefined : ∀ p : P.lithospherePieces, P.rotationPoles p ≠ (0,0,0)
  seafloorSpreadingRatePositive : ∀ x : ℝ × ℝ, ∀ t : ℝ, t > 0 → P.seafloorSpreadingRates x t > 0

def PlateTectonicsClosed (P : PlateTectonicsPackage) : Prop :=
  (∀ p : P.lithospherePieces, ∀ t : ℝ, P.pastPositions p t = P.presentPositions p + t * P.relativeVelocities p p t) ∧
  (∀ p : P.lithospherePieces, P.rotationPoles p ≠ (0,0,0)) ∧
  (∀ x : ℝ × ℝ, ∀ t : ℝ, t > 0 → P.seafloorSpreadingRates x t > 0)

theorem plate_tectonics_closed_from_evidence (P : PlateTectonicsPackage) (E : PlateTectonicsEvidence P) :
    PlateTectonicsClosed P := by
  exact And.intro E.plateMotionConsistent (And.intro E.rotationPolesDefined E.seafloorSpreadingRatePositive)

end EarthSciencePaleontologyCanonicalLaneLean
end HautevilleHouse