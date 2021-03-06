\name{growth_exp}

\title{
Exponential growth
}
\description{
Assuming an exponential behavior estimates the population size at time t, the growth rate, or population at time 0.
}
\usage{
growth_exp(Nt = NULL, N0 = NULL, r = NULL, t0, t, time_interval, date = FALSE)
}

\arguments{
  \item{Nt}{
The population at time t. If null and date = FALSE, then estimate the population at time t.
}
  \item{N0}{
The population at time 0. If null and date = FALSE, then estimate the population at time 0.
}
  \item{r}{
The growth rate. If null and date = FALSE, then estimate the growth rate for the time period [t0,t].
}
  \item{t0}{
An object of class character with the date for the first population.
}
  \item{t}{
An object of class character with the date for the second population.
}
  \item{time_interval}{
A string with the time interval to calculate Delta_t.
}
  \item{date}{
logical. If TRUE, then estimates the moment t when Nt reaches a specific value.
}
}

\value{
growth_exp returns a data frame with N0, Ntr, t0, t, delta, and time_interval for desire parameters.
}

\examples{
# According to the Panama census of 2000-05-14, the population was 2,839,177. The 2010-05-16 census calculated a population of 3,405,813.

# To get r:

growth_exp(N0=2839177, Nt=3405813, t0="2000-05-14", t="2010-05-16", time_interval = "years")

# To get Nt at 2000-06-30:

growth_exp(N0=2839177, r=0.0182, t0="2000-05-14", t="2000-06-30", time_interval = "years")

# The time when the population will be 5,000,000.

growth_exp(N0=2839177, Nt=5000000, r=0.0182, t0="2000-05-14", date=TRUE)

}
