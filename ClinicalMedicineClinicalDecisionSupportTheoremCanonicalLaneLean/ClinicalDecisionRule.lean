import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalDecisionSupportTheoremCanonicalLaneLean

/-! # Clinical Decision Rule Package -/

structure ClinicalDecisionRulePackage where
  inputVariables : Type u
  decisionRule : Type v
  outcomeMeasured : Prop
  ruleDerivationValid : Prop
  validationPerformed : Prop
  clinicalUtilityAssessed : Prop

structure ClinicalDecisionRuleEvidence (R : ClinicalDecisionRulePackage) where
  outcomeMeasuredClosed : R.outcomeMeasured
  ruleDerivationValidClosed : R.ruleDerivationValid
  validationPerformedClosed : R.validationPerformed
  clinicalUtilityAssessedClosed : R.clinicalUtilityAssessed

def ClinicalDecisionRuleClosed (R : ClinicalDecisionRulePackage) : Prop :=
  R.outcomeMeasured ∧ R.ruleDerivationValid ∧ R.validationPerformed ∧ R.clinicalUtilityAssessed

theorem clinical_decision_rule_closed_from_evidence (R : ClinicalDecisionRulePackage)
    (E : ClinicalDecisionRuleEvidence R) : ClinicalDecisionRuleClosed R := by
  exact And.intro E.outcomeMeasuredClosed
    (And.intro E.ruleDerivationValidClosed
      (And.intro E.validationPerformedClosed E.clinicalUtilityAssessedClosed))

end ClinicalMedicineClinicalDecisionSupportTheoremCanonicalLaneLean
end HautevilleHouse