{ ... }:
{
  vim = {
    keymaps = [
      {
        key = "<c-l>";
        mode = "i";
        silent = true;
        # See https://castel.dev/post/lecture-notes-1/#correcting-spelling-mistakes-on-the-fly
        action = "<c-g>u<Esc>[s1z=`]i<c-g>u";
      }
      {
        key = "<c-j>";
        mode = [
          "i"
          "n"
        ];
        silent = true;
        action = "<Esc>mz[sea";
      }
      {
        key = "<c-k>";
        mode = [
          "i"
          "n"
        ];
        silent = true;
        action = "<Esc>mz]sea";
      }
      {
        key = "<c-h>";
        mode = [
          "i"
          "n"
        ];
        silent = true;
        action = "<Esc>`za";
      }
    ];
    spellcheck = {
      enable = true;
      # List of mathematical words
      extraSpellWords."en.utf-8" = [
        "abelian"
        "adjoint"
        "affine"
        "analytic"
        "argand"
        "asymptotic"
        "autocorrelation"
        "autonomous"
        "basis"
        "bijection"
        "bijectivity"
        "bolzano"
        "cardinality"
        "categorical"
        "cauchy"
        "codomain"
        "commutator"
        "contrapositive"
        "covariance"
        "cumulant"
        "curvature"
        "delta"
        "densities"
        "derivable"
        "diagonalizable"
        "diffeomorphic"
        "diffeomorphism"
        "differentiable"
        "dirichlet"
        "disjoint"
        "eigenfunction"
        "eigenspace"
        "eigenvalue"
        "eigenvector"
        "endomorphic"
        "endomorphism"
        "epimorphic"
        "epimorphism"
        "ergodic"
        "expectation"
        "fibration"
        "fieldaxiom"
        "frechet"
        "functor"
        "gaussian"
        "generators"
        "gradient"
        "groupoid"
        "hamiltonian"
        "hausdorff"
        "hermitian"
        "holomorphic"
        "homeomorphic"
        "homeomorphism"
        "homomorphic"
        "homomorphism"
        "homotopy"
        "hyperbolic"
        "hyperplane"
        "idempotent"
        "independent"
        "injective"
        "injectivity"
        "integrable"
        "invertible"
        "irreducible"
        "isometries"
        "isometry"
        "isomorphic"
        "isomorphism"
        "jacobian"
        "kernel"
        "kronecker"
        "lagrangian"
        "laplacian"
        "lebesgue"
        "linearity"
        "linearly"
        "lipschitz"
        "manifold"
        "martingale"
        "measurable"
        "monodromy"
        "monoid"
        "morphism"
        "multivariate"
        "nilpotent"
        "noetherian"
        "normalizer"
        "orthogonal"
        "orthonormal"
        "parametric"
        "pathwise"
        "permutation"
        "piecewise"
        "planarity"
        "polytope"
        "preimage"
        "primitive"
        "probabilistic"
        "projection"
        "quadrature"
        "quasiconvex"
        "random"
        "recurrence"
        "relativistic"
        "resolvent"
        "reversibility"
        "riemann"
        "rng"
        "scalar"
        "schur"
        "separable"
        "spectral"
        "spectrum"
        "stationary"
        "stochastic"
        "subadditive"
        "subgroup"
        "submanifold"
        "subset"
        "subspace"
        "surjection"
        "surjectivity"
        "symplectic"
        "tangential"
        "taylor"
        "topology"
        "transcendental"
        "transition"
        "transpose"
        "ultrafilter"
        "unitary"
        "variational"
        "vectorial"
        "wellordered"
        "zorn"
      ];
    };
  };
}
