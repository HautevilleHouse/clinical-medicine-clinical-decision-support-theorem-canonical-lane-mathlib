import canonicalLaneMathlib.AdmissibleClass
import ClinicalMedicineClinicalDecisionSupportTheoremCanonicalLaneLean.CompartmentModelEvidence
import ClinicalMedicineClinicalDecisionSupportTheoremCanonicalLaneLean.PharmacokineticEvidence
import ClinicalMedicineClinicalDecisionSupportTheoremCanonicalLaneLean.DiagnosticInferenceEvidence
import ClinicalMedicineClinicalDecisionSupportTheoremCanonicalLaneLean.SurvivalAnalysisEvidence

namespace HautevilleHouse
namespace ClinicalMedicineClinicalDecisionSupportTheoremCanonicalLaneLean

structure ClinicalDecisionSupportAdmissibleClass where
  compartment : CompartmentModelPackage
  pk : PharmacokineticPackage
  dx : DiagnosticInferencePackage
  survival : SurvivalAnalysisPackage
  combinedEvidence : Prop

def bridgeClosed (A : ClinicalDecisionSupportAdmissibleClass) : Prop :=
  CompartmentModelClosed A.compartment ∧
  PharmacokineticClosed A.pk ∧
  DiagnosticInferenceClosed A.dx ∧
  SurvivalAnalysisClosed A.survival

theorem bridge_from_admissible_class (A : ClinicalDecisionSupportAdmissibleClass) :
    bridgeClosed A := by
  have h1 : CompartmentModelClosed A.compartment := by
    have evidence := A.compartment.massBalance ∧ A.compartment.steadyStateExistence
    exact compartment_model_closed_from_evidence A.compartment evidence
  have h2 : PharmacokineticClosed A.pk := by
    apply pharmacokinetic_closed_from_evidence A.pk
    exact A.pk.linearClearance
  have h3 : DiagnosticInferenceClosed A.dx := by
    apply diagnostic_inference_closed_from_evidence A.dx
    exact A.dx.sensitivitySpecificityValid
  have h4 : SurvivalAnalysisClosed A.survival := by
    apply survival_analysis_closed_from_evidence A.survival
    exact A.survival.proportionalHazardsAssumption
  exact And.intro h1 (And.intro h2 (And.intro h3 h4))

end ClinicalMedicineClinicalDecisionSupportTheoremCanonicalLaneLean
end HautevilleHouse