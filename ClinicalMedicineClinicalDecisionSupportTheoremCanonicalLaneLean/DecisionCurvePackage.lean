import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalDecisionSupportTheoremCanonicalLaneLean

structure DecisionCurvePackage where
  thresholdProbability : Prop
  netBenefit : Prop
  treatAllStrategy : Prop
  treatNoneStrategy : Prop
  decisionCurve : Prop
  optimalThreshold : Prop

structure DecisionCurveEvidence (D : DecisionCurvePackage) where
  thresholdProbabilityClosed : D.thresholdProbability
  netBenefitClosed : D.netBenefit
  treatAllStrategyClosed : D.treatAllStrategy
  treatNoneStrategyClosed : D.treatNoneStrategy
  decisionCurveClosed : D.decisionCurve
  optimalThresholdClosed : D.optimalThreshold

def DecisionCurveClosed (D : DecisionCurvePackage) : Prop :=
  D.thresholdProbability ∧ D.netBenefit ∧ D.treatAllStrategy ∧ D.treatNoneStrategy ∧ D.decisionCurve ∧ D.optimalThreshold

theorem decision_curve_closed_from_evidence (D : DecisionCurvePackage) (E : DecisionCurveEvidence D) :
    DecisionCurveClosed D := by
  exact And.intro E.thresholdProbabilityClosed
    (And.intro E.netBenefitClosed
      (And.intro E.treatAllStrategyClosed
        (And.intro E.treatNoneStrategyClosed
          (And.intro E.decisionCurveClosed E.optimalThresholdClosed))))

end ClinicalMedicineClinicalDecisionSupportTheoremCanonicalLaneLean
end HautevilleHouse