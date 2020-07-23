file(REMOVE_RECURSE
  "libsysrepo.pdb"
  "libsysrepo.so"
  "libsysrepo.so.5"
  "libsysrepo.so.5.5.8"
)

# Per-language clean rules from dependency scanning.
foreach(lang C)
  include(CMakeFiles/sysrepo.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
