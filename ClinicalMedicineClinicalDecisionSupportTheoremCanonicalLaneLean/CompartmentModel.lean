import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ClinicalMedicineClinicalDecisionSupportTheoremCanonicalLaneLean.ClinicalDecisionSupportTheorem

namespace HautevilleHouse
namespace ClinicalMedicineClinicalDecisionSupportTheoremCanonicalLaneLean

structure CompartmentModelPackage (A : AdmissibleClass) where
  compartments : List Type
  rates : A.object.patientData → A.object.patientData → Prop
  conservationLaw : Prop
  initialConditions : Prop
  solutionExistence : Prop

structure CompartmentModelEvidence {A : AdmissibleClass}
    (C : CompartmentModelPackage A) where
  conservationLawClosed : C.conservationLaw
  initialConditionsClosed : C.initialConditions
  solutionExistenceClosed : C.solutionExistence

def CompartmentModelClosed {A : AdmissibleClass}
    (C : CompartmentModelPackage A) : Prop :=
  C.conservationLaw ∧ C.initialConditions ∧ C.solutionExistence

theorem compartment_model_closed_from_evidence
    {A : AdmissibleClass} (C : CompartmentModelPackage A)
    (E : CompartmentModelEvidence C) : CompartmentModelClosed C := by
  exact And.intro E.conservationLawClosed
    (And.intro E.initialConditionsClosed E.solutionExistenceClosed)

end ClinicalMedicineClinicalDecisionSupportTheoremCanonicalLaneLean
end HautevilleHouse