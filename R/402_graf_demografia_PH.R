message( paste( rep('-', 100 ), collapse = '' ) )
message( '\tGraficando demografia 2009-2018' )

# Plantilla gráfica ------------------------------------------------------------
source( 'R/401_graf_plantilla.R', encoding = 'UTF-8', echo = FALSE )

load(paste0( parametros$RData, 'IESS_HIP_demografia.RData' ))


#-------------------------------------------------------------------------------
message( paste( rep('-', 100 ), collapse = '' ) )
rm( list = ls()[ !( ls() %in% c( 'parametros' ) ) ] )
gc()
