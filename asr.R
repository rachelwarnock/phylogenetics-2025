
set.seed(123)

tr <- ape::rtree(6)

states <- sample(c(0,1), 6 , replace = TRUE)
dat <- setNames(states, tr$tip.label)

# fit ARD model
Mk_fit <- phytools::fitMk(tr, dat, model="ER")

anc_states <- phytools::ancr(Mk_fit)

cols<-setNames(c("blue","red"),levels(dat))
plot(anc_states,
     args.plotTree=list(lwd=2,direction="upwards",
                        mar=c(0.1,1.1,2.1,1.1),fsize=0.8),
     args.nodelabels=list(piecol=cols),
     args.tiplabels=list(cex=0.3),
     legend="bottomright")
mtext("Marginal states under the ER model",adj=0)
