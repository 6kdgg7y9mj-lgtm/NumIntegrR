#' Integration numerique par la methode de Monte-Carlo
#'
#' Cette fonction approxime l'integrale d'une fonction sur un intervalle
#' en utilisant des points generes aleatoirement.
#'
#' @importFrom stats runif
#'
#' @param f Une fonction R à integrer.
#' @param a La borne inferieure de l'intervalle.
#' @param b La borne superieure de l'intervalle.
#' @param n Le nombre de points aleatoires. Doit etre un entier positif.
#'
#' @return Une valeur numerique correspondant à l'approximation de l'integrale.
#'
#' @examples
#' f <- function(x) x^2
#' monte_carlo_integral(f, a = 0, b = 4, n = 10000)
#'
#' @export
monte_carlo_integral <- function(f, a, b, n = 10000) {

  # Verifier que f est bien une fonction
  if (!is.function(f)) {
    stop("f doit etre une fonction.")
  }

  # Verifier que n est un entier positif
  if (length(n) != 1 || !is.numeric(n) || n <= 0 || n != as.integer(n)) {
    stop("n doit etre un entier positif.")
  }

  # Verifier les bornes
  if (!is.numeric(a) || !is.numeric(b) ||
      length(a) != 1 || length(b) != 1 || a >= b) {
    stop("a et b doivent etre deux nombres avec a < b.")
  }

  # Generer n points aleatoires uniformement repartis entre a et b
  x <- runif(n, min = a, max = b)

  # Calculer l'approximation de l'integrale
  resultat <- (b - a) * mean(f(x))

  return(resultat)
}
