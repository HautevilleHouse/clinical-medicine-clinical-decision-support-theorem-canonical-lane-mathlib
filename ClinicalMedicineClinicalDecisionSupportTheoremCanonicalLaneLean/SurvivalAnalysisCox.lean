import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalDecisionSupportTheoremCanonicalLaneLean

structure SurvivalAnalysisPackage where
  hazardFunction : Type u
  censoringMechanism : Type v
  proportionalHazardsAssumption : Prop
  baselineHazard : Prop
  riskScore : Prop

structure SurvivalAnalysisEvidence (S : SurvivalAnalysisPackage) where
  proportionalHazardsAssumptionClosed : S.proportionalHazardsAssumption
  baselineHazardClosed : S.baselineHazard
  riskScoreClosed : S.riskScore

def SurvivalAnalysisClosed (S : SurvivalAnalysisPackage) : Prop :=
  S.proportionalHazardsAssumption ∧ S.baselineHazard ∧ S.riskScore

theorem survival_analysis_closed_from_evidence (S : SurvivalAnalysisPackage)
    (E : SurvivalAnalysisEvidence S) : SurvivalAnalysisClosed S := by
  exact And.intro E.proportionalHazardsAssumptionClosed
    (And.intro E.baselineHazardClosed E.riskScoreClosed)

end ClinicalMedicineClinicalDecisionSupportTheoremCanonicalLaneLean
end HautevilleHouse