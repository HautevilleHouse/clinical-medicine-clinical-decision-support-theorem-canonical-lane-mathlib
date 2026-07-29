import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalDecisionSupportTheoremCanonicalLaneLean

structure PharmacokineticPackage where
  drug : Type
  absorptionModel : Type
  distributionModel : Type
  eliminationModel : Type
  bioavailability : Prop
  halfLifePositive : Prop

structure PharmacokineticEvidence (P : PharmacokineticPackage) where
  bioavailabilityClosed : P.bioavailability
  halfLifePositiveClosed : P.halfLifePositive

def PharmacokineticClosed (P : PharmacokineticPackage) : Prop :=
  P.bioavailability ∧ P.halfLifePositive

theorem pharmacokinetic_closed_from_evidence (P : PharmacokineticPackage)
    (E : PharmacokineticEvidence P) : PharmacokineticClosed P := by
  exact And.intro E.bioavailabilityClosed E.halfLifePositiveClosed

end ClinicalMedicineClinicalDecisionSupportTheoremCanonicalLaneLean
end HautevilleHouse