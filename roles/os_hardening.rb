name "os_hardening"
description "Role for OS Hardening Combined Recipes"
run_list "recipe[system::hosts]","recipe[system::banner]","recipe[system::harden]","recipe[system::shells]","recipe[system::resolv]","recipe[system::mounts]"
