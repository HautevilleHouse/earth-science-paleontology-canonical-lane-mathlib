import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthSciencePaleontologyCanonicalLaneLean

structure GeochemicalProxyPackage where
  isotopeRatio : Prop
  elementalConcentration : Prop
  biomarkerDistribution : Prop
  diageneticOverprint : Prop
  paleoenvironmentalCalibration : Prop

structure GeochemicalProxyEvidence (G : GeochemicalProxyPackage) where
  isotopeRatioClosed : G.isotopeRatio
  elementalConcentrationClosed : G.elementalConcentration
  biomarkerDistributionClosed : G.biomarkerDistribution
  diageneticOverprintClosed : G.diageneticOverprint
  paleoenvironmentalCalibrationClosed : G.paleoenvironmentalCalibration

def GeochemicalProxyClosed (G : GeochemicalProxyPackage) : Prop :=
  G.isotopeRatio ∧ G.elementalConcentration ∧ G.biomarkerDistribution ∧ G.diageneticOverprint ∧ G.paleoenvironmentalCalibration

theorem geochemical_proxy_closed_from_evidence (G : GeochemicalProxyPackage) (E : GeochemicalProxyEvidence G) :
    GeochemicalProxyClosed G := by
  exact And.intro E.isotopeRatioClosed
    (And.intro E.elementalConcentrationClosed
      (And.intro E.biomarkerDistributionClosed
        (And.intro E.diageneticOverprintClosed E.paleoenvironmentalCalibrationClosed)))

end EarthSciencePaleontologyCanonicalLaneLean
end HautevilleHouse