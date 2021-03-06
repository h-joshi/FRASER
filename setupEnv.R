BTYPE <- "both"
NCPUS <- 6

print_log <- function(...){
    hash_line <- paste0(rep("#", 10), collapse="")
    message(paste0("\n", hash_line, "\n### ", date(), 
            ": ", ..., "\n", hash_line, "\n"))
}

installIfReq <- function(p, type=BTYPE, Ncpus=NCPUS, ...){
    for(j in p){
        if(!requireNamespace(j, quietly=TRUE)){
            print_log("Install ", j)
            INSTALL(j, type=type, Ncpus=Ncpus, ...)
        }
    }
}

if(!requireNamespace("BiocManager", quietly=TRUE)){
    print_log("Install BiocManager")
    install.packages("BiocManager", Ncpus=NCPUS)
}
INSTALL <- BiocManager::install

# because of https://github.com/r-windows/rtools-installer/issues/3
if("windows" == .Platform$OS.type){
    print_log("Install XML on windows ...")
    BTYPE <- "win.binary"
    installIfReq(p=c("XML", "xml2", "RSQLite", "progress", 
            "AnnotationDbi", "BiocCheck"))
    
    print_log("Install source packages only for windows ...")
    INSTALL(c("GenomeInfoDbData", "org.Hs.eg.db", 
            "TxDb.Hsapiens.UCSC.hg19.knownGene"), type="both")
} else {
    BTYPE <- "source"
}

# install needed packages
# add testthat to pre installation dependencies 
# due to: https://github.com/r-lib/pkgload/issues/89
for(p in c("getopt", "XML", "xml2", "testthat", "devtools", "covr",
            "roxygen2", "BiocCheck", "R.utils", "GenomeInfoDbData",
            "rtracklayer", "hms")){
    installIfReq(p=p, type=BTYPE, Ncpus=NCPUS)
}

# install package with its dependencies with a timeout due to travis 50 min
R.utils::withTimeout(timeout=2400, {
    try({
        print_log("Update packages")
        INSTALL(ask=FALSE, type=BTYPE, Ncpus=NCPUS)
        BiocManager::valid()
    
        print_log("Install dev package")
        devtools::install(".", dependencies=TRUE, upgrade=TRUE, 
                type=BTYPE, Ncpus=NCPUS)
    })
})
