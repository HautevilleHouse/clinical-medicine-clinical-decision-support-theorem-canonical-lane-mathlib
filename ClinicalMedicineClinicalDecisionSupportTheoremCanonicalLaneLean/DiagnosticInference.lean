import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ClinicalMedicineClinicalDecisionSupportTheoremCanonicalLaneLean.ClinicalDecisionSupportTheorem

namespace HautevilleHouse
namespace ClinicalMedicineClinicalDecisionSupportTheoremCanonicalLaneLean

structure DiagnosticInferencePackage (A : AdmissibleClass) where
  evidenceSet : Type
  hypothesisSet : Type
  likelihoodFunction : evidenceSet → hypothesisSet → ℝ
  posteriorCalculation : (evidenceSet → hypothesisSet → ℝ) → Prop
  decisionThreshold : Prop

structure DiagnosticInferenceEvidence {A : AdmissibleClass}
    (D : DiagnosticInferencePackage A) where
  likelihoodFunctionClosed : D.likelihoodFunction ≠ λ _ _ => 0
  posteriorCalculationClosed : D.posteriorCalculation D.likelihoodFunction
  decisionThresholdClosed : D.decisionThreshold

def DiagnosticInferenceClosed {A : AdmissibleClass}
    (D : DiagnosticInferencePackage A) : Prop :=
  (D.likelihoodFunction ≠ λ _ _ => 0) ∧ D.posteriorCalculation D.likelihoodFunction ∧ D.decisionThreshold

theorem diagnostic_inference_closed_from_evidence
    {A : AdmissibleClass} (D : DiagnosticInferencePackage A)
    (E : DiagnosticInferenceEvidence D) : DiagnosticInferenceClosed D := by
  exact And.intro E.likelihoodFunctionClosed
    (And.intro E.posteriorCalculationClosed E.decisionThresholdClosed)

end ClinicalMedicineClinicalDecisionSupportTheoremCanonicalLaneLean
end HautevilleHouse