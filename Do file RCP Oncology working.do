import excel "C:\Users\SWEED\Downloads\Wilfried_Etude_Oncology\Sub-regional networking in neuro-oncology.xlsx", sheet("Sheet1") firstrow clear
edit
ta Pays
cou
import excel "C:\Users\SWEED\Downloads\Wilfried_Etude_Oncology\Sub-regional networking in neuro-oncology.xlsx", sheet("Sheet1") firstrow clear
ta Pays
ta Status
tab1 Nb_neurochirurgien Nb_neurochirurgien Nb_Neuroradiologues Nb_Anatomopathologistes Nb_oncologues_medicaux Nb_Radiotherapeute Nb_infirmiers_neuro_oncologie
ta Status
tab1 Nb_neurochirurgien Nb_neurochirurgien Nb_Neuroradiologues Nb_Anatomopathologistes Nb_oncologues_medicaux Nb_Radiotherapeute Nb_infirmiers_neuro_oncologie
tab1 Nb_neurochirurgien Nb_neurochirurgien Nb_Neuroradiologues Nb_Anatomopathologistes Nb_oncologues_medicaux Nb_Radiotherapeute Nb_infirmiers_neuro_oncologie
import excel "C:\Users\SWEED\Downloads\Wilfried_Etude_Oncology\Sub-regional networking in neuro-oncology.xlsx", sheet("Sheet1") firstrow clear
tab1 Nb_neurochirurgien Nb_neurochirurgien Nb_Neuroradiologues Nb_Anatomopathologistes Nb_oncologues_medicaux Nb_Radiotherapeute Nb_infirmiers_neuro_oncologie
edit Nb_infirmiers_neuro_oncologie
replace Nb_infirmiers_neuro_oncologie = "[6-10[" in 30
ta Nb_infirmiers_neuro_oncologie
ta Doyouhaveamultidisciplinaryc
ta Doyouhaveamultidisciplinaryc : by Pays
edit
save "C:\Users\SWEED\Downloads\Wilfried_Etude_Oncology\Data Reseautage_Wilfries.dta"
bysort Pays : ta Doyouhaveamultidisciplinaryc
bysort Pays : ta Nb_neurochirurgien
bysort Pays : ta Nb_Neuroradiologues
log using "C:\Users\SWEED\Downloads\Wilfried_Etude_Oncology\Log Wilfried.smcl"
bysort Pays : ta Nb_neurochirurgien
bysort Pays : ta Nb_Neuroradiologues
bysort Pays : ta Nb_Anatomopathologistes
bysort Pays : ta Nb_oncologues_medicaux
bysort Pays : ta Nb_Radiotherapeute
bysort Pays : ta Nb_infirmiers_neuro_oncologie
ta Doyouhaveamultidisciplinaryc
ta Pays Doyouhaveamultidisciplinaryc, ro chi ex
tab1 IfYesfrequencyofmeetings
ta Doyouhaveamultidisciplinaryc
ta Doyouhaveamultidisciplinaryc IfYesfrequencyofmeetings
ta IfnotWhydontyouhaveamult
ta Ifnotareeffortsbeingmadeto
ta IfYesfrequencyofmeetings if Doyouhaveamultidisciplinaryc=="YES"
ta Pays IfYesfrequencyofmeetings if Doyouhaveamultidisciplinaryc=="YES", ro chi ex
ta IfnotWhydontyouhaveamult
ta Ifnotareeffortsbeingmadeto
ta Pays IfnotWhydontyouhaveamult
ta Ifnotareeffortsbeingmadeto
edit IfnotWhydontyouhaveamult
edit IfnotWhydontyouhaveamult
save "C:\Users\SWEED\Downloads\Wilfried_Etude_Oncology\Data Reseautage_Wilfries.dta", replace
ta raison
drop raison
tab1 raison_inexistence_1 raison_inexistence_2 raison_inexistence_3 raison_inexistence_4
ta Pays
gen Exist_Pays=0
replace Exist_Pays=1 if Pays=="Benin"
replace Exist_Pays=1 if Pays=="Burkina Faso"
replace Exist_Pays=0
replace Exist_Pays=1 if Pays=="Mali" | Pays=="Nigeria"
replace Exist_Pays=2 if Pays=="Senegal" | Pays=="Ghana"  | Pays=="Cote d'Ivoire"
save "C:\Users\SWEED\Downloads\Wilfried_Etude_Oncology\Data Reseautage_Wilfries.dta", replace
tab1 raison_inexistence_1 raison_inexistence_2 raison_inexistence_3 raison_inexistence_4
gen Connexion= (raison_inexistence_1=="Difficulty connecting with other disciplines" | raison_inexistence_2=="Difficulty connecting with other disciplines" | raison_inexistence_3=="Difficulty connecting with other disciplines" | raison_inexistence_4=="Difficulty connecting with other disciplines")
rename Connexion Connexion_disciplines
rename Connexion_disciplines Connexion_interdisciplines
save "C:\Users\SWEED\Downloads\Wilfried_Etude_Oncology\Data Reseautage_Wilfries.dta", replace
gen ResHumaines= (raison_inexistence_1=="Lack of human resources" | raison_inexistence_2=="Lack of human resources" | raison_inexistence_3=="Lack of human resources" | raison_inexistence_4=="Lack of human resources")
gen Defaut_Leadership= (raison_inexistence_1=="Lack of leadership" | raison_inexistence_2=="Lack of leadership" | raison_inexistence_3=="Lack of leadership" | raison_inexistence_4=="Lack of leadership")
gen Syst_inoperant= (raison_inexistence_1=="Not ready enough" | raison_inexistence_2=="Not ready enough" | raison_inexistence_3=="Not ready enough" | raison_inexistence_4=="Not ready enough")
save "C:\Users\SWEED\Downloads\Wilfried_Etude_Oncology\Data Reseautage_Wilfries.dta", replace
tab1 ResHumaines Defaut_Leadership Syst_inoperant
tab1 ResHumaines Defaut_Leadership Syst_inoperantif Doyouhaveamultidisciplinaryc=="YES"
tab1 ResHumaines Defaut_Leadership Syst_inoperant if Doyouhaveamultidisciplinaryc=="YES"
tab1 ResHumaines Defaut_Leadership Syst_inoperant if Doyouhaveamultidisciplinaryc!="YES"
tab1 Connexion_interdisciplines ResHumaines Defaut_Leadership Syst_inoperant if Doyouhaveamultidisciplinaryc!="YES"
bysort Pays : tab1 Connexion_interdisciplines ResHumaines Defaut_Leadership Syst_inoperant if Doyouhaveamultidisciplinaryc!="YES"
save "C:\Users\SWEED\Downloads\Wilfried_Etude_Oncology\Data Reseautage_Wilfries.dta", replace
ta Experienceinneurooncology
replace Experienceinneurooncology="3-5 years" if Experienceinneurooncology=="3 â?? 5 years"
ta Experienceinneurooncology
ta Wouldyouagreewiththeintroduc
ta 
ta AF
ta DoyouknowSNOOSSASocietyfor
ta HaveyoueverattendedaSNOSSAc
ta Whatdoyouthinkofthecreation
ta HaveyoueverattendedaSNOSSAc if DoyouknowSNOOSSASocietyfor=="YES"
ta Whatdoyouthinkofthecreation
ta Experienceinneurooncology
ta Numberofcasesconsultationyear
ta NeurooncologyinterventionsExc
ta Ifyesnumberofcasesyear
ta Excisionsurgeryunderawakecond
ta Stereotacticbiopsy
ta Doyouperformanatomopathologic
ta Excisionsurgeryunderawakecond
ta IfYesnumberofcases
ta IfYesnumberofcasesyear
ta Doyouperformanatomopathologic
ta Clinicaltrialprotocol
tab1 Doyouperformanatomopathologic DoyouperformImmunohistochemis DoyouperformBiomolecularexami Doyouperformachemotherapy
