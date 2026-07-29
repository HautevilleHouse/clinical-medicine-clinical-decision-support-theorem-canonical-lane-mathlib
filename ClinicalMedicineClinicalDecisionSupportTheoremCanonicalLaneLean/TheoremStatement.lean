import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalDecisionSupportTheoremCanonicalLaneLean

def sourceRepository : String :=
  "clinical-medicine-clinical-decision-support-theorem-canonical-lane"

def sourceDescription : String :=
  "Clinical Medicine Clinical Decision Support Theorem"

structure TheoremBoundary where
  claimBoundary : String

def sourceTheoremBoundary : TheoremBoundary :=
  { claimBoundary := "Classical source boundary" }

structure FormalizationCertificate where
  theoremBoundaryOpen : Bool
  sourceConjectureClosureClaimed : Bool

def formalizationCertificate : FormalizationCertificate :=
  { theoremBoundaryOpen := true,
    sourceConjectureClosureClaimed := false }

structure TheoremStatement where
  sourceKey : String
  theoremName : String
  theoremObject : String
  classicalBoundary : String
  manifoldConstrainedStatement : String
  certificateLane : String
  carriedRemainder : String

def baselineCertificateLane : String :=
  "manifold_constrained"

def sourceTheoremStatement : TheoremStatement :=
  { sourceKey := sourceRepository,
    theoremName := sourceRepository,
    theoremObject := sourceDescription,
    classicalBoundary := sourceTheoremBoundary.claimBoundary,
    manifoldConstrainedStatement := "AdmissibleClass bridge for Clinical Medicine Clinical Decision Support Theorem",
    certificateLane := baselineCertificateLane,
    carriedRemainder := "Classical source boundary carried by formalizationCertificate.theoremBoundaryOpen"
  }

end ClinicalMedicineClinicalDecisionSupportTheoremCanonicalLaneLean
end HautevilleHouse
