## R CMD check results

0 errors | 0 warnings | 3 notes

* This is a new release.

❯ Found the following (possibly) invalid DOIs:
    DOI: 10.32614/CRAN.package.flowmapblue
      From: inst/CITATION
      Status: 404
      Message: Not Found

**Maintainer comment**: Using DOI that will be assigned if package is accepted to CRAN.    

❯ checking installed package size ... NOTE
    installed size is  5.0Mb
    sub-directories of 1Mb or more:
      htmlwidgets   3.9Mb


**Maintainer comment**: The package is large because it needs to bundle a js library.

❯ checking DESCRIPTION meta-information ... NOTE
  License stub is invalid DCF.

**Maintainer comment**: I have search the internet about this error and found nothing... I would appretiate help with that. I also found that some existing packages have this note too. E.g. https://cran.rstudio.com/web/checks/check_results_OpenCL.html
