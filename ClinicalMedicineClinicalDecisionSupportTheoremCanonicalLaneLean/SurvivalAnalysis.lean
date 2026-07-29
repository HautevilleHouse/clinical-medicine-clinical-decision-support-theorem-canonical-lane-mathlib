import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalDecisionSupportTheoremCanonicalLaneLean

/-! # Survival Analysis Package -/

structure SurvivalAnalysisPackage where
  hazardFunction : Prop
  survivalFunction : Prop
  censoringMechanism : Prop
  proportionalHazardsAssumption : Prop
  kaplanMeierEstimator : Prop
  coxModelDefined : Prop

structure SurvivalAnalysisEvidence (S : SurvivalAnalysisPackage) where
  hazardFunctionClosed : S.hazardFunction
  survivalFunctionClosed : S.survivalFunction
  censoringMechanismClosed : S.censoringMechanism
  proportionalHazardsAssumptionClosed : S.proportionalHazardsAssumption
  kaplanMeierEstimatorClosed : S.kaplanMeierEstimator
  coxModelDefinedClosed : S.coxModelDefined

def SurvivalAnalysisClosed (S : SurvivalAnalysisPackage) : Prop :=
  S.hazardFunction ∧ S.survivalFunction ∧ S.censoringMechanism ∧
  S.proportionalHazardsAssumption ∧ S.kaplanMeierEstimator ∧ S.coxModelDefined

theorem survival_analysis_closed_from_evidence (S : SurvivalAnalysisPackage)
    (E : SurvivalAnalysisEvidence S) : SurvivalAnalysisClosed S := by
  exact And.intro E.hazardFunctionClosed
    (And.intro E.survivalFunctionClosed
      (And.intro E.censoringMechanismClosed
        (And.intro E.proportionalHazardsAssumptionClosed
          (And.intro E.kaplanMeierEstimatorClosed E.coxModelDefinedClosed))))

end ClinicalMedicineClinicalDecisionSupportTheoremCanonicalLaneLean
end HautevilleHouse