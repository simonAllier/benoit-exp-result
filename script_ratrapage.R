rep='/media/bgauzens/data/programmes/plantes/simu_interac/simus/simus/benoit-exp-result/results/'
#rep='/media/bgauzens/data/programmes/plantes/simu_interac/simus/simus/tests/'


setwd(rep)

files = list.files(rep, pattern =  "txt")
tab = c()
erreur = 0
to_correct = c()
for (i in 9000:length(files)){
  name_biom = files[i]
  #name_ramets = gsub("biom", "ramets", name_biom) # files with number of ramets
  if (i %% 1000 == 0){
    cat(c("i=", i," % = ", i/120120*100,"\n"))
  }
  fic = tryCatch(read.table(files[i]), 
                 error = function(e){ 
                   erreur <<- erreur + 1
                   to_correct <<- c(to_correct, files[i])}) 
}

res = c()
for (i in 1:erreur){
  compteur = 0
  lines = readLines(to_correct[i])
  for (j in 1:length(lines)){
    if (grepl("<|=|>", lines[j]) != 1){
      compteur = compteur + 1
      if (compteur == 1) {
        res = lines[j]
      }
      if (compteur > 1){
        res = rbind(res, lines[j])
      }  
    }
  }
  write.table(res, file = paste(rep, to_correct[i], sep = ""), row.names = F, col.names = F, quote = F)
}
  

write.table(res, file = paste(rep, to_correct[i], sep = ""), row.names = F, col.names = F, quote = F)

rep1 = '/media/bgauzens/data/programmes/plantes/simu_interac/simus/simus/benoit-exp-result/results_save/'
cop_files = list.files(rep1, pattern = "txt")
for (i in 1: length(cop_files)){
  if (i %% 1000 == 0){
    cat(c("i=", i," % = ", i/120120*100,"\n"))
  }
  if (!file.exists(paste(rep, cop_files[i], sep =""))){
    file.copy(paste(rep1, cop_files[i], sep =""), paste(rep, cop_files[i], sep =""))
  }
}

del_fic = list.files(rep, pattern ="~")
file.remove(del_fic)