import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalDecisionSupportTheoremCanonicalLaneLean

structure CompartmentModelPackage where
  compartments : Nat
  ratesMatrix : Type u
  initialConcentrations : Type v
  solutionFamily : Prop
  wellStirredAssumption : Prop

structure CompartmentModelEvidence (C : CompartmentModelPackage) where
  solutionFamilyClosed : C.solutionFamily
  wellStirredAssumptionClosed : C.wellStirredAssumption

def CompartmentModelClosed (C : CompartmentModelPackage) : Prop :=
  C.solutionFamily ∧ C.wellStirredAssumption

theorem compartment_model_closed_from_evidence (C : CompartmentModelPackage)
    (E : CompartmentModelEvidence C) : CompartmentModelClosed C := by
  exact And.intro E.solutionFamilyClosed E.wellStirredAssumptionClosed

end ClinicalMedicineClinicalDecisionSupportTheoremCanonicalLaneLean
end HautevilleHouse