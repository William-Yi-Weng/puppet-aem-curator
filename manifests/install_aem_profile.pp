define aem_curator::install_aem_profile (
  $aem_license_base,
  $aem_artifacts_base,
  $aem_healthcheck_version,
  $aem_port,
  $aem_profile,
  $aem_ssl_port,
  $run_modes,
  $tmp_dir,
  $aem_debug_port          = undef,
  $aem_base                = '/opt',
  $aem_healthcheck_source  = undef,
  $aem_id                  = 'aem',
  $aem_type                = undef,
  $aem_jvm_mem_opts        = '-Xss4m -Xmx8192m',
  $aem_sample_content      = false,
  $aem_jvm_opts            = [
    '-XX:+PrintGCDetails',
    '-XX:+PrintGCTimeStamps',
    '-XX:+PrintGCDateStamps',
    '-XX:+PrintTenuringDistribution',
    '-XX:+PrintGCApplicationStoppedTime',
    '-XX:+HeapDumpOnOutOfMemoryError',
  ],
  $post_install_sleep_secs = 120,
) {

  Resource["aem_curator::install_${aem_profile}"]  { "${aem_id}: Install AEM profile ${aem_profile}":
    aem_license_base        => $aem_license_base,
    aem_artifacts_base      => $aem_artifacts_base,
    aem_base                => $aem_base,
    aem_healthcheck_version => $aem_healthcheck_version,
    aem_healthcheck_source  => $aem_healthcheck_source,
    aem_id                  => $aem_id,
    aem_type                => $aem_type,
    aem_jvm_mem_opts        => $aem_jvm_mem_opts,
    aem_port                => $aem_port,
    aem_debug_port          => $aem_debug_port,
    aem_sample_content      => $aem_sample_content,
    aem_jvm_opts            => $aem_jvm_opts,
    post_install_sleep_secs => $post_install_sleep_secs,
    run_modes               => $run_modes,
    tmp_dir                 => $tmp_dir,
  }
}
