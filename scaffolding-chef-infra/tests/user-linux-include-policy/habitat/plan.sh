#######################################
# User plan for ci testing
# This tests a user interacting with scaffold API
#######################################

#@IgnoreInspection BashAddShebang
if [ -z "${CINC_POLICYFILE+x}" ]; then
  policy_name="ci"
else
  policy_name="${CINC_POLICYFILE}"
fi

pkg_name=user-linux-include-policy
pkg_origin=ci
pkg_version="1.0.0"
pkg_scaffolding="ci/scaffolding-cinc-infra"
pkg_svc_user=("root")
scaffold_policy_name="$policy_name"

# Required Metadata for CI
pkg_description="CI Test Plan for include policy Linux"
pkg_license="Apache-2.0"
pkg_maintainer="The Habitat Maintainers humans@habitat.sh"
pkg_upstream_url="https://cinc.sh"
