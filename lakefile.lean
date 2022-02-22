import Lake

open Lake DSL System

package mathport {
  dependencies := #[{
    name := "mathlib",
    -- We point to a particular commit in mathlib4,
    -- as changes to tactics in mathlib4 may cause breakages here.
    -- Please ensure that `lean-toolchain` points to the same release of Lean 4
    -- as this commit of mathlib4 uses.
    src := Source.git "https://github.com/leanprover-community/mathlib4.git" "7a5aae87c88b62c84c34eadaeb19f8f753f2bafc"
  }],
  binRoot := `MathportApp
  moreLinkArgs := if Platform.isWindows then #[] else #["-rdynamic", "-L/home/mario/.elan/toolchains/leanprover--lean4---nightly-2022-02-06/lib"]
}
