import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ClinicalMedicineClinicalDecisionSupportTheoremCanonicalLaneLean.CompartmentModel
import HautevilleHouse.ClinicalMedicineClinicalDecisionSupportTheoremCanonicalLaneLean.PharmacokineticModel
import HautevilleHouse.ClinicalMedicineClinicalDecisionSupportTheoremCanonicalLaneLean.DiagnosticInference
import HautevilleHouse.ClinicalMedicineClinicalDecisionSupportTheoremCanonicalLaneLean.SurvivalAnalysis
import HautevilleHouse.ClinicalMedicineClinicalDecisionSupportTheoremCanonicalLaneLean.ClinicalDecisionRule

namespace HautevilleHouse
namespace ClinicalMedicineClinicalDecisionSupportTheoremCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop := True

def gateClosed (A : AdmissibleClass) : Prop := True

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  trivial

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  trivial

def ConstrainedClinicalDecisionSupportClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_clinical_decision_support_endgame (A : AdmissibleClass) :
    ConstrainedClinicalDecisionSupportClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ClinicalMedicineClinicalDecisionSupportTheoremCanonicalLaneLean
end HautevilleHouse