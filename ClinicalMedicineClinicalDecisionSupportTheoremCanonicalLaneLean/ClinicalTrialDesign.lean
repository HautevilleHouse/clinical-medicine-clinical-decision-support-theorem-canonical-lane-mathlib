import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalDecisionSupportTheoremCanonicalLaneLean

structure ClinicalTrialDesignPackage where
  randomizationAllocation : Prop
  blindingMethod : Prop
  sampleSizeComputed : Prop
  primaryEndpoint : Prop
  statisticalAnalysisPlan : Prop

structure ClinicalTrialDesignEvidence (T : ClinicalTrialDesignPackage) where
  randomizationAllocationClosed : T.randomizationAllocation
  blindingMethodClosed : T.blindingMethod
  sampleSizeComputedClosed : T.sampleSizeComputed
  primaryEndpointClosed : T.primaryEndpoint
  statisticalAnalysisPlanClosed : T.statisticalAnalysisPlan

def ClinicalTrialDesignClosed (T : ClinicalTrialDesignPackage) : Prop :=
  T.randomizationAllocation ∧ T.blindingMethod ∧ T.sampleSizeComputed ∧
  T.primaryEndpoint ∧ T.statisticalAnalysisPlan

theorem clinical_trial_design_closed_from_evidence
    (T : ClinicalTrialDesignPackage) (E : ClinicalTrialDesignEvidence T) :
    ClinicalTrialDesignClosed T := by
  exact And.intro E.randomizationAllocationClosed
    (And.intro E.blindingMethodClosed
      (And.intro E.sampleSizeComputedClosed
        (And.intro E.primaryEndpointClosed E.statisticalAnalysisPlanClosed)))

end ClinicalMedicineClinicalDecisionSupportTheoremCanonicalLaneLean
end HautevilleHouse
