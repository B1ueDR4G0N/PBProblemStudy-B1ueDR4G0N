# Install script for directory: /home/bluedragon/PBSolver/SCIP/vendor/scip/src

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/bluedragon/PBSolver/SCIP/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/lpi" TYPE FILE FILES
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/lpi/lpi.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/lpi/type_lpi.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/dijkstra" TYPE FILE FILES "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/dijkstra/dijkstra.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/objscip" TYPE FILE FILES
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/objscip/objbenders.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/objscip/objbenderscut.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/objscip/objbranchrule.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/objscip/objcloneable.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/objscip/objconshdlr.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/objscip/objcutsel.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/objscip/objdialog.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/objscip/objdisp.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/objscip/objeventhdlr.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/objscip/objheur.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/objscip/objmessagehdlr.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/objscip/objnodesel.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/objscip/objpresol.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/objscip/objpricer.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/objscip/objprobcloneable.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/objscip/objprobdata.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/objscip/objprop.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/objscip/objreader.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/objscip/objrelax.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/objscip/objscipdefplugins.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/objscip/objscip.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/objscip/objsepa.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/objscip/objtable.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/objscip/objvardata.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/objscip/type_objcloneable.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/objscip/type_objprobcloneable.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/scip" TYPE FILE FILES
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/bandit.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/bandit_epsgreedy.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/bandit_exp3.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/bandit_exp3ix.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/bandit_ucb.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/benders.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/benders_default.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/benderscut.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/benderscut_feas.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/benderscut_feasalt.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/benderscut_int.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/benderscut_nogood.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/benderscut_opt.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/bendersdefcuts.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/bitencode.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/boundstore.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/branch_allfullstrong.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/branch_cloud.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/branch_distribution.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/branch_fullstrong.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/branch_gomory.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/branch.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/branch_inference.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/branch_leastinf.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/branch_lookahead.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/branch_mostinf.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/branch_multaggr.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/branch_nodereopt.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/branch_pscost.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/branch_random.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/branch_relpscost.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/branch_vanillafullstrong.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/clock.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/compr.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/compr_largestrepr.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/compr_weakcompr.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/concsolver.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/concsolver_scip.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/concurrent.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/conflict.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/conflict_graphanalysis.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/conflict_dualproofanalysis.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/conflict_general.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/conflictstore.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/cons_abspower.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/cons_and.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/cons_benders.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/cons_benderslp.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/cons_bounddisjunction.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/cons_cardinality.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/cons_components.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/cons_conjunction.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/cons_countsols.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/cons_cumulative.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/cons_disjunction.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/cons_fixedvar.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/cons.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/cons_indicator.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/cons_integral.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/cons_knapsack.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/cons_linear.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/cons_linking.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/cons_logicor.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/cons_nonlinear.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/cons_orbisack.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/cons_orbitope.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/cons_or.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/cons_pseudoboolean.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/cons_quadratic.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/cons_setppc.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/cons_soc.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/cons_sos1.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/cons_sos2.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/cons_superindicator.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/cons_symresack.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/cons_varbound.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/cons_xor.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/cutpool.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/cuts.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/cutsel.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/cutsel_ensemble.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/cutsel_hybrid.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/cutsel_dynamic.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/dbldblarith.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/debug.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/dcmp.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/def.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/dialog_default.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/dialog.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/disp_default.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/disp.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/event_globalbnd.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/event.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/event_estim.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/event_shadowtree.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/event_softtimelimit.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/event_solvingphase.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/expr.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/expr_abs.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/expr_entropy.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/expr_erf.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/expr_exp.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/expr_log.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/expr_pow.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/expr_product.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/expr_sum.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/expr_trig.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/expr_value.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/expr_var.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/expr_varidx.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/exprinterpret.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/heur_actconsdiving.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/heur_adaptivediving.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/heur_bound.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/heur_clique.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/heur_coefdiving.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/heur_completesol.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/heur_conflictdiving.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/heur_crossover.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/heur_dins.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/heur_distributiondiving.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/heur_dps.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/heur_dualval.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/heur_farkasdiving.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/heur_feaspump.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/heur_fixandinfer.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/heur_fracdiving.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/heur_gins.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/heur_guideddiving.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/heur.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/heur_indicator.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/heur_indicatordiving.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/heur_intdiving.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/heur_intshifting.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/heuristics.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/heur_linesearchdiving.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/heur_localbranching.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/heur_locks.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/heur_alns.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/heur_lpface.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/heur_multistart.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/heur_mutation.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/heur_mpec.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/heur_nlpdiving.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/heur_objpscostdiving.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/heur_octane.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/heur_ofins.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/heur_oneopt.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/heur_padm.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/heur_proximity.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/heur_pscostdiving.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/heur_randrounding.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/heur_rens.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/heur_reoptsols.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/heur_repair.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/heur_rins.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/heur_rootsoldiving.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/heur_rounding.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/heur_scheduler.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/heur_shiftandpropagate.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/heur_shifting.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/heur_simplerounding.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/heur_subnlp.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/heur_sync.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/heur_trivial.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/heur_trivialnegation.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/heur_trustregion.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/heur_trysol.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/heur_twoopt.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/heur_undercover.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/heur_vbounds.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/heur_veclendiving.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/heur_zeroobj.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/heur_zirounding.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/history.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/implics.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/interrupt.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/intervalarith.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/lapack_calls.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/lp.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/mem.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/message_default.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/message.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/misc.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/nlhdlr_bilinear.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/nlhdlr_convex.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/nlhdlr_default.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/nlhdlr_perspective.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/nlhdlr_quadratic.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/nlhdlr_quotient.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/nlhdlr_signomial.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/nlhdlr_soc.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/nlhdlr.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/nlp.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/nlpi.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/nlpioracle.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/nlpi_all.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/nlpi_filtersqp.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/nlpi_ipopt.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/nlpi_worhp.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/nodesel_bfs.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/nodesel_breadthfirst.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/nodesel_dfs.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/nodesel_estimate.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/nodesel.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/nodesel_hybridestim.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/nodesel_restartdfs.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/nodesel_uct.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/paramset.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/presol_boundshift.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/presol_milp.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/presol_convertinttobin.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/presol_domcol.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/presol_dualagg.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/presol_dualcomp.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/presol_dualinfer.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/presol_gateextraction.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/presol.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/presol_implics.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/presol_inttobinary.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/presol_qpkktref.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/presol_redvub.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/presol_sparsify.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/presol_dualsparsify.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/presol_stuffing.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/presol_trivial.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/presol_tworowbnd.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/presolve.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/pricer.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/pricestore.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/primal.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/prob.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/prop_dualfix.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/prop_genvbounds.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/prop.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/prop_nlobbt.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/prop_obbt.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/prop_probing.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/prop_pseudoobj.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/prop_redcost.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/prop_rootredcost.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/prop_symmetry.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/prop_sync.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/prop_vbounds.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/pub_branch.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/pub_bandit.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/pub_bandit_epsgreedy.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/pub_bandit_exp3.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/pub_bandit_exp3ix.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/pub_bandit_ucb.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/pub_benders.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/pub_benderscut.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/pub_compr.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/pub_conflict.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/pub_cons.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/pub_cutpool.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/pub_cutsel.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/pub_dcmp.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/pub_dialog.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/pub_disp.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/pub_event.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/pub_expr.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/pub_fileio.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/pub_heur.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/pub_history.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/pub_implics.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/pub_lp.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/pub_matrix.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/pub_message.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/pub_misc.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/pub_misc_linear.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/pub_misc_rowprep.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/pub_misc_select.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/pub_misc_sort.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/pub_nlhdlr.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/pub_nlp.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/pub_nlpi.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/pub_nodesel.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/pub_paramset.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/pub_presol.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/pub_pricer.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/pub_prop.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/pub_reader.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/pub_relax.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/pub_reopt.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/pub_sepa.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/pub_sol.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/pub_table.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/pub_tree.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/pub_var.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/rbtree.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/reader_bnd.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/reader_ccg.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/reader_cip.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/reader_cnf.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/reader_cor.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/reader_dec.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/reader_diff.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/reader_fix.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/reader_fzn.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/reader_gms.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/reader.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/reader_lp.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/reader_mps.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/reader_mst.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/reader_nl.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/reader_opb.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/reader_osil.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/reader_pbm.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/reader_pip.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/reader_ppm.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/reader_rlp.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/reader_sol.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/reader_smps.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/reader_sto.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/reader_tim.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/reader_wbo.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/reader_zpl.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/relax.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/reopt.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/retcode.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/scipbuildflags.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/scipcoreplugins.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/scipdefplugins.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/scipgithash.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/scip.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/scip_bandit.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/scip_benders.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/scip_branch.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/scip_compr.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/scip_concurrent.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/scip_conflict.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/scip_cons.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/scip_copy.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/scip_cut.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/scip_cutsel.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/scip_datastructures.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/scip_debug.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/scip_dcmp.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/scip_dialog.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/scip_disp.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/scip_event.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/scip_expr.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/scip_general.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/scip_heur.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/scip_lp.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/scip_mem.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/scip_message.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/scip_nlp.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/scip_nlpi.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/scip_nodesel.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/scip_numerics.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/scip_param.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/scip_presol.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/scip_pricer.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/scip_prob.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/scip_probing.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/scip_prop.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/scip_randnumgen.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/scip_reader.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/scip_relax.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/scip_reopt.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/scip_sepa.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/scip_sol.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/scip_solve.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/scip_solvingstats.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/scip_table.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/scip_timing.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/scip_tree.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/scip_validation.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/scip_var.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/scipshell.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/sepa_cgmip.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/sepa_clique.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/sepa_closecuts.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/sepa_aggregation.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/sepa_convexproj.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/sepa_disjunctive.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/sepa_eccuts.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/sepa_gauge.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/sepa_gomory.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/sepa.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/sepa_impliedbounds.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/sepa_interminor.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/sepa_intobj.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/sepa_lagromory.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/sepa_mcf.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/sepa_minor.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/sepa_mixing.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/sepa_oddcycle.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/sepa_rapidlearning.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/sepa_rlt.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/sepastore.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/sepa_zerohalf.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/set.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/sol.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/solve.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/stat.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/struct_bandit.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/struct_benders.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/struct_benderscut.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/struct_branch.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/struct_clock.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/struct_compr.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/struct_concsolver.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/struct_concurrent.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/struct_conflict.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/struct_conflictstore.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/struct_cons.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/struct_cutpool.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/struct_cuts.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/struct_cutsel.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/struct_dcmp.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/struct_dialog.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/struct_disp.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/struct_event.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/struct_expr.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/struct_heur.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/struct_history.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/struct_implics.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/struct_lp.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/struct_matrix.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/struct_mem.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/struct_message.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/struct_misc.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/struct_nlhdlr.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/struct_nlp.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/struct_nlpi.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/struct_nodesel.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/struct_paramset.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/struct_presol.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/struct_pricer.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/struct_pricestore.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/struct_primal.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/struct_prob.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/struct_prop.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/struct_reader.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/struct_relax.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/struct_reopt.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/struct_scip.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/struct_sepa.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/struct_sepastore.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/struct_set.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/struct_sol.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/struct_stat.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/struct_syncstore.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/struct_table.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/struct_tree.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/struct_var.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/struct_visual.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/symmetry.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/symmetry_graph.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/symmetry_orbitopal.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/symmetry_orbital.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/symmetry_lexred.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/syncstore.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/table_default.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/table.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/tree.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/treemodel.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/type_bandit.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/type_benders.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/type_benderscut.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/type_branch.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/type_clock.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/type_compr.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/type_concsolver.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/type_concurrent.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/type_conflict.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/type_conflictstore.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/type_cons.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/type_cutpool.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/type_cuts.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/type_cutsel.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/type_dcmp.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/type_dialog.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/type_disp.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/type_event.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/type_expr.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/type_exprinterpret.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/type_heur.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/type_history.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/type_implics.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/type_interrupt.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/type_lp.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/type_matrix.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/type_mem.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/type_message.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/type_misc.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/type_nlhdlr.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/type_nlp.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/type_nlpi.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/type_nodesel.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/type_paramset.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/type_presol.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/type_pricer.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/type_pricestore.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/type_primal.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/type_prob.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/type_prop.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/type_reader.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/type_relax.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/type_reopt.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/type_result.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/type_retcode.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/type_scip.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/type_sepa.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/type_sepastore.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/type_set.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/type_sol.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/type_stat.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/type_syncstore.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/type_table.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/type_timing.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/type_tree.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/type_var.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/type_visual.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/var.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/scip/visual.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip-build/scip/config.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip-build/scip/scip_export.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/tclique" TYPE FILE FILES
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/tclique/tclique_coloring.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/tclique/tclique_def.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/tclique/tclique.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/tinycthread" TYPE FILE FILES "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/tinycthread/tinycthread.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/tpi" TYPE FILE FILES
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/tpi/def_openmp.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/tpi/tpi.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/tpi/type_tpi.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/xml" TYPE FILE FILES
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/xml/xmldef.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/xml/xml.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/symmetry" TYPE FILE FILES
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/symmetry/build_sassy_graph.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/symmetry/compute_symmetry.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/symmetry/struct_symmetry.h"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/symmetry/type_symmetry.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/blockmemshell" TYPE FILE FILES "/home/bluedragon/PBSolver/SCIP/vendor/scip/src/blockmemshell/memory.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/scip" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/scip")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/scip"
         RPATH "/home/bluedragon/PBSolver/SCIP/local/lib")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "/home/bluedragon/PBSolver/SCIP/vendor/scip-build/bin/scip")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/scip" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/scip")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/scip"
         OLD_RPATH "::::::::::::::::::::::::::::::::::::::::"
         NEW_RPATH "/home/bluedragon/PBSolver/SCIP/local/lib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/scip")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libscip.so.9.2.4.0"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libscip.so.9.2"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHECK
           FILE "${file}"
           RPATH "")
    endif()
  endforeach()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/home/bluedragon/PBSolver/SCIP/vendor/scip-build/lib/libscip.so.9.2.4.0"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip-build/lib/libscip.so.9.2"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libscip.so.9.2.4.0"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libscip.so.9.2"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/usr/bin/strip" "${file}")
      endif()
    endif()
  endforeach()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/bluedragon/PBSolver/SCIP/vendor/scip-build/lib/libscip.so")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/scip/scip-targets.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/scip/scip-targets.cmake"
         "/home/bluedragon/PBSolver/SCIP/vendor/scip-build/src/CMakeFiles/Export/440faded5223945d68a0ef6070a73d3d/scip-targets.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/scip/scip-targets-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/scip/scip-targets.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/scip" TYPE FILE FILES "/home/bluedragon/PBSolver/SCIP/vendor/scip-build/src/CMakeFiles/Export/440faded5223945d68a0ef6070a73d3d/scip-targets.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/scip" TYPE FILE FILES "/home/bluedragon/PBSolver/SCIP/vendor/scip-build/src/CMakeFiles/Export/440faded5223945d68a0ef6070a73d3d/scip-targets-release.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/scip" TYPE FILE FILES
    "/home/bluedragon/PBSolver/SCIP/vendor/scip-build/CMakeFiles/scip-config.cmake"
    "/home/bluedragon/PBSolver/SCIP/vendor/scip-build/scip-config-version.cmake"
    )
endif()

