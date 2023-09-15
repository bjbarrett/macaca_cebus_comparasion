library(cmdstanr)
library(rethinking)

m0 <- ulam(
  alist(
    weight_g ~ dgamma2(mu,scale),
    log(mu) <- a  ,
    a ~ normal(5.5,1.5), #prior for mean
    scale ~ dexp(0.5)
  ),
  
  data=d_list_tc, cores=4 , warmup=1000 , iter=2000 , sample=TRUE, chains=4, 
)

precis(m0)

m1 <- ulam(
  alist(
    weight_g ~ dgamma2(mu,scale),
    log(mu) <- a + bm*macaca ,
    a ~ normal(5.5,1.5), #prior for mean
    bm ~ normal(0,1) ,
    scale ~ dexp(0.5)
  ),
  
  data=d_list_tc, cores=4 , warmup=1000 , iter=2000 , sample=TRUE, chains=4, 
)

precis(m1 , depth=2)

m2 <- ulam(
  alist(
    length_mm ~ dgamma2(mu,scale),
    log(mu) <- a + bm*macaca ,
    a ~ normal(5.5,1.5), #prior for mean
    bm ~ normal(0,1) ,
    scale ~ dexp(0.5)
  ),
  
  data=d_list_tc, cores=4 , warmup=1000 , iter=2000 , sample=TRUE, chains=4, 
)

precis(m2 , depth=2)

m3 <- ulam(
  alist(
    width_mm ~ dgamma2(mu,scale),
    log(mu) <- a + bm*macaca ,
    a ~ normal(5.5,1.5), #prior for mean
    bm ~ normal(0,1) ,
    scale ~ dexp(0.5)
  ),
  
  data=d_list_tc, cores=4 , warmup=1000 , iter=2000 , sample=TRUE, chains=4, 
)

precis(m3 , depth=2)

m4 <- ulam(
  alist(
    thickness_mm ~ dgamma2(mu,scale),
    log(mu) <- a + bm*macaca ,
    a ~ normal(5.5,1.5), #prior for mean
    bm ~ normal(0,1) ,
    scale ~ dexp(0.5)
  ),
  
  data=d_list_tc, cores=4 , warmup=1000 , iter=2000 , sample=TRUE, chains=4, 
)

precis(m4 , depth=2)
