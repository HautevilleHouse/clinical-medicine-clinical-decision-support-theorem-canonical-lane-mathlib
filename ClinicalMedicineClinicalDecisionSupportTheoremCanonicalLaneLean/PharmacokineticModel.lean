import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalDecisionSupportTheoremCanonicalLaneLean

/-! # Pharmacokinetic Model Package -/

structure PharmacokineticModelPackage where
  absorptionRate : Prop
  distributionVolume : Prop
  eliminationRate : Prop
  linearKinetics : Prop
  doseResponseRelation : Prop
  steadyStateConcentration : Prop

structure PharmacokineticModelEvidence (P : PharmacokineticModelPackage) where
  absorptionRateClosed : P.absorptionRate
  distributionVolumeClosed : P.distributionVolume
  eliminationRateClosed : P.eliminationRate
  linearKineticsClosed : P.linearKinetics
  doseResponseRelationClosed : P.doseResponseRelation
  steadyStateConcentrationClosed : P.steadyStateConcentration

def PharmacokineticModelClosed (P : PharmacokineticModelPackage) : Prop :=
  P.absorptionRate ∧ P.distributionVolume ∧ P.eliminationRate ∧
  P.linearKinetics ∧ P.doseResponseRelation ∧ P.steadyStateConcentration

theorem pharmacokinetic_model_closed_from_evidence (P : PharmacokineticModelPackage)
    (E : PharmacokineticModelEvidence P) : PharmacokineticModelClosed P := by
  exact And.intro E.absorptionRateClosed
    (And.intro E.distributionVolumeClosed
      (And.intro E.eliminationRateClosed
        (And.intro E.linearKineticsClosed
          (And.intro E.doseResponseRelationClosed E.steadyStateConcentrationClosed))))

end ClinicalMedicineClinicalDecisionSupportTheoremCanonicalLaneLean
end HautevilleHouse