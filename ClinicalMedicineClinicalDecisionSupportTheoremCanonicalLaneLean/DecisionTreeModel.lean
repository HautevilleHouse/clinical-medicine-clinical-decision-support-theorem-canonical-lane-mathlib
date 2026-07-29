import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalDecisionSupportTheoremCanonicalLaneLean

structure DecisionTreeModelPackage where
  rootNodeDecision : Prop
  branchConditions : Type u
  leafOutcomes : Type v
  expectedUtilityComputed : Prop
  sensitivityAnalysisDone : Prop

structure DecisionTreeModelEvidence (D : DecisionTreeModelPackage) where
  rootNodeDecisionClosed : D.rootNodeDecision
  branchConditionsClosed : D.branchConditions
  leafOutcomesClosed : D.leafOutcomes
  expectedUtilityComputedClosed : D.expectedUtilityComputed
  sensitivityAnalysisDoneClosed : D.sensitivityAnalysisDone

def DecisionTreeModelClosed (D : DecisionTreeModelPackage) : Prop :=
  D.rootNodeDecision ∧ D.branchConditions ∧ D.leafOutcomes ∧
  D.expectedUtilityComputed ∧ D.sensitivityAnalysisDone

theorem decision_tree_model_closed_from_evidence
    (D : DecisionTreeModelPackage) (E : DecisionTreeModelEvidence D) :
    DecisionTreeModelClosed D := by
  exact And.intro E.rootNodeDecisionClosed
    (And.intro E.branchConditionsClosed
      (And.intro E.leafOutcomesClosed
        (And.intro E.expectedUtilityComputedClosed
          E.sensitivityAnalysisDoneClosed)))

end ClinicalMedicineClinicalDecisionSupportTheoremCanonicalLaneLean
end HautevilleHouse
