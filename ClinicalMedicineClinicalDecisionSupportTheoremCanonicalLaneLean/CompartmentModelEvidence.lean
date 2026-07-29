import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalDecisionSupportTheoremCanonicalLaneLean

structure CompartmentModelPackage where
  numCompartments : Nat
  transferRates : Type
  initialConditions : Type
  massBalance : Prop
  steadyStateExistence : Prop

structure CompartmentModelEvidence (C : CompartmentModelPackage) where
  massBalanceClosed : C.massBalance
  steadyStateExistenceClosed : C.steadyStateExistence

def CompartmentModelClosed (C : CompartmentModelPackage) : Prop :=
  C.massBalance ∧ C.steadyStateExistence

theorem compartment_model_closed_from_evidence (C : CompartmentModelPackage)
    (E : CompartmentModelEvidence C) : CompartmentModelClosed C := by
  exact And.intro E.massBalanceClosed E.steadyStateExistenceClosed

end ClinicalMedicineClinicalDecisionSupportTheoremCanonicalLaneLean
end HautevilleHouse