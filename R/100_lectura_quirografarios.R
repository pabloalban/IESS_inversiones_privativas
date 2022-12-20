message( paste( rep('-', 100 ), collapse = '' ) )
#Lectura de cuentas_individuales -------------------------------------------------------------------
message( '\tLeyendo base de quirografarios' )

file <-paste0(parametros$Data, 'OFICIO_IESS_DG_2022_0853_OF_PQ.txt' )

col_typ <- c("character",
             "character",
             "character", 
             "character", 
             "character",
             "character",
             "character",
             "character",
             "numeric", 
             "numeric", 
             "numeric", 
             "numeric", 
             "numeric" )

#Base PQ al 31/07/2022
base_pq <- (read.table(file,
                      skip=3,
                      dec = ",",
                      header = TRUE,
                      sep = "\t",
                      #na.strings = "",
                      fill = TRUE,
                      encoding="UTF-8",
                      nrows = 1000,
                      #colClasses = col_typ,
                      row.names = NULL)) %>% clean_names()

#Se guarda la información en extensión .RData-------------------------------------------------------
save( base_pq,
  file = paste0( parametros$RData, 'IESS_CES_cuentas_individuales.RData' ) )

################################################################################################
message( paste( rep('-', 100 ), collapse = '' ) )
rm( list = ls()[ !( ls() %in% c( 'parametros' ) ) ] )
gc()