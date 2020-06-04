SCAFFOLD_PKG_CHEF_CLIENT_VERSION="$(echo "${scaffold_cinc_client}" | cut -d/ -f3)"

@test "API: scaffold_cinc_client version matches test version" {
  result="$(hab pkg exec ${TEST_PKG_IDENT} cinc-client -v | head -n 1 | awk '{print $2}')"
  [ "${result}" = "${SCAFFOLD_PKG_CINC_CLIENT_VERSION}" ]
}

@test "API: scaffold_cacerts matches run hook SSL_CERT_FILE" {
  result="$(grep '^export SSL_CERT_FILE.*' /hab/svc/${TEST_PKG_NAME}/hooks/run | cut -d/ -f4-5)"
  [ "${result}" = "${scaffold_cacerts}" ]
}

@test "API: scaffold_cacerts matches run hook SSL_CERT_DIR" {
  result="$(grep '^export SSL_CERT_DIR.*' /hab/svc/${TEST_PKG_NAME}/hooks/run | cut -d/ -f4-5)"
  [ "${result}" = "${scaffold_cacerts}" ]
}

teardown(){
  if [ "${BATS_TEST_NUMBER}" -eq ${#BATS_TEST_NAMES[@]} ]; then
    hab svc unload "${TEST_PKG_IDENT}" || true
  fi
}
