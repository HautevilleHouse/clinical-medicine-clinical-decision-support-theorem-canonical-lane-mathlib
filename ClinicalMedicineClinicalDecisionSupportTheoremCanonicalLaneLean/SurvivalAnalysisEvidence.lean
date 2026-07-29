import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalDecisionSupportTheoremCanonicalLaneLean

structure SurvivalAnalysisPackage where
  cohort : Type
  event : Type
  hazardFunction : Type
  survivalCurve : Type
  proportionalHazards : Prop
  censoringUnbiased : Prop

structure SurvivalAnalysisEvidence (S : SurvivalAnalysisPackage) where
  proportionalHazardsClosed : S.proportionalHazards
  censoringUnbiasedClosed : S.censoringUnbiased

def SurvivalAnalysisClosed (S : SurvivalAnalysisPackage) : Prop :=
  S.proportionalHazards ∧ S.censoringUnbiased

theorem survival_analysis_closed_from_evidence (S : SurvivalAnalysisPackage)
    (E : SurvivalAnalysisEvidence S) : SurvivalAnalysisClosed S := by
  exact And.intro E.proportionalHazardsClosed E.censoringUnbiasedClosed

end ClinicalMedicineClinicalDecisionSupportTheoremCanonicalLaneLean
end HautevilleHouse