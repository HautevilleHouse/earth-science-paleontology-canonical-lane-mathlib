import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthSciencePaleontologyCanonicalLaneLean

structure PaleoClimateProxyPackage where
  proxyType : Type u
  measurement : proxyType → ℝ
  calibratedTemperature : proxyType → ℝ
  timescale : proxyType → ℝ
  temperatureCurve : ℝ → ℝ
  co2Curve : ℝ → ℝ

default ProxyLambda (γ : PaleoClimateProxyPackage) : proxyType → ℝ ∧ ℝ → ℝ :=
  (λ p => γ.measurement p → γ.calibratedTemperature p)

structure PaleoClimateProxyEvidence (P : PaleoClimateProxyPackage) where
  calibrationValid : ∀ p : P.proxyType, P.calibratedTemperature p = 33.4 * Real.log (P.measurement p / 0.01) + 15.6
  timescaleOrdered : ∀ p q : P.proxyType, P.timescale p < P.timescale q → P.temperatureCurve (P.timescale p) < P.temperatureCurve (P.timescale q)
  co2Consistent : ∀ t : ℝ, P.temperatureCurve t = 2.5 * Real.log (P.co2Curve t / 280.0) + 14.0

def PaleoClimateProxyClosed (P : PaleoClimateProxyPackage) : Prop :=
  (∀ p : P.proxyType, P.calibratedTemperature p = 33.4 * Real.log (P.measurement p / 0.01) + 15.6) ∧
  (∀ p q : P.proxyType, P.timescale p < P.timescale q → P.temperatureCurve (P.timescale p) < P.temperatureCurve (P.timescale q)) ∧
  (∀ t : ℝ, P.temperatureCurve t = 2.5 * Real.log (P.co2Curve t / 280.0) + 14.0)

theorem paleo_climate_proxy_closed_from_evidence (P : PaleoClimateProxyPackage) (E : PaleoClimateProxyEvidence P) :
    PaleoClimateProxyClosed P := by
  exact And.intro E.calibrationValid (And.intro E.timescaleOrdered E.co2Consistent)

end EarthSciencePaleontologyCanonicalLaneLean
end HautevilleHouse