import canonicalLaneMathlib.AdmissibleClass
import ClinicalMedicineClinicalDecisionSupportTheoremCanonicalLaneLean.ClinicalDecisionSupportTheoremCanonicalLaneLean

namespace HautevilleHouse
namespace ClinicalMedicineClinicalDecisionSupportTheoremCanonicalLaneLean

def ConstrainedClinicalDecisionSupportClosure (A : ClinicalDecisionSupportAdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_clinical_decision_support_endgame (A : ClinicalDecisionSupportAdmissibleClass) :
    ConstrainedClinicalDecisionSupportClosure A := by
  -- proof: bridge and gate are derived from admissible class evidence
  have hbridge : bridgeClosed A := by
    -- from the combined evidence, each component is closed; we assume that is given
    exact A.combinedEvidence
  have hgate : gateClosed A := by
    -- gate holds by admissible class construction
    exact A.gateWitness
  exact And.intro hbridge hgate

end ClinicalMedicineClinicalDecisionSupportTheoremCanonicalLaneLean
end HautevilleHouse