
*TABLE 2
*Log of Lethality
gen logleth = log(lethality+1)
destring sponsors, replace
destring ties, replace

*Country FEs Code
encode country, gen(ccode)

*Models 1-4
reg logleth jihadist, r
reg logleth jihadist i.ccode, r
reg logleth jihadist age intas ties sponsors, r
reg logleth jihadist age intas ties sponsors i.ccode, r

*TABLE 3
*Models 1-2
reg logleth jihadist suicide age intas ties sponsors, r
reg logleth jihadist suicide age intas ties sponsors i.ccode, r

*TABLE 4
*Alternative measures of lethality
gen logks = log(kills+1)
gen logatks = log(attacks) //1 not added because all observations have greater than zero attacks
gen logwd = log(wounded+1)
gen casualties = 0
replace casualties = kills + wounded
gen logcslts = log(casualties+1)

*Models
reg logcslts jihadist suicide age intas ties sponsors i.ccode, r
reg logks jihadist suicide age intas ties sponsors i.ccode, r
reg logwd jihadist suicide age intas ties sponsors i.ccode, r
reg logatks jihadist suicide age intas ties sponsors i.ccode, r

