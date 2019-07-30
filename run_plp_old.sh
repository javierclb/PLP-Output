#!/bin/bash
#
#
#
# Binario de PLP
#
PLPBIN=/usr/local/bin/plp_ce 

#
# Interfaz de usuario
#
export PLP_INTERFAZ_MODE=si

#
# Convenios de Riego
#  
export PLP_CONVLAJA_MODE=no
export PLP_CONVMAULE_MODE=si
export PLP_RESTRALCO_MODE=no

#
# Escalamiento
#
export PLP_SCALE_MODE=si
export PLP_SCALEOBJ_MODE=1e3
export PLP_SCALEPHI_MODE=1e6
export PLP_ANGZERO_MODE=si 
export PLP_FILTRAC_MODE=lineal
#
# Parametros de cortes de optimalidad y factibilidad
#
export PLP_OPTIEPS_VALUE=1e-8
export PLP_OPTIMLD_VALUE=1e10
export PLP_FACTEPS_VALUE=1e-8
export PLP_FACTMLD_VALUE=1e10
export PLP_FACTMXC_VALUE=1000
export PLP_FACTDBL_VALUE=1
#
# Tolerancias
#
export PLP_EPOPT_VALUE=1e-9
export PLP_EPRHS_VALUE=1e-9

#
# Afluentes ficticios
#
export PLP_AFLUFICT_MODE=si

#
# Modos de uso de cortes de optimalidad
#
export PLP_ONEPHI_MODE=no
export PLP_SEPARACF_MODE=no
#export PLP_ZSPFBEST_MODE=no

#
# OMP y Paralel mode
#
export PLP_PARAL_MODE=si
# export OMP_SCHEDULE=dynamic,2
# export OMP_STACKSIZE=4048M
#export OMP_NUM_THREADS=19


#
#  Ejecucion binario
#
exec $PLPBIN
