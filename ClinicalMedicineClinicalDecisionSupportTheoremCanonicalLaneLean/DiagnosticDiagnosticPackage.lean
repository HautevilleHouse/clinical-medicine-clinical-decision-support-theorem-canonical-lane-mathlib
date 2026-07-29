import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalDecisionSupportTheoremCanonicalLaneLean

structure DiagnosticPackage where
  sensitivity : Prop
  specificity : Prop
  positivePredictiveValue : Prop
  negativePredictiveValue : Prop
  likelihoodRatioPositive : Prop
  likelihoodRatioNegative : Prop

structure DiagnosticEvidence (D : DiagnosticPackage) where
  sensitivityClosed : D.sensitivity
  specificityClosed : D.specificity
  positivePredictiveValueClosed : D.positivePredictiveValue
  negativePredictiveValueClosed : D.negativePredictiveValue
  likelihoodRatioPositiveClosed : D.likelihoodRatioPositive
  likelihoodRatioNegativeClosed : D.likelihoodRatioNegative

def DiagnosticClosed (D : DiagnosticPackage) : Prop :=
  D.sensitivity ∧ D.specificity ∧ D.positivePredictiveValue ∧ D.negativePredictiveValue ∧
  D.likelihoodRatioPositive ∧ D.likelihoodRatioNegative

theorem diagnostic_closed_from_evidence (D : DiagnosticPackage) (E : DiagnosticEvidence D) :
    DiagnosticClosed D := by
  exact And.intro E.sensitivityClosed
    (And.intro E.specificityClosed
      (And.intro E.positivePredictiveValueClosed
        (And.intro E.negativePredictiveValueClosed
          (And.intro E.likelihoodRatioPositiveClosed E.likelihoodRatioNegativeClosed))))

end ClinicalMedicineClinicalDecisionSupportTheoremCanonicalLaneLean
end HautevilleHouse