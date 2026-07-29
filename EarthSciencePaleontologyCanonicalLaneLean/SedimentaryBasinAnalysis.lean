import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthSciencePaleontologyCanonicalLaneLean

structure SedimentaryBasinPackage where
  basinGeometry : Prop
  stratigraphicColumn : Prop
  faciesDistribution : Prop
  subsidenceHistory : Prop
  sedimentSupply : Prop

structure SedimentaryBasinEvidence (B : SedimentaryBasinPackage) where
  basinGeometryClosed : B.basinGeometry
  stratigraphicColumnClosed : B.stratigraphicColumn
  faciesDistributionClosed : B.faciesDistribution
  subsidenceHistoryClosed : B.subsidenceHistory
  sedimentSupplyClosed : B.sedimentSupply

def SedimentaryBasinClosed (B : SedimentaryBasinPackage) : Prop :=
  B.basinGeometry ∧ B.stratigraphicColumn ∧ B.faciesDistribution ∧ B.subsidenceHistory ∧ B.sedimentSupply

theorem sedimentary_basin_closed_from_evidence (B : SedimentaryBasinPackage) (E : SedimentaryBasinEvidence B) :
    SedimentaryBasinClosed B := by
  exact And.intro E.basinGeometryClosed
    (And.intro E.stratigraphicColumnClosed
      (And.intro E.faciesDistributionClosed
        (And.intro E.subsidenceHistoryClosed E.sedimentSupplyClosed)))

end EarthSciencePaleontologyCanonicalLaneLean
end HautevilleHouse