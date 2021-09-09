destring ties, replace
destring sponsors, replace

*Jihadist Intensity coding
gen jihadintens = 0
replace jihadintens = 1 if local == 1
replace jihadintens = 2 if rev == 1
replace jihadintens = 3 if caliph == 1
replace jihadintens = 4 if apoc == 1

*Country FEs
encode country, gen(ccode)

*Log of Lethality
gen logleth = log(lethality+1)

*Models 1-2
reg logleth jihadintens suicide age intas ties sponsors, r
reg logleth jihadintens suicide age intas ties sponsors i.ccode, r
