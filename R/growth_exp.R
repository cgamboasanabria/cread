growth_exp <- function(Nt=NULL, N0=NULL, r=NULL, t0, t, time_interval, date=FALSE){

    if(date){

        if(date & (is.null(N0) | is.null(r) | is.null(Nt))){

            stop("When date=TRUE, N0, Nt and r are needed")

        }else({

            delta <- (log(Nt)-log(N0))/r
            t <- lubridate::date_decimal(lubridate::decimal_date(lubridate::ymd(t0))+delta)
            time_interval <- "years"
        })}else({

            if(((is.null(Nt) & is.null(N0)) | (is.null(Nt) & is.null(r)) | (is.null(N0) & is.null(r)))){
                stop("At least two from Nt, N0 and r must be a numeric value when date=FALSE")

            }else({

                delta <- lubridate::interval(lubridate::ymd(t0),lubridate::ymd(t))
                delta <- eval(parse(text = paste("delta/lubridate::", time_interval, "(1)", sep="")))

                if(delta<=0){

                    stop("t0 can't be greater than t")

                }else({

                    if(!is.null(Nt) & !is.null(N0) & is.null(r)){

                        r <- (1/delta)*log(Nt/N0)

                    }

                    if(is.null(Nt) & !is.null(N0) & !is.null(r)){

                        Nt <- N0*exp(r*delta)

                    }

                    if(!is.null(Nt) & is.null(N0) & !is.null(r)){

                        N0 <- Nt/exp(r*delta)

                    }
                })
            })

        })

    data.frame(N0=as.integer(N0), Nt=as.integer(Nt), r=round(r, 4), t0=t0, t=paste(t),
               delta=ifelse(date==FALSE, paste(round(delta, 4)), delta), time_interval)

}
