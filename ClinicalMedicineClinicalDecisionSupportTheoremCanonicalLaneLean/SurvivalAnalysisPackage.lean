import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalDecisionSupportTheoremCanonicalLaneLean

structure SurvivalPackage where
  hazardFunction : Prop
  survivalFunction : Prop
  kaplanMeierCurve : Prop
  logRankTest : Prop
  coxProportionalHazards : Prop
  censoringIndicator : Prop

structure SurvivalEvidence (S : SurvivalPackage) where
  hazardFunctionClosed : S.hazardFunction
  survivalFunctionClosed : S.survivalFunction
  kaplanMeierCurveClosed : S.kaplanMeierCurve
  logRankTestClosed : S.logRankTest
  coxProportionalHazardsClosed : S.coxProportionalHazards
  censoringIndicatorClosed : S.censoringIndicator

def SurvivalClosed (S : SurvivalPackage) : Prop :=
  S.hazardFunction ∧ S.survivalFunction ∧ S.kaplanMeierCurve ∧ S.logRankTest ∧ S.coxProportionalHazards ∧ S.censoringIndicator

theorem survival_closed_from_evidence (S : SurvivalPackage) (E : SurvivalEvidence S) :
    SurvivalClosed S := by
  exact And.intro E.hazardFunctionClosed
    (And.intro E.survivalFunctionClosed
      (And.intro E.kaplanMeierCurveClosed
        (And.intro E.logRankTestClosed
          (And.intro E.coxProportionalHazardsClosed E.censoringIndicatorClosed))))

end ClinicalMedicineClinicalDecisionSupportTheoremCanonicalLaneLean
end HautevilleHouse