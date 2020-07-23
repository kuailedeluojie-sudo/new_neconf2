file(REMOVE_RECURSE
  "libyang.pdb"
  "libyang.so"
  "libyang.so.1"
  "libyang.so.1.8.4"
)

# Per-language clean rules from dependency scanning.
foreach(lang C)
  include(CMakeFiles/yang.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
